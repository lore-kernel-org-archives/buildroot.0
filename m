From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 11:16:19 +0200
Subject: [Buildroot] [PATCH v4 1/1] tpm2-tss: bump version to 3.0.1
In-Reply-To: <yb7k-xY0l_p3TTfxxlrtmwPBuBcgKRJ4AbluBXMvh1W73w6ul6tSw_Bwltz1CQlJKUIGcM_Y0T9GUpU92ttmWI1gHlw2C8VUGa-FfIaGioQ=@protonmail.com>
References: <yb7k-xY0l_p3TTfxxlrtmwPBuBcgKRJ4AbluBXMvh1W73w6ul6tSw_Bwltz1CQlJKUIGcM_Y0T9GUpU92ttmWI1gHlw2C8VUGa-FfIaGioQ=@protonmail.com>
Message-ID: <20201015111619.49d7ca7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Oct 2020 09:00:13 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> index 2d619750f8..344dabd504 100644
> --- a/package/tpm2-tss/Config.in
> +++ b/package/tpm2-tss/Config.in
> @@ -33,5 +33,27 @@ config BR2_PACKAGE_TPM2_TSS
> 
>  	  https://github.com/tpm2-software/tpm2-tss
> 
> +if BR2_PACKAGE_TPM2_TSS
> +
> +config TPM2_TSS_FAPI

BR2_PACKAGE_TPMS2_TSS_FAPI

> +	bool "tpm2-tss with fapi"
> +	default n

Not needed.

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
> index 470020857a..80e1c9048b 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
> 
> -TPM2_TSS_VERSION = 2.3.3
> +TPM2_TSS_VERSION = 3.0.1
>  TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>  TPM2_TSS_LICENSE = BSD-2-Clause
>  TPM2_TSS_LICENSE_FILES = LICENSE
> @@ -17,13 +17,11 @@ TPM2_TSS_AUTORECONF = YES
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
> +ifeq ($(TPM2_TSS_FAPI),y)

BR2_PACKAGE_TPMS2_TSS_FAPI.

No need to resend just to fix those issues: we'll fix up when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
