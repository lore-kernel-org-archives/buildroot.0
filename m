From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 22:31:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libasplib: new package
Message-ID: <1450647112-17364-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming kodi-adsp-biquad-filters package

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 .../0001-Fix-linux-detection-with-buildroot.patch  | 31 ++++++++++++++++++++++
 package/libasplib/Config.in                        | 11 ++++++++
 package/libasplib/libasplib.mk                     | 13 +++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
 create mode 100644 package/libasplib/Config.in
 create mode 100644 package/libasplib/libasplib.mk

diff --git a/package/Config.in b/package/Config.in
index 3579dc9..8f0d6d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ menu "Audio/Sound"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
+	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
diff --git a/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch b/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
new file mode 100644
index 0000000..66f5185
--- /dev/null
+++ b/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
@@ -0,0 +1,31 @@
+From 1dc4480e5157e7ac8eb0364446787128f0a156aa Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 20 Dec 2015 22:25:52 +0100
+Subject: [PATCH 1/1] Fix linux detection with buildroot
+
+Inspired by
+http://lists.busybox.net/pipermail/buildroot/2015-July/133312.html
+
+Patch sent upstream: https://github.com/kodi-adsp/asplib/pull/2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ asplib_utils/os/asplib_base_os.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/asplib_utils/os/asplib_base_os.h b/asplib_utils/os/asplib_base_os.h
+index a2d3b98..9a90b54 100644
+--- a/asplib_utils/os/asplib_base_os.h
++++ b/asplib_utils/os/asplib_base_os.h
+@@ -27,7 +27,7 @@
+   #define TARGET_WINDOWS
+ #endif
+   #include "windows/windows_definitions.h"
+-#elif defined(__gnu_linux__)
++#elif (defined(__gnu_linux__) || defined(__linux__))
+ #if !defined(TARGET_WINDOWS)
+   #define TARGET_LINUX
+ #endif
+-- 
+2.6.4
+
diff --git a/package/libasplib/Config.in b/package/libasplib/Config.in
new file mode 100644
index 0000000..75f0d3c
--- /dev/null
+++ b/package/libasplib/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBASPLIB
+	bool "libasplib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  asplib (Achim's Signal Processing LIBrary), is a small and
+	  lightweight C++ library for digital signal processing.
+
+	  https://github.com/kodi-adsp/asplib
+
+comment "asplib needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
new file mode 100644
index 0000000..27629f5
--- /dev/null
+++ b/package/libasplib/libasplib.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libasplib
+#
+################################################################################
+
+LIBASPLIB_VERSION = 2fac1bf34efd210b95949fddcbd4a12d287d3e82
+LIBASPLIB_SITE = $(call github,kodi-adsp,asplib,$(LIBASPLIB_VERSION))
+LIBASPLIB_LICENSE = GPLv3+
+LIBASPLIB_LICENSE_FILES = LICENSE
+LIBASPLIB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.6.4
