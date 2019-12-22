From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:15:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-nfc: new package
In-Reply-To: <20191221095858.8680-1-aussedat.louis@gmail.com>
References: <20191221095858.8680-1-aussedat.louis@gmail.com>
Message-ID: <20191222101544.GS26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis, All,

On 2019-12-21 10:58 +0100, Louis Aussedat spake thusly:
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
[--SNIP--]
> diff --git a/package/libpam-nfc/Config.in b/package/libpam-nfc/Config.in
> new file mode 100644
> index 0000000000..5baa5d76f5
> --- /dev/null
> +++ b/package/libpam-nfc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBPAM_NFC
> +	bool "libpam-nfc"
> +    select BR2_PACKAGE_LIBNFC

Leading TAB, not spaces; run:  make check-package

> +	help
> +	  NFC-based PAM authentification module.
> +
> +	  https://github.com/nfc-tools/pam_nfc
[--SNIP--]
> diff --git a/package/libpam-nfc/libpam-nfc.mk b/package/libpam-nfc/libpam-nfc.mk
> new file mode 100644
> index 0000000000..fc1eb72b47
> --- /dev/null
> +++ b/package/libpam-nfc/libpam-nfc.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# libpam-nfc
> +#
> +################################################################################
> +
> +LIBPAM_NFC_VERSION = bb762e0e649195110e015ffb605c4375e927c437
> +LIBPAM_NFC_SITE = $(call github,nfc-tools,pam_nfc,$(LIBPAM_NFC_VERSION))
> +LIBPAM_NFC_LICENSE = GPL-2.0
> +LIBPAM_NFC_LICENSE_FILES = COPYING
> +LIBPAM_NFC_DEPENDENCIES = linux-pam libnfc
> +# Fetching from github, we need to generate the configure script
> +LIBPAM_NFC_AUTORECONF = YES
> +LIBPAM_NFC_INSTALL_STAGING = YES
> +
> +LIBPAM_NFC_CONF_OPTS = \
> +	--with-pam-dir=/lib/security
> +
> +# libpam breaks with parallel build, but is very fast to build.
> +# build single threaded.
> +define LIBPAM_NFC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)

What about:

    LIBPAM_NFC_MAKE = $(MAKE1)

Regards,
Yann E. MORIN.

> +endef
> +
> +# Autoreconf requires an existing m4 directory
> +define LIBPAM_NFC_MKDIR_M4
> +	mkdir -p $(@D)/m4
> +endef
> +LIBPAM_NFC_PRE_CONFIGURE_HOOKS += LIBPAM_NFC_MKDIR_M4
> +
> +$(eval $(autotools-package))
> -- 
> 2.24.0
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
