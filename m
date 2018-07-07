From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jul 2018 13:56:17 +0200
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <2a850fef-a581-170d-0945-e8a4182b4347@mind.be>
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
 <2a850fef-a581-170d-0945-e8a4182b4347@mind.be>
Message-ID: <20180707115617.GA2507@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-07-06 00:25 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 04-07-18 23:42, Thomas Petazzoni wrote:
> > The check_musl function currently builds a program and verifies if the
> > program interpreter starts with /lib/ld-musl. While this works fine
> > for dynamically linked programs, this obviously doesn't work for a
> > purely static musl toolchain such as [1].
> > 
> > There is no easy way to identify a toolchain as using the musl C
> > library. For glibc, dynamic linking is always supported, so we look at
> > the dynamic linker name. For uClibc, there is a distinctive
> > uClibc_config.h header file. There is no such distinctive feature in
> > musl.
> > 
> > We end up resorting to looking for the string MUSL_LOCPATH, which is
> > used by musl locale_map.c source file. This string has been present in
> > musl since 2014. It certainly isn't a very stable or convincing
> > solution to identify the C library as being musl, but it's the best we
> > could find.
> 
>  Well, the most obvious indicator is the output of gcc -dumpmachine... Is there
> any reason why we wouldn't be able to treat that as reliable? AFAIU, hundreds of
> autotools package will fail if the dumpmachine tuple is not something sane...

Does that still output the correct tupple for multilib toolchains?

For example, the mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
toolchain is a big-multi-lib toolchain, with both glibc and uclibc, but
it always returns mips-linux-gnu, even when either is explicitly
requested:

    $ ./mips-2016.05/bin/mips-linux-gnu-gcc -dumpmachine
    mips-linux-gnu
    $ ./mips-2016.05/bin/mips-linux-gnu-gcc -mglibc -dumpmachine
    mips-linux-gnu
    $ ./mips-2016.05/bin/mips-linux-gnu-gcc -muclibc -dumpmachine
    mips-linux-gnu

So that unfortunately does not work... :-(

Regards,
Yann E. MORIN.

>  BTW, we do all these checks for libc etc., but we don't even check for the
> architecture... E.g. trying to use an arm compiler with BR2_armeb gives the
> rather unhelpful:
> 
> Cannot execute cross-compiler '.../opt/ext-toolchain/bin/armeb-linux-gcc.br_real'
> 
> So, if you're a little bit savvy, you notice that the toolchain prefix is wrong,
> so you set BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX to arm-linux- instead of
> $(ARCH)-linux. And it all works! Happily generating little-endian binaries...
> 
>  Bottom line: perhaps we should just check the tuple. That way we check the
> arch, we check that it's a hosted linux toolchain, we check libc, and we can
> even check the ARM ABI, all in one fell swoop...
> 
>  Regards,
>  Arnout
> 
> > 
> > Note that we are sure there is a libc.a file, because the
> > check_unusable_toolchain function checks that there is a such a file.
> > 
> > [1] http://autobuild.buildroot.net/toolchains/tarballs/br-arm-musl-static-2018.05.tar.bz2
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  toolchain/helpers.mk                                   | 9 +++------
> >  toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +--
> >  2 files changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 1792286add..e5520c00c3 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -241,14 +241,11 @@ check_glibc = \
> >  # $2: cross-readelf path
> >  check_musl = \
> >  	__CROSS_CC=$(strip $1) ; \
> > -	__CROSS_READELF=$(strip $2) ; \
> > -	echo 'void main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
> > -	if ! $${__CROSS_READELF} -l $(BUILD_DIR)/.br-toolchain-test.tmp 2> /dev/null | grep 'program interpreter: /lib/ld-musl' -q; then \
> > -		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
> > +	libc_a_path=`$${__CROSS_CC} -print-file-name=libc.a` ; \
> > +	if ! strings $${libc_a_path} | grep -q MUSL_LOCPATH ; then \
> >  		echo "Incorrect selection of the C library" ; \
> >  		exit -1; \
> > -	fi ; \
> > -	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
> > +	fi
> >  
> >  #
> >  # Check the conformity of Buildroot configuration with regard to the
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index 8b2c283654..02d992531d 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -557,8 +557,7 @@ define $(2)_CONFIGURE_CMDS
> >  		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
> >  	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
> >  		$$(call check_musl,\
> > -			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)",\
> > -			$$(TOOLCHAIN_EXTERNAL_READELF)) ; \
> > +			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
> >  	else \
> >  		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
> >  	fi
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
