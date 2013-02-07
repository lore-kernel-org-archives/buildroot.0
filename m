From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 14:44:43 +0100
Subject: [Buildroot] [PATCH] pkg-infra: start using <pkg>_CONFIG_FIXUP,
 part 1
In-Reply-To: <1360155924-4468-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1360155924-4468-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <CAHXCMMK5FQ7mbgtWd9FZR_q_5MwZCtQR=_KXsPPX73EhGue=jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

2013/2/6 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
> This patch will update those package *.mk files that are already
> using some per-package fix of *-config files to use more generic
> <pkg>_CONFIG_FIXUP variable making *.mk files more smaller,
> neater and easier to eyes.
>
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
> This package list was taked directly from Samuel Martins post
> http://lists.busybox.net/pipermail/buildroot/2013-January/065814.html
>
> Only package from that Samuels list that I left out was imlib2 because
> it dropped -L flag completely out from it's *-config file.
> Is it safe to convert imlib2 to <pkg>_CONFIG_FIXUP or left it out?
>
>  package/cups/cups.mk                   |   10 +---------
>  package/directfb/directfb.mk           |    9 +--------
>  package/divine/divine.mk               |    9 +--------
>  package/freetype/freetype.mk           |   11 +----------
>  package/gd/gd.mk                       |    9 +--------
>  package/giblib/giblib.mk               |    9 +--------
>  package/icu/icu.mk                     |    9 +--------
>  package/libcurl/libcurl.mk             |    6 +-----
>  package/libdvdnav/libdvdnav.mk         |    8 +-------
>  package/libdvdread/libdvdread.mk       |    7 +------
>  package/libgcrypt/libgcrypt.mk         |   10 +---------
>  package/libmcrypt/libmcrypt.mk         |    9 +--------
>  package/libnspr/libnspr.mk             |    9 +--------
>  package/libpng/libpng.mk               |   11 +----------
>  package/libusb-compat/libusb-compat.mk |    9 +--------
>  package/libxml2/libxml2.mk             |    8 +-------
>  package/libxslt/libxslt.mk             |    9 +--------
>  package/ncurses/ncurses.mk             |    8 +-------
>  package/neon/neon.mk                   |    9 +--------
>  package/netsnmp/netsnmp.mk             |   11 +----------
>  package/pcre/pcre.mk                   |    9 +--------
>  package/php/php.mk                     |   10 +---------
>  22 files changed, 22 insertions(+), 177 deletions(-)
>
[...]
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index be0f1a7..b4ff322 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -8,6 +8,7 @@ FREETYPE_VERSION = 2.4.11
>  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>  FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
>  FREETYPE_INSTALL_STAGING = YES
> +FREETYPE_CONFIG_FIXUP = freetype-config
>  FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
>  FREETYPE_LICENSE = Dual FTL/GPLv2+
>  FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
> @@ -17,16 +18,6 @@ FREETYPE_DEPENDENCIES = host-pkgconf \
>
>  HOST_FREETYPE_DEPENDENCIES = host-pkgconf
>
> -define FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
> -       $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
> -               -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
> -               $(STAGING_DIR)/usr/bin/freetype-config
I guess doing nothing for includir and libdir is ok, but I'd like you
confirm it (could be in the commit message).

> -endef
> -
> -FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
> -
>  define FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
>         rm -f $(TARGET_DIR)/usr/bin/freetype-config
>  endef
[...]
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index d834876..1daa4f4 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -12,16 +12,7 @@ LIBPNG_LICENSE = libpng license
>  LIBPNG_LICENSE_FILES = LICENSE
>  LIBPNG_INSTALL_STAGING = YES
>  LIBPNG_DEPENDENCIES = host-pkgconf zlib
> -
> -define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
> -       $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng$(LIBPNG_SERIES)\',g" \
> -               -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
> -               $(STAGING_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config
ditto

> -endef
> -
> -LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
> +LIBPNG_CONFIG_FIXUP = libpng$(LIBPNG_SERIES)-config
>
>  define LIBPNG_REMOVE_CONFIG_SCRIPTS
>         $(RM) -f $(TARGET_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config \
> diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
> index 848c705..60c1ea9 100644
[...]
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index a35b955..5243d7a 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -7,6 +7,7 @@
>  LIBXSLT_VERSION = 1.1.28
>  LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
>  LIBXSLT_INSTALL_STAGING = YES
> +LIBXSLT_CONFIG_FIXUP = xslt-config
>  LIBXSLT_LICENSE = MIT
>  LIBXSLT_LICENSE_FILES = COPYING
>
> @@ -27,14 +28,6 @@ HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
>
>  HOST_LIBXSLT_DEPENDENCIES = host-libxml2
>
> -define LIBXSLT_XSLT_CONFIG_FIXUP
> -       $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
> -       $(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
> -       $(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/xslt-config
ditto

> -endef
> -
> -LIBXSLT_POST_INSTALL_STAGING_HOOKS += LIBXSLT_XSLT_CONFIG_FIXUP
> -
>  define LIBXSLT_REMOVE_CONFIG_SCRIPTS
>         $(RM) -f $(TARGET_DIR)/usr/bin/xslt-config
>  endef
[...]
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 2670cf3..00fa866 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -10,6 +10,7 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
>  NETSNMP_LICENSE = Various BSD-like
>  NETSNMP_LICENSE_FILES = COPYING
>  NETSNMP_INSTALL_STAGING = YES
> +NETSNMP_CONFIG_FIXUP = net-snmp-config
>  NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
>  NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
>                 --with-defaults --enable-mini-agent --without-rpm \
> @@ -80,14 +81,4 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
>         rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
>  endef
>
> -define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
> -       $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> -               -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
> -               -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
> -               $(STAGING_DIR)/usr/bin/net-snmp-config
ditto

> -endef
> -
> -NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
> -
>  $(eval $(autotools-package))
[...]

Regards,


-- 
Samuel
