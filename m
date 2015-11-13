From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 15:05:55 -0300
Subject: [Buildroot] [PATCH 2/3] glibmm: bump to version 2.46.1
In-Reply-To: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447437956-13035-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust pulseview/libsigrok for the gcc >= 4.8 dependency.

Line wrap comment depends for pulseview.

Drop redundant libsigrok depend on comment for libsigrok++.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibmm/Config.in    | 7 ++++---
 package/glibmm/glibmm.hash  | 4 ++--
 package/glibmm/glibmm.mk    | 2 +-
 package/libsigrok/Config.in | 7 ++++---
 package/pulseview/Config.in | 7 ++++---
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index 6ac4be5..fdbb438 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSIGC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -11,7 +12,7 @@ config BR2_PACKAGE_GLIBMM
 
 	  http://www.gtkmm.org/
 
-comment "glibmm needs a toolchain w/ C++, wchar, threads"
+comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 4fbde55..9a7a6c8 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.36/glibmm-2.36.1.sha256sum
-sha256	d1f7dec2fd75ea95034ec143fcf2ff77a02e92aacf3e0cc110f9c67e7fe23766	glibmm-2.36.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.1.sha256sum
+sha256	9647e596c1081d2ea202bd3da2824ec2ea359498fa86eb59a55b1b307dd8c4aa	glibmm-2.46.1.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 4081251..66b357d 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.36
+GLIBMM_VERSION_MAJOR = 2.46
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 6ef3776..ff2d249 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -24,12 +24,13 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # glibmm
 	help
 	  Build libsigrok C++ bindings as well.
 
-comment "C++ bindings need a toolchain w/ C++"
-	depends on BR2_PACKAGE_LIBSIGROK
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "C++ bindings need a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index e6ddc21..bbbfd76 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,15 +17,16 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ wchar, threads, C++, gcc >= 4.7"
+comment "pulseview needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.4.10
