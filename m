From: Ismael Luceno <ismael@iodev.co.uk>
Date: Fri, 22 Sep 2017 01:45:45 -0300
Subject: [Buildroot] [PATCH] axel: bump to version 2.14.1
Message-ID: <20170922044545.18813-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/Config.in | 14 +++++++++++++-
 package/axel/axel.hash |  3 +--
 package/axel/axel.mk   | 17 ++++++++---------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index 6e709cfb1351..c7dcbe71c179 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -4,7 +4,19 @@ config BR2_PACKAGE_AXEL
 	help
 	  HTTP/FTP download accelerator.
 
-	  http://axel.alioth.debian.org/
+	  https://github.com/axel-download-accelerator/
+
+if BR2_PACKAGE_AXEL
+
+config BR2_PACKAGE_AXEL_SSL
+	bool "SSL/TLS support"
+	default y
+	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LIBRESSL
+
+comment "SSL/TLS support requires openssl or libressl"
+	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LIBRESSL)
+
+endif
 
 comment "axel needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 895767011892..d9b610f7e3c2 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1 @@
-# Locally calculated
-sha256	359a57ab4e354bcb6075430d977c59d33eb3e2f1415a811948fa8ae657ca8036  axel-2.4.tar.gz
+sha256	acf6820d98a792faf309fc9acf22f7caf4b8a4b7001072c8f546b3c4fc755e39  axel-2.14.1.tar.gz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 60bf5e4a61df..50d87d982898 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,23 +4,22 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.4
-AXEL_SITE = http://sources.buildroot.net
+AXEL_VERSION = 2.14.1
+AXEL_SITE = $(call github,axel-download-accelerator,axel,v$(AXEL_VERSION))
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
-AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) \
+	$(if $(BR2_PACKAGE_AXEL_SSL),\
+		$(if $(BR2_PACKAGE_LIBRESSL),libressl,openssl))
 AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-AXEL_DISABLE_I18N = --i18n=0
-endif
-
 define AXEL_CONFIGURE_CMDS
 	(cd $(@D); \
+		./autogen.sh; \
 		./configure \
 			--prefix=/usr \
-			--debug=1 \
-			$(AXEL_DISABLE_I18N) \
+			$(if $(BR2_PACKAGE_AXEL_SSL),,--without-ssl) \
+			$(if $(BR2_SYSTEM_ENABLE_NLS),,--disable-nls) \
 	)
 endef
 
-- 
2.13.3
