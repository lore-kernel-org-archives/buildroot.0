From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 14 Mar 2017 19:44:25 +0100
Subject: [Buildroot] [PATCH 1/3] leptonica: new package
In-Reply-To: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
References: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1489517067-3155-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in                |  1 +
 package/leptonica/Config.in      |  9 +++++++
 package/leptonica/leptonica.hash |  2 ++
 package/leptonica/leptonica.mk   | 57 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/leptonica/Config.in
 create mode 100644 package/leptonica/leptonica.hash
 create mode 100644 package/leptonica/leptonica.mk

diff --git a/package/Config.in b/package/Config.in
index 85e4dee..390560e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "Graphics"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
+	source "package/leptonica/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
 	source "package/libdmtx/Config.in"
diff --git a/package/leptonica/Config.in b/package/leptonica/Config.in
new file mode 100644
index 0000000..d485344
--- /dev/null
+++ b/package/leptonica/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LEPTONICA
+	bool "leptonica"
+
+	help
+	  Leptonica is a pedagogically-oriented open source site containing
+	  software that is broadly useful for image processing and image
+	  analysis applications.
+
+	  http://www.leptonica.org/
diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
new file mode 100644
index 0000000..48da06b
--- /dev/null
+++ b/package/leptonica/leptonica.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 746a517a47a3bd2a90bc8d581ca6464c10f30e91a60209735efe45b3778bec62  leptonica-1.74.1.tar.gz
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
new file mode 100644
index 0000000..5f2da79
--- /dev/null
+++ b/package/leptonica/leptonica.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# leptonica
+#
+################################################################################
+
+LEPTONICA_VERSION = 1.74.1
+LEPTONICA_SITE = http://www.leptonica.org/source
+LEPTONICA_LICENSE = BSD-2c
+LEPTONICA_LICENSE_FILES = leptonica-license.txt
+LEPTONICA_INSTALL_STAGING = YES
+
+LEPTONICA_CONF_OPTS += --disable-programs
+
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+LEPTONICA_DEPENDENCIES += giflib
+else
+LEPTONICA_CONF_OPTS +=  --without-giflib
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LEPTONICA_DEPENDENCIES += jpeg
+else
+LEPTONICA_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LEPTONICA_DEPENDENCIES += libpng
+else
+LEPTONICA_CONF_OPTS += --without-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+LEPTONICA_DEPENDENCIES += openjpeg
+else
+LEPTONICA_CONF_OPTS += --without-libopenjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LEPTONICA_DEPENDENCIES += tiff
+else
+LEPTONICA_CONF_OPTS += --without-libtiff
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+LEPTONICA_DEPENDENCIES += webp
+else
+LEPTONICA_CONF_OPTS += --without-libwebp
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LEPTONICA_DEPENDENCIES += zlib
+else
+LEPTONICA_CONF_OPTS += --without-zlib
+endif
+
+$(eval $(autotools-package))
-- 
2.5.0
