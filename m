From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 May 2016 23:53:30 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: fix arch-subdir
In-Reply-To: <9d9af24c-2064-3ba2-21ba-5042b0a76b7c@mind.be>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <4a3ee1a4c558263f5d64209bc6f74f8994b80921.1464534979.git.yann.morin.1998@free.fr>
 <9d9af24c-2064-3ba2-21ba-5042b0a76b7c@mind.be>
Message-ID: <20160530215330.GB3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-05-30 23:01 +0200, Arnout Vandecappelle spake thusly:
> On 05/29/16 17:17, Yann E. MORIN wrote:
> > When there is no architecture-specific sub-directory in the sysroot, we
> > expect ARCGH_SUBDIR to be empty.
> > 
> > However, with the current code, it is not (with an intrumented
> > copy_toolchain_sysroot, when copying a ct-ng toolchain):
> > 
> >     >>> toolchain-external undefined Copying external toolchain sysroot to
> >     >>> staging...
> >     main sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
> >     arch sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
> >     arch subdir:  /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
> >     lib dir:      lib
> >     support dir:
> > 
> > ... when we would have expected 'arch subdir' to be empty.
> 
>  So, I checked, and it doesn't hurt that it's not empty, because ARCH_SUBDIR is
> only used within this condition:
> 
> if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ]
> 
> i.e. if SYSROOT == ARCH_SYSROOT, ARCH_SUBDIR will not be used. Makes sense too,
> of course: if there is no arch-specific sysroot directory, then there's no need
> to create the relative symlinks.
> 
>  That said, for consistency it's of course nicer to make ARCH_SUBDIR empty. But
> that's not needed for 2016.05.
> 
> > 
> > Fix the matching pattern to correctly return an empty string if there is
> > no arch subdir.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  toolchain/toolchain-external/toolchain-external.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> > index 47b951d..3af56b8 100644
> > --- a/toolchain/toolchain-external/toolchain-external.mk
> > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > @@ -662,7 +662,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
> >  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
> >  		fi ; \
> >  	fi ; \
> > -	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> > +	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}((.*[^/])/?)?$$:\2:"` ; \
> 
>  Simpler alternative (just tested in the shell, not in an actual build):
> 
> ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -n -r -e
> "\:^$${SYSROOT_DIR}(.*)/$$:s::\1:p"`
> 
> Well, at least I find this regex easier to parse. Also, your version still gives
> a newline (which admittedly will be stripped inside the funciton) while mine is
> really an empty string.

OK, so, after a bit of discussion with Arnout on IRC, we came up to the
conclusion that we were a little bit too focused.

First, my proposal only works when there is an arch subdir that is a
single path component. So it is broken.

SAecond, Arnout's solution is a bit better, but like me he did not see
the full picture in this regexp.

All that this regexp tries to do is to capture whatever is *after* the
main sysroot. That can be achieved quite easily, in fact, and does not
need a convoluted regexp:

    ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}::"



However, there might be a gotcha.

Both SYSROOT_DIR and ARCH_SYSROOT_DIR end with a slash (as can be seen
in my examples).

The previous expression look like it would try to extract a relative
path that would neither start nor end with a slash; we would have gotten
something like:
    armv4
    armv4/thumb
    or/what/ever

This new regexp would extract somthing that would end up with a slash,
however. The number of slashes is important, because that is what is
used to construct a relative path in toolchain/helper.mk:

  123     nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
  124     for slash in `seq 1 $${nbslashs}` ; do \
  125         relpath=$${relpath}"../" ; \
  126     done ; \


So we need to do a second pass at it:

    ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}::; s:/+$$::"

And now we should be back to what is expected.

Absolutely untested, it's too late here, and we all know well what
happens when I test things too late in the evening. Gremlins! ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
