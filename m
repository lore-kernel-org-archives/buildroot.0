From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 23:35:05 +0100
Subject: [Buildroot] [PATCH v2 3/5] package: use <pkg>_CONFIG_SCRIPTS
	wherever possible
In-Reply-To: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360276507-17272-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the <pkg>_CONFIG_SCRIPTS mechanism in all packages for which it
does all what the package was doing. A few packages, like libxslt, are
for now left out, since they need some additional fixup (for example a
fixup of includedir).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changelog v1 -> v2:
 * Add Acked-by from Arnout
---
 package/cups/cups.mk                   |   10 +---------
 package/directfb/directfb.mk           |    9 +--------
 package/divine/divine.mk               |    9 +--------
 package/gd/gd.mk                       |   10 +---------
 package/giblib/giblib.mk               |    9 +--------
 package/icu/icu.mk                     |    9 +--------
 package/imagemagick/imagemagick.mk     |   12 ++----------
 package/libcurl/libcurl.mk             |   11 ++++-------
 package/libdvdnav/libdvdnav.mk         |   16 +---------------
 package/libdvdread/libdvdread.mk       |   15 +--------------
 package/libgcrypt/libgcrypt.mk         |   10 +---------
 package/libmcrypt/libmcrypt.mk         |    9 +--------
 package/libnspr/libnspr.mk             |   10 ++--------
 package/libusb-compat/libusb-compat.mk |    9 +--------
 package/libxml2/libxml2.mk             |   17 +----------------
 package/ncurses/ncurses.mk             |    8 +-------
 package/neon/neon.mk                   |   18 +-----------------
 package/pcre/pcre.mk                   |   17 +----------------
 package/php/php.mk                     |   11 +----------
 19 files changed, 24 insertions(+), 195 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 3eb83ea..f8ace71 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -15,6 +15,7 @@ CUPS_CONF_OPT = --without-perl \
 		--disable-gnutls \
 		--disable-gssapi \
 		--libdir=/usr/lib
+CUPS_CONFIG_SCRIPTS = cups-config
 
 CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
 		    $(if $(BR2_PACKAGE_LIBPNG),libpng) \
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
index 6d5b1ce..4f05ed2 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -23,6 +23,7 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux \
 	--disable-video4linux2 \
 	--without-tools
+DIRECTFB_CONFIG_SCRIPTS = directfb-config
 
 DIRECTFB_DEPENDENCIES = freetype zlib
 
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
index 1fd27d2..b949601 100644
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
+DIVINE_CONFIG_SCRIPTS = divine-config
 
 $(eval $(autotools-package))
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 1f9b1d6..60c1c51 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -13,6 +13,7 @@ GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
 
+GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPT = --without-x --disable-rpath
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
@@ -66,15 +67,6 @@ endef
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
-GD_TOOLS_                         	+= gdlib-config
 GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
 GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
 GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 75e21bb..ab2bbef 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -12,13 +12,6 @@ GIBLIB_AUTORECONF = YES
 GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
-
-define GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/giblib-config
-endef
-
-GIBLIB_POST_INSTALL_STAGING_HOOKS += GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
+GIBLIB_CONFIG_SCRIPTS = giblib-config
 
 $(eval $(autotools-package))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 541ca35..5a88496 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -12,6 +12,7 @@ ICU_LICENSE_FILES = license.html
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
+ICU_CONFIG_SCRIPTS = icu-config
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
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0476ace..722ab40 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -16,6 +16,8 @@ IMAGEMAGICK_LICENSE_FILES = LICENSE
 
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
+IMAGEMAGICK_CONFIG_SCRIPTS = \
+	$(addsuffix -config,Magick MagickCore MagickWand Wand Magick++)
 
 ifeq ($(BR2_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
@@ -113,14 +115,4 @@ else
 IMAGEMAGICK_CONF_OPT += --without-bzip2
 endif
 
-define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
-	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
-		   $(addsuffix -config,			\
-		     Magick MagickCore MagickWand Wand Magick++))
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
-endif
-
 $(eval $(autotools-package))
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fd00694..38ca854 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -11,6 +11,7 @@ LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
+LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
@@ -30,16 +31,12 @@ define LIBCURL_FIX_DOT_PC
 endef
 LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_DOT_PC)
 
+ifeq ($(BR2_PACKAGE_CURL),)
 define LIBCURL_TARGET_CLEANUP
-	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
-	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
+	rm -rf $(TARGET_DIR)/usr/bin/curl
 endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
-
-define LIBCURL_STAGING_FIXUP_CURL_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
-endef
-LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
+endif
 
 $(eval $(autotools-package))
 
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 520f58d..e975313 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -9,25 +9,11 @@ LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
-
+LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
 LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
-define LIBDVDNAV_TARGET_CLEANUP
-	$(RM) -f $(TARGET_DIR)/usr/bin/dvdnav-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-LIBDVDNAV_POST_INSTALL_TARGET_HOOKS += LIBDVDNAV_TARGET_CLEANUP
-endif
-
-define LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdnav-config
-endef
-
-LIBDVDNAV_POST_INSTALL_STAGING_HOOKS += LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
-
 $(eval $(autotools-package))
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index ee616f0..29c3472 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -10,19 +10,6 @@ LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
-
-define LIBDVDREAD_TARGET_CLEANUP
-	$(RM) -f $(TARGET_DIR)/usr/bin/dvdread-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-LIBDVDREAD_POST_INSTALL_TARGET_HOOKS += LIBDVDREAD_TARGET_CLEANUP
-endif
-
-define LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
-	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdread-config
-endef
-
-LIBDVDREAD_POST_INSTALL_STAGING_HOOKS += LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
+LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
 
 $(eval $(autotools-package))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b0a8a73..b7c2742 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -11,6 +11,7 @@ LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
+LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
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
index a03c892..b67b1c7 100644
--- a/package/libmcrypt/libmcrypt.mk
+++ b/package/libmcrypt/libmcrypt.mk
@@ -10,13 +10,6 @@ LIBMCRYPT_AUTORECONF = YES
 LIBMCRYPT_INSTALL_STAGING = YES
 LIBMCRYPT_LICENSE = LGPLv2.1
 LIBMCRYPT_LICENSE_FILES = COPYING.LIB
-
-define LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/libmcrypt-config
-endef
-
-LIBMCRYPT_POST_INSTALL_STAGING_HOOKS += LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
+LIBMCRYPT_CONFIG_SCRIPTS = libmcrypt-config
 
 $(eval $(autotools-package))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a5307fa..5b1333d 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -8,6 +8,8 @@ LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub
 LIBNSPR_INSTALL_STAGING = YES
+LIBNSPR_CONFIG_SCRIPTS = nspr-config
+
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
@@ -24,12 +26,4 @@ LIBNSPR_CONF_OPT += --disable-thumb2
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
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 848c705..9551dfe 100644
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
+LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 923a813..6a974ef 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -10,6 +10,7 @@ LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
+LIBXML2_CONFIG_SCRIPTS = xml2-config
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
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
@@ -40,15 +34,6 @@ else
 HOST_LIBXML2_CONF_OPT += --without-python
 endif
 
-
-define LIBXML2_REMOVE_CONFIG_SCRIPTS
-	$(RM) -f $(TARGET_DIR)/usr/bin/xml2-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2cfd332..aa2b6bc 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -11,6 +11,7 @@ NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
+NCURSES_CONFIG_SCRIPTS = ncurses5-config
 
 NCURSES_CONF_OPT = \
 	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
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
index 56db604..cec72f8 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -7,7 +7,7 @@ NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath
-
+NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
@@ -44,20 +44,4 @@ ifeq ($(BR2_PACKAGE_NEON_NOXML),y)
 NEON_CONF_OPT += --disable-webdav
 endif
 
-define NEON_REMOVE_CONFIG_SCRIPTS
-	$(RM) -f $(TARGET_DIR)/usr/bin/neon-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
-endif
-
-define NEON_STAGING_NEON_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/neon-config
-endef
-
-NEON_POST_INSTALL_STAGING_HOOKS += NEON_STAGING_NEON_CONFIG_FIXUP
-
 $(eval $(autotools-package))
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 9e27cb5..48266ff 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -9,26 +9,11 @@ PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
+PCRE_CONFIG_SCRIPTS = pcre-config
 
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
-define PCRE_TARGET_REMOVE_PCRE_CONFIG
-	rm -f $(TARGET_DIR)/usr/bin/pcre-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-PCRE_POST_INSTALL_TARGET_HOOKS += PCRE_TARGET_REMOVE_PCRE_CONFIG
-endif
-
 $(eval $(autotools-package))
diff --git a/package/php/php.mk b/package/php/php.mk
index a1badab..c89b467 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,6 +19,7 @@ PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--with-config-file-path=/etc \
 		--localstatedir=/var \
 		--disable-rpath
+PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
@@ -200,19 +201,9 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
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
-	rm -f $(TARGET_DIR)/usr/bin/php-config
 	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
 		$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
 			$(TARGET_DIR)/etc/php.ini; \
-- 
1.7.9.5
