From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:57:50 +0100
Subject: [Buildroot] [git commit] leptonica: new package
Message-ID: <20170319135808.3BD4582194@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccab2d636fbee6eb8073ea2010442d7678a9ec54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/leptonica/Config.in      |  8 +++++
 package/leptonica/leptonica.hash |  2 ++
 package/leptonica/leptonica.mk   | 64 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 746a547..8802fc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -587,6 +587,7 @@ N:	Gilles Talis <gilles.talis@gmail.com>
 F:	package/fdk-aac/
 F:	package/httping/
 F:	package/iozone/
+F:	package/leptonica/
 F:	package/ocrad/
 F:	package/webp/
 
diff --git a/package/Config.in b/package/Config.in
index 52b4f36..ed48058 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1010,6 +1010,7 @@ menu "Graphics"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
+	source "package/leptonica/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
 	source "package/libdmtx/Config.in"
diff --git a/package/leptonica/Config.in b/package/leptonica/Config.in
new file mode 100644
index 0000000..a4053a3
--- /dev/null
+++ b/package/leptonica/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LEPTONICA
+	bool "leptonica"
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
index 0000000..37e5219
--- /dev/null
+++ b/package/leptonica/leptonica.mk
@@ -0,0 +1,64 @@
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
+LEPTONICA_CONF_OPTS +=  --with-giflib
+else
+LEPTONICA_CONF_OPTS +=  --without-giflib
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LEPTONICA_DEPENDENCIES += jpeg
+LEPTONICA_CONF_OPTS += --with-jpeg
+else
+LEPTONICA_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LEPTONICA_DEPENDENCIES += libpng
+LEPTONICA_CONF_OPTS += --with-libpng
+else
+LEPTONICA_CONF_OPTS += --without-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+LEPTONICA_DEPENDENCIES += openjpeg
+LEPTONICA_CONF_OPTS += --with-libopenjpeg
+else
+LEPTONICA_CONF_OPTS += --without-libopenjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LEPTONICA_DEPENDENCIES += tiff
+LEPTONICA_CONF_OPTS += --with-libtiff
+else
+LEPTONICA_CONF_OPTS += --without-libtiff
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+LEPTONICA_DEPENDENCIES += webp
+LEPTONICA_CONF_OPTS += --with-libwebp
+else
+LEPTONICA_CONF_OPTS += --without-libwebp
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LEPTONICA_DEPENDENCIES += zlib
+LEPTONICA_CONF_OPTS += --with-zlib
+else
+LEPTONICA_CONF_OPTS += --without-zlib
+endif
+
+$(eval $(autotools-package))
