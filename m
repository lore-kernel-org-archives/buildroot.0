From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 16 Oct 2014 09:43:07 +0200
Subject: [Buildroot] [PATCH 1/1] mp4v2: new package
Message-ID: <1413445387-12764-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in        |  1 +
 package/mp4v2/Config.in  | 20 ++++++++++++++++++++
 package/mp4v2/mp4v2.hash |  2 ++
 package/mp4v2/mp4v2.mk   | 19 +++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/mp4v2/Config.in
 create mode 100644 package/mp4v2/mp4v2.hash
 create mode 100644 package/mp4v2/mp4v2.mk

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..819eaad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -553,6 +553,7 @@ menu "Audio/Sound"
 	source "package/libsndfile/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/mp4v2/Config.in"
 	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
 	source "package/portaudio/Config.in"
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
new file mode 100644
index 0000000..bd0ddda
--- /dev/null
+++ b/package/mp4v2/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_MP4V2
+	bool "mp4v2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The MP4v2 library provides functions to read, create, and modify mp4 files.
+
+	  https://code.google.com/p/mp4v2/
+
+if BR2_PACKAGE_MP4V2
+
+config BR2_PACKAGE_MP4V2_UTIL
+	bool "Install mp4 command line tools"
+	help
+	  Enable to install the mp4 command line tools mp4art, mp4chaps, mp4extract,
+	  mp4info, mp4subtitle, mp4tags, and mp4trackdump.
+
+endif
+
+comment "mp4v2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
new file mode 100644
index 0000000..d5a49c4
--- /dev/null
+++ b/package/mp4v2/mp4v2.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/mp4v2/downloads/detail?name=mp4v2-2.0.0.tar.bz2
+sha1 193260cfb7201e6ec250137bcca1468d4d20e2f0 mp4v2-2.0.0.tar.bz2
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
new file mode 100644
index 0000000..b1f1740
--- /dev/null
+++ b/package/mp4v2/mp4v2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mp4v2
+#
+################################################################################
+
+MP4V2_VERSION = 2.0.0
+MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
+MP4V2_SITE = https://mp4v2.googlecode.com/files
+MP4V2_INSTALL_STAGING = YES
+MP4V2_LICENSE = MPLv1.1
+MP4V2_LICENSE_FILES = COPYING
+MP4V2_CONF_OPTS = --disable-debug
+
+ifneq ($(BR2_PACKAGE_MP4V2_UTIL),y)
+MP4V2_CONF_OPTS += --disable-util
+endif
+
+$(eval $(autotools-package))
-- 
2.1.2
