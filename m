From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  6 Feb 2013 15:05:24 +0200
Subject: [Buildroot] [PATCH] pkg-infra: start using <pkg>_CONFIG_FIXUP,
	part 1
Message-ID: <1360155924-4468-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will update those package *.mk files that are already
using some per-package fix of *-config files to use more generic
<pkg>_CONFIG_FIXUP variable making *.mk files more smaller,
neater and easier to eyes.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
This package list was taked directly from Samuel Martins post
http://lists.busybox.net/pipermail/buildroot/2013-January/065814.html

Only package from that Samuels list that I left out was imlib2 because
it dropped -L flag completely out from it's *-config file.
Is it safe to convert imlib2 to <pkg>_CONFIG_FIXUP or left it out?

 package/cups/cups.mk                   |   10 +---------
 package/directfb/directfb.mk           |    9 +--------
 package/divine/divine.mk               |    9 +--------
 package/freetype/freetype.mk           |   11 +----------
 package/gd/gd.mk                       |    9 +--------
 package/giblib/giblib.mk               |    9 +--------
 package/icu/icu.mk                     |    9 +--------
 package/libcurl/libcurl.mk             |    6 +-----
 package/libdvdnav/libdvdnav.mk         |    8 +-------
 package/libdvdread/libdvdread.mk       |    7 +------
 package/libgcrypt/libgcrypt.mk         |   10 +---------
 package/libmcrypt/libmcrypt.mk         |    9 +--------
 package/libnspr/libnspr.mk             |    9 +--------
 package/libpng/libpng.mk               |   11 +----------
 package/libusb-compat/libusb-compat.mk |    9 +--------
 package/libxml2/libxml2.mk             |    8 +-------
 package/libxslt/libxslt.mk             |    9 +--------
 package/ncurses/ncurses.mk             |    8 +-------
 package/neon/neon.mk                   |    9 +--------
 package/netsnmp/netsnmp.mk             |   11 +----------
 package/pcre/pcre.mk                   |    9 +--------
 package/php/php.mk                     |   10 +---------
 22 files changed, 22 insertions(+), 177 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 3eb83ea..989b865 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -8,6 +8,7 @@ CUPS_VERSION = 1.3.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_INSTALL_STAGING = YES
+CUPS_CONFIG_FIXUP = cups-config
 CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 CUPS_CONF_OPT = --without-perl \
@@ -61,13 +62,4 @@ CUPS_DEPENDENCIES += host-autoconf
 
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
 
-# Fixup prefix= and exec_prefix= in cups-config
-define CUPS_FIXUP_CUPS_CONFIG
-	$(SED) 's%^prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
-		-e 's%^exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/cups-config
-endef
-
-CUPS_POST_INSTALL_STAGING_HOOKS += CUPS_FIXUP_CUPS_CONFIG
-
 $(eval $(autotools-package))
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 6d5b1ce..735ed50 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -10,6 +10,7 @@ DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
 DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_INSTALL_STAGING = YES
+DIRECTFB_CONFIG_FIXUP = directfb-config
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
@@ -131,14 +132,6 @@ HOST_DIRECTFB_BUILD_CMDS = \
 HOST_DIRECTFB_INSTALL_CMDS = \
 	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
 
-define DIRECTFB_STAGING_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/directfb-config
-endef
-
-DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 1fd27d2..54305d2 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -9,13 +9,6 @@ DIVINE_SITE = http://www.directfb.org/downloads/Extras
 DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
-
-define DIVINE_STAGING_DIVINE_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/divine-config
-endef
-
-DIVINE_POST_INSTALL_STAGING_HOOKS += DIVINE_STAGING_DIVINE_CONFIG_FIXUP
+DIVINE_CONFIG_FIXUP = divine-config
 
 $(eval $(autotools-package))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index be0f1a7..b4ff322 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -8,6 +8,7 @@ FREETYPE_VERSION = 2.4.11
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
+FREETYPE_CONFIG_FIXUP = freetype-config
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
 FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
@@ -17,16 +18,6 @@ FREETYPE_DEPENDENCIES = host-pkgconf \
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 
-define FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/freetype-config
-endef
-
-FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
-
 define FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 	rm -f $(TARGET_DIR)/usr/bin/freetype-config
 endef
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 1f9b1d6..25203c3 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -10,6 +10,7 @@ GD_SITE = http://distfiles.gentoo.org/distfiles
 # needed because of configure.ac timestamp
 GD_AUTORECONF = YES
 GD_INSTALL_STAGING = YES
+GD_CONFIG_FIXUP = gdlib-config
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
 
@@ -66,14 +67,6 @@ endef
 GD_PRE_CONFIGURE_HOOKS += GD_FIXUP_ICONV
 endif
 
-define GD_FIXUP_GDLIB_CONFIG
-	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
-	    -e 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/gdlib-config
-endef
-
-GD_POST_INSTALL_STAGING_HOOKS += GD_FIXUP_GDLIB_CONFIG
-
 GD_TOOLS_                         	+= gdlib-config
 GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
 GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 75e21bb..9809a20 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -7,18 +7,11 @@ GIBLIB_VERSION = 1.2.4
 GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
+GIBLIB_CONFIG_FIXUP = giblib-config
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
 GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
-define GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/giblib-config
-endef
-
-GIBLIB_POST_INSTALL_STAGING_HOOKS += GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 541ca35..672bce7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -12,6 +12,7 @@ ICU_LICENSE_FILES = license.html
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
+ICU_CONFIG_FIXUP = icu-config
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
 HOST_ICU_CONF_OPT = --disable-samples --disable-tests
@@ -19,13 +20,5 @@ ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-define ICU_PREFIX_FIXUP
-	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/icu-config
-endef
-
-ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fd00694..6413267 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -10,6 +10,7 @@ LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
+LIBCURL_CONFIG_FIXUP = curl-config
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -36,11 +37,6 @@ define LIBCURL_TARGET_CLEANUP
 endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
-define LIBCURL_STAGING_FIXUP_CURL_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
-endef
-LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
-
 $(eval $(autotools-package))
 
 curl: libcurl
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 520f58d..b8c3d0d 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -9,7 +9,7 @@ LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
-
+LIBDVDNAV_CONFIG_FIXUP = dvdnav-config
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
@@ -24,10 +24,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDVDNAV_POST_INSTALL_TARGET_HOOKS += LIBDVDNAV_TARGET_CLEANUP
 endif
 
-define LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdnav-config
-endef
-
-LIBDVDNAV_POST_INSTALL_STAGING_HOOKS += LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
-
 $(eval $(autotools-package))
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index ee616f0..548d1be 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -10,6 +10,7 @@ LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
+LIBDVDREAD_CONFIG_FIXUP = dvdread-config
 
 define LIBDVDREAD_TARGET_CLEANUP
 	$(RM) -f $(TARGET_DIR)/usr/bin/dvdread-config
@@ -19,10 +20,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDVDREAD_POST_INSTALL_TARGET_HOOKS += LIBDVDREAD_TARGET_CLEANUP
 endif
 
-define LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdread-config
-endef
-
-LIBDVDREAD_POST_INSTALL_STAGING_HOOKS += LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
-
 $(eval $(autotools-package))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b0a8a73..53aa1d7 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -10,6 +10,7 @@ LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
+LIBGCRYPT_CONFIG_FIXUP = libgcrypt-config
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
 LIBGCRYPT_CONF_ENV = \
@@ -25,13 +26,4 @@ endef
 
 LIBGCRYPT_POST_PATCH_HOOKS += LIBGCRYPT_DISABLE_TESTS
 
-define LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/libgcrypt-config
-endef
-
-LIBGCRYPT_POST_INSTALL_STAGING_HOOKS += LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
-
-
 $(eval $(autotools-package))
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
index a03c892..b03fbce 100644
--- a/package/libmcrypt/libmcrypt.mk
+++ b/package/libmcrypt/libmcrypt.mk
@@ -8,15 +8,8 @@ LIBMCRYPT_VERSION = 2.5.8
 LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
 LIBMCRYPT_AUTORECONF = YES
 LIBMCRYPT_INSTALL_STAGING = YES
+LIBMCRYPT_CONFIG_FIXUP = libmcrypt-config
 LIBMCRYPT_LICENSE = LGPLv2.1
 LIBMCRYPT_LICENSE_FILES = COPYING.LIB
 
-define LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/libmcrypt-config
-endef
-
-LIBMCRYPT_POST_INSTALL_STAGING_HOOKS += LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a5307fa..f103293 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -8,6 +8,7 @@ LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub
 LIBNSPR_INSTALL_STAGING = YES
+LIBNSPR_CONFIG_FIXUP = nspr-config
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
@@ -24,12 +25,4 @@ LIBNSPR_CONF_OPT += --disable-thumb2
 endif
 endif
 
-define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/nspr-config
-endef
-
-LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index d834876..1daa4f4 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -12,16 +12,7 @@ LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
-
-define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng$(LIBPNG_SERIES)\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config
-endef
-
-LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
+LIBPNG_CONFIG_FIXUP = libpng$(LIBPNG_SERIES)-config
 
 define LIBPNG_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config \
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 848c705..60c1ea9 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -8,14 +8,7 @@ LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
-
-define LIBUSB_COMPAT_FIXUP_CONFIG
-	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
-	    -e 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/libusb-config
-endef
-
-LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
+LIBUSB_COMPAT_CONFIG_FIXUP = libusb-config
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 923a813..0cd1207 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -7,6 +7,7 @@
 LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
+LIBXML2_CONFIG_FIXUP = xml2-config
 LIBXML2_AUTORECONF = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
@@ -17,13 +18,6 @@ endif
 
 LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug
 
-define LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-endef
-
-LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
-
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
 # mesa3d uses functions that are only available with debug
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index a35b955..5243d7a 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -7,6 +7,7 @@
 LIBXSLT_VERSION = 1.1.28
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
+LIBXSLT_CONFIG_FIXUP = xslt-config
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 
@@ -27,14 +28,6 @@ HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-define LIBXSLT_XSLT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
-	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/xslt-config
-endef
-
-LIBXSLT_POST_INSTALL_STAGING_HOOKS += LIBXSLT_XSLT_CONFIG_FIXUP
-
 define LIBXSLT_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/usr/bin/xslt-config
 endef
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2cfd332..22b8525 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -8,6 +8,7 @@
 NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
+NCURSES_CONFIG_FIXUP = ncurses5-config
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
@@ -37,13 +38,6 @@ define NCURSES_BUILD_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
-define NCURSES_PATCH_NCURSES_CONFIG
-	$(SED) 's^prefix="^prefix="$(STAGING_DIR)^' \
-		$(STAGING_DIR)/usr/bin/ncurses5-config
-endef
-
-NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
-
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define NCURSES_INSTALL_TARGET_DEVFILES
 	mkdir -p $(TARGET_DIR)/usr/include
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 56db604..8d714ef 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,6 +6,7 @@
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
 NEON_INSTALL_STAGING = YES
+NEON_CONFIG_FIXUP = neon-config
 NEON_CONF_OPT = --without-gssapi --disable-rpath
 
 NEON_DEPENDENCIES = host-pkgconf
@@ -52,12 +53,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
-define NEON_STAGING_NEON_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/neon-config
-endef
-
-NEON_POST_INSTALL_STAGING_HOOKS += NEON_STAGING_NEON_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 2670cf3..00fa866 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -10,6 +10,7 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
+NETSNMP_CONFIG_FIXUP = net-snmp-config
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-defaults --enable-mini-agent --without-rpm \
@@ -80,14 +81,4 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
 endef
 
-define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/net-snmp-config
-endef
-
-NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 9e27cb5..19321ce 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -9,20 +9,13 @@ PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
+PCRE_CONFIG_FIXUP = pcre-config
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
 PCRE_CONF_OPT = --disable-cpp
 endif
 
-define PCRE_STAGING_PCRE_CONFIG_FIXUP
-	$(SED) 's,^prefix=.*,prefix=$(STAGING_DIR)/usr,' \
-		-e 's,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,' \
-		$(STAGING_DIR)/usr/bin/pcre-config
-endef
-
-PCRE_POST_INSTALL_STAGING_HOOKS += PCRE_STAGING_PCRE_CONFIG_FIXUP
-
 define PCRE_TARGET_REMOVE_PCRE_CONFIG
 	rm -f $(TARGET_DIR)/usr/bin/pcre-config
 endef
diff --git a/package/php/php.mk b/package/php/php.mk
index a1badab..adb57fd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -8,6 +8,7 @@ PHP_VERSION = 5.3.20
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
+PHP_CONFIG_FIXUP = php-config
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_LICENSE = PHP
@@ -200,15 +201,6 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
 	PHP_DEPENDENCIES += netsnmp
 endif
 
-# Fixup prefix= and exec_prefix= in php-config
-define PHP_FIXUP_PHP_CONFIG
-	$(SED) 's%^prefix="/usr"%prefix="$(STAGING_DIR)/usr"%' \
-		-e 's%^exec_prefix="/usr"%exec_prefix="$(STAGING_DIR)/usr"%' \
-		$(STAGING_DIR)/usr/bin/php-config
-endef
-
-PHP_POST_INSTALL_STAGING_HOOKS += PHP_FIXUP_PHP_CONFIG
-
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
-- 
1.7.7.6
