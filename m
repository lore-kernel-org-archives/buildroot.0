From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jul 2016 17:53:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/libebur128: new package
Message-ID: <1469375598-10887-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                |  1 +
 package/libebur128/Config.in     | 14 ++++++++++++++
 package/libebur128/libebur128.mk | 14 ++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/libebur128/Config.in
 create mode 100644 package/libebur128/libebur128.mk

diff --git a/package/Config.in b/package/Config.in
index 181921b..04ca8cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -816,6 +816,7 @@ menu "Audio/Sound"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
+	source "package/libebur128/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/libilbc/Config.in"
diff --git a/package/libebur128/Config.in b/package/libebur128/Config.in
new file mode 100644
index 0000000..1a6a743
--- /dev/null
+++ b/package/libebur128/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBEBUR128
+	bool "libebur128"
+	# build system has no support to disable shared linking
+	# leading to a build error with a static-only toolchain
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SPEEX
+	help
+	  libebur128 is a library that implements the EBU R 128 standard
+	  for loudness normalization.
+
+	  https://github.com/jiixyj/libebur128
+
+comment "libebur128 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
new file mode 100644
index 0000000..f5ada31
--- /dev/null
+++ b/package/libebur128/libebur128.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libebur128
+#
+################################################################################
+
+LIBEBUR128_VERSION = v1.1.0
+LIBEBUR128_SITE = $(call github,jiixyj,libebur128,$(LIBEBUR128_VERSION))
+LIBEBUR128_LICENSE = MIT
+LIBEBUR128_LICENSE_FILES = COPYING
+LIBEBUR128_INSTALL_STAGING = YES
+LIBEBUR128_DEPENDENCIES = speex
+
+$(eval $(cmake-package))
-- 
2.8.1
