From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jul 2018 00:11:25 +0200
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
Message-ID: <86b27f1d-0432-6258-6dc3-66de9cd5615a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-18 23:42, Thomas Petazzoni wrote:
> The check_musl function currently builds a program and verifies if the
> program interpreter starts with /lib/ld-musl. While this works fine
> for dynamically linked programs, this obviously doesn't work for a
> purely static musl toolchain such as [1].
> 
> There is no easy way to identify a toolchain as using the musl C
> library. For glibc, dynamic linking is always supported, so we look at
> the dynamic linker name. For uClibc, there is a distinctive
> uClibc_config.h header file. There is no such distinctive feature in
> musl.
> 
> We end up resorting to looking for the string MUSL_LOCPATH, which is
> used by musl locale_map.c source file. This string has been present in
> musl since 2014. It certainly isn't a very stable or convincing
> solution to identify the C library as being musl, but it's the best we
> could find.
> 
> Note that we are sure there is a libc.a file, because the
> check_unusable_toolchain function checks that there is a such a file.
> 
> [1] http://autobuild.buildroot.net/toolchains/tarballs/br-arm-musl-static-2018.05.tar.bz2
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 I looked long and hard for a better alternative, but I couldn't find anything.
I also thought of testing whether __GLIBC__ is defined, but that's not very
stable either (any non-musl library that doesn't define __GLIBC__, including
bionic and newlib, would also be detected as musl).

 Therefore:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  toolchain/helpers.mk                                   | 9 +++------
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +--
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 1792286add..e5520c00c3 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -241,14 +241,11 @@ check_glibc = \
>  # $2: cross-readelf path
>  check_musl = \
>  	__CROSS_CC=$(strip $1) ; \
> -	__CROSS_READELF=$(strip $2) ; \
> -	echo 'void main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
> -	if ! $${__CROSS_READELF} -l $(BUILD_DIR)/.br-toolchain-test.tmp 2> /dev/null | grep 'program interpreter: /lib/ld-musl' -q; then \
> -		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
> +	libc_a_path=`$${__CROSS_CC} -print-file-name=libc.a` ; \
> +	if ! strings $${libc_a_path} | grep -q MUSL_LOCPATH ; then \
>  		echo "Incorrect selection of the C library" ; \
>  		exit -1; \
> -	fi ; \
> -	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
> +	fi
>  
>  #
>  # Check the conformity of Buildroot configuration with regard to the
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8b2c283654..02d992531d 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -557,8 +557,7 @@ define $(2)_CONFIGURE_CMDS
>  		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
>  	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
>  		$$(call check_musl,\
> -			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)",\
> -			$$(TOOLCHAIN_EXTERNAL_READELF)) ; \
> +			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
>  	else \
>  		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
>  	fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
