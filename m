From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Oct 2020 16:51:14 +0300
Subject: [Buildroot] [PATCH 1/1 v2] tpm2-tss: bump version to 3.0.1
In-Reply-To: <3Th9t2mBSy5hkEHAI2UZCRoYJOft59QKd_WOQIvhfqFXB55dW3m-jYlZyEsr9m4ap_o4muM43xth7yHKaIMn-g2uRp_IbDmHCcjfbb9oc0s=@protonmail.com>
References: <3Th9t2mBSy5hkEHAI2UZCRoYJOft59QKd_WOQIvhfqFXB55dW3m-jYlZyEsr9m4ap_o4muM43xth7yHKaIMn-g2uRp_IbDmHCcjfbb9oc0s=@protonmail.com>
Message-ID: <87a6wovru5.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

On Wed, Oct 14 2020, Yair Ben-Avraham via buildroot wrote:
> - 0001-Temporary-fix-for-build-without-C.patch, AC_PROG_CXX line
>   number changed.
> - Makefile-fuzz-generated.am now in size zero.
> - json-c, libcurl: new dependencies since tpm2-tss version 2.4.0
>
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  ...0001-Temporary-fix-for-build-without-C.patch | 17 +++++++++--------
>  package/tpm2-tss/Config.in                      |  2 ++
>  package/tpm2-tss/tpm2-tss.hash                  |  4 ++--
>  package/tpm2-tss/tpm2-tss.mk                    | 13 ++-----------
>  4 files changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> index b2a9cb4f78..52599c59b5 100644
> --- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> +++ b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> @@ -1,6 +1,6 @@
> -From 158d0bc3a2a7a93090cc12c5b0dd3c27e6f44d61 Mon Sep 17 00:00:00 2001
> -From: Carlos Santos <unixmania@gmail.com>
> -Date: Mon, 23 Dec 2019 08:02:19 -0300
> +From 1b6cf0cac181b96a7454b79fc15b7e5dd138129f Mon Sep 17 00:00:00 2001
> +From: Yair Ben-Avraham <yairba@protonmail.com>
> +Date: Wed, 14 Oct 2020 09:12:29 +0200

You should keep the original patch author.

>  Subject: [PATCH] Temporary fix for build without C++
>
>  C++ is required only for the fuzzing tests but AC_PROG_CXX is included
> @@ -23,22 +23,23 @@ Fixes:
>  1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
>
>  Signed-off-by: Carlos Santos <unixmania@gmail.com>

Add here a comment like:

[yairba: rebase on version 3.0.1]

> +Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
>  ---
>   configure.ac | 1 -
>   1 file changed, 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index cd50451d..a3bd7144 100644
> +index a4365886..d87058cf 100755
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -25,7 +25,6 @@ AC_CANONICAL_HOST
> - AX_IS_RELEASE(dash-version)
> +@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
>   AX_CHECK_ENABLE_DEBUG([info])
>
> --AC_PROG_CXX
>   AC_PROG_CC
> +-AC_PROG_CXX
>   AC_PROG_LN_S
>   AC_USE_SYSTEM_EXTENSIONS
> + LT_INIT()
>  --
> -2.18.1
> +2.20.1
>
> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> index 2d619750f8..bb49c0a008 100644
> --- a/package/tpm2-tss/Config.in
> +++ b/package/tpm2-tss/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_TPM2_TSS
>  	bool "tpm2-tss"
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_JSON_C

You need to propagate json-c dependency on BR2_TOOLCHAIN_HAS_SYNC_4.

Otherwise, looks good to me.

baruch

>  	select BR2_PACKAGE_LIBURIPARSER
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index 3b778d4f1e..49432314d0 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256 9d8c8866829e3ff5e1649ecd82498cb1329e0691139458e53b69e6061febe3d3  tpm2-tss-2.3.3.tar.gz
> -sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> +sha256  2432533a1cac0f0d15d0337d2f0a23591a50b36aad68ab72412ce694818b7e76  tpm2-tss-3.0.1.tar.gz
> +sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 470020857a..64eb161b70 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>
> -TPM2_TSS_VERSION = 2.3.3
> +TPM2_TSS_VERSION = 3.0.1
>  TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>  TPM2_TSS_LICENSE = BSD-2-Clause
>  TPM2_TSS_LICENSE_FILES = LICENSE
>  TPM2_TSS_INSTALL_STAGING = YES
> -TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
> +TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf json-c libcurl
>  TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
>  # 0001-configure-Only-use-CXX-when-fuzzing.patch
>  TPM2_TSS_AUTORECONF = YES
> @@ -17,13 +17,4 @@ TPM2_TSS_AUTORECONF = YES
>  # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
>  TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>
> -# The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am
> -# with content from a fuzz testing run rather than an empty file,
> -# confusing autoreconf with
> -# 0001-configure-Only-use-CXX-when-fuzzing.patch
> -define TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> -	truncate -s 0 $(@D)/Makefile-fuzz-generated.am
> -endef
> -TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> -
>  $(eval $(autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
