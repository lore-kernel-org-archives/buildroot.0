From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 21:00:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/tpm2-pkcs11: new package
In-Reply-To: <SGDgZj-pm-mozXqzyYLgjWGtvHWsy8qa1Kw6VF-fcpovCSrMu0Qs7Ry7qCgTBZGY5YN_G52hu2w2tOTmfw2y6LvTNUWBN71P9sXb-A0JjTU=@protonmail.com>
References: <SGDgZj-pm-mozXqzyYLgjWGtvHWsy8qa1Kw6VF-fcpovCSrMu0Qs7Ry7qCgTBZGY5YN_G52hu2w2tOTmfw2y6LvTNUWBN71P9sXb-A0JjTU=@protonmail.com>
Message-ID: <20201229200028.GW1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yair, All,

On 2020-12-22 10:32 +0000, Yair Ben-Avraham via buildroot spake thusly:
> A PKCS#11 interface for TPM2 hardware
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
[--SNIP--]
> diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
> new file mode 100644
> index 0000000000..ab7ad02480
> --- /dev/null
> +++ b/package/tpm2-pkcs11/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_TPM2_PKCS11
> +	bool "tpm2-pkcs11"
> +	depends on !BR2_STATIC_LIBS # tpm2-tss
> +	select BR2_PACKAGE_LIBYAML
> +	select BR2_PACKAGE_P11_KIT
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_TPM2_TOOLS
> +	select BR2_PACKAGE_TPM2_TSS

You need to propagate the dependencies of all the packages you select:

    p11-kit depends on !static, MMU, and threads

When you propagate a dependency from two packages, you should add both
to the comment:

    depends on !BR2_STATIC_LIBS # tpm2-tss, p11-kit

> +	help
> +	  A PKCS#11 interface for TPM2 hardware
> +
> +	  https://github.com/tpm2-software/tpm2-pkcs11
> +
> +comment "tpm2-pkcs11 needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> new file mode 100644
> index 0000000000..16dd9166ba
> --- /dev/null
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  13425c34358ec798d333743099b9aec5e42f6a4653c4c0e40eb075681f369687  tpm2-pkcs11-1.5.0.tar.gz
> +sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> new file mode 100644
> index 0000000000..14ff1e4e07
> --- /dev/null
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# tpm2-pkcs11
> +#
> +################################################################################
> +
> +TPM2_PKCS11_VERSION = 1.5.0
> +TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
> +TPM2_PKCS11_LICENSE = BSD-2-Clause
> +TPM2_PKCS11_LICENSE_FILES = LICENSE
> +TPM2_PKCS11_DEPENDENCIES = libyaml p11-kit sqlite tpm2-tools tpm2-tss
> +
> +TPM2_PKCS11_CONF_OPTS += \
> +		--disable-hardening \
> +		--with-p11kitconfigdir=/../usr/share/p11-kit/modules

Why the leading /../ ?

> +# Fix tpm.c:746:5: error: 'for' loop initial declarations are only allowed in C99 mode
> +# Fix implicit declaration of function 'strnlen'
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
> +TPM2_PKCS11_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

Why does it only matter for the CS ARM toolchain?

> +endif
> +
> +# do not build man pages
> +TPM2_PKCS11_CONF_ENV += ac_cv_prog_PANDOC=''
> +
> +ifeq ($(BR2_PACKAGE_TPM2_TOOLS),y)
> +TPM2_PKCS11_CONF_ENV += \
> +	ac_cv_prog_tpm2_createprimary=yes \
> +	ac_cv_prog_tpm2_create=yes \
> +	ac_cv_prog_tpm2_evictcontrol=yes \
> +	ac_cv_prog_tpm2_readpublic=yes \
> +	ac_cv_prog_tpm2_load=yes \
> +	ac_cv_prog_tpm2_loadexternal=yes \
> +	ac_cv_prog_tpm2_unseal=yes \
> +	ac_cv_prog_tpm2_encryptdecrypt=yes \
> +	ac_cv_prog_tpm2_sign=yes \
> +	ac_cv_prog_tpm2_getcap=yes \
> +	ac_cv_prog_tpm2_import=yes \
> +	ac_cv_prog_tpm2_changeauth=yes
> +endif

What are those for? A little blurb in the commit log would be nice...

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> --
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
