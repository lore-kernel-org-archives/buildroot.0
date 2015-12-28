From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 21:57:15 +0100
Subject: [Buildroot] [git commit] package/libasplib: new package
Message-ID: <20151228205743.17B9182531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a986e09497d1ddc3c8fecdf8feabc516fd345cfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming kodi-adsp-biquad-filters package

[Thomas:
  - add dependency on i386 || x86-64 since the <cpuid.h> header is
    needed
  - add hash file.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-Fix-linux-detection-with-buildroot.patch  | 31 ++++++++++++++++++++++
 package/libasplib/Config.in                        | 14 ++++++++++
 package/libasplib/libasplib.hash                   |  2 ++
 package/libasplib/libasplib.mk                     | 13 +++++++++
 5 files changed, 61 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dd44743..ffd3207 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -726,6 +726,7 @@ menu "Audio/Sound"
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
index 0000000..71ccfa0
--- /dev/null
+++ b/package/libasplib/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBASPLIB
+	bool "libasplib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# needs <cpuid.h> from the compiler
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  asplib (Achim's Signal Processing LIBrary), is a small and
+	  lightweight C++ library for digital signal processing.
+
+	  https://github.com/kodi-adsp/asplib
+
+comment "asplib needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
new file mode 100644
index 0000000..96c6a2c
--- /dev/null
+++ b/package/libasplib/libasplib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8979cbd1620dde0603f596d2d05d300355f07e42637bb41ecd564541fa1332f4 libasplib-2fac1bf34efd210b95949fddcbd4a12d287d3e82.tar.gz
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
