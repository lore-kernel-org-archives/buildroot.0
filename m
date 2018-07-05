From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jul 2018 05:54:18 +0300
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180705025418.dkit5uzdtwfezkgc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 04, 2018 at 11:42:57PM +0200, Thomas Petazzoni wrote:
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

So the check should work even for dynamic only toolchains, right?

> [1] http://autobuild.buildroot.net/toolchains/tarballs/br-arm-musl-static-2018.05.tar.bz2
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

This comment is redundant now.

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

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
