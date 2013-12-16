From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Dec 2013 15:58:19 -0300
Subject: [Buildroot] [PATCH] cups: disable php extension
Message-ID: <1387220299-18990-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Such an old cups version isn't compatible with newer PHP series, so just
disable it. Fixes:
http://autobuild.buildroot.net/results/2dc/2dc985fc7cff6bd5d20fc074db4f6f7997dd81f5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cups/cups.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 8a761a3..bcd6f1e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -14,6 +14,7 @@ CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 CUPS_CONF_OPT = --without-perl \
 		--without-java \
+		--without-php \
 		--disable-gnutls \
 		--disable-gssapi \
 		--libdir=/usr/lib
@@ -35,14 +36,6 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
-ifeq ($(BR2_PACKAGE_PHP),y)
-	CUPS_CONF_ENV += ac_cv_path_PHPCONFIG=$(STAGING_DIR)/usr/bin/php-config
-	CUPS_CONF_OPT += --with-php
-	CUPS_DEPENDENCIES += php
-else
-	CUPS_CONF_OPT += --without-php
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 	CUPS_CONF_OPT += --with-python
 	CUPS_DEPENDENCIES += python
-- 
1.8.3.2
