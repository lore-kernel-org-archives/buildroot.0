From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Nov 2016 17:16:40 +0100
Subject: [Buildroot] [PATCH for-next 3/3] package/google-breakpad: bump to
	the latest version
In-Reply-To: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480263400-29605-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version add the C++11 support and microdump.

Add the C++11 dependency since it's now mendatory.
Use the same linux-syscall-support version as the one defined by DEPS
file in the Google-breakpad sources.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pascal Huerst <pascal.huerst@gmail.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/google-breakpad/Config.in                        | 6 ++++--
 package/google-breakpad/google-breakpad.hash             | 2 +-
 package/google-breakpad/google-breakpad.mk               | 2 +-
 package/linux-syscall-support/linux-syscall-support.hash | 2 +-
 package/linux-syscall-support/linux-syscall-support.mk   | 4 ++--
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 5c3f2e8..31ca422 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
@@ -32,8 +33,9 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++ enabled"
+comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.7"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index b66f43d..79e8d08 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 25466aac60b83b231ce03d1540b1f8528c02ddaa76b08aed779084b145f07516 google-breakpad-7883a8308274cc37847e4ff3b995a327588fe034.tar.gz
+sha256 6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 0805c25..7a11c72 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOOGLE_BREAKPAD_VERSION = 7883a8308274cc37847e4ff3b995a327588fe034
+GOOGLE_BREAKPAD_VERSION = 7515ab13768c7edc09f0f2ec2354dc6c928239a6
 GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
 GOOGLE_BREAKPAD_SITE_METHOD = git
 GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index e800e8a..3092552 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3ac36d3f3cef7a3a111ea61b04b470282ec15ccc27d03a117e13ac0ab9973ba8  linux-syscall-support-e6c7682c40c27527894fbb8bcba38f77edbbb6b7.tar.gz
+sha256 e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
index 010b8f0..c698f64 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# Use the same version that the one used by Google-breakpad 1373
-LINUX_SYSCALL_SUPPORT_VERSION = e6c7682c40c27527894fbb8bcba38f77edbbb6b7
+# Use the same version that the one used by Google-breakpad (see DEPS file)
+LINUX_SYSCALL_SUPPORT_VERSION = 3f6478ac95edf86cd3da300c2c0d34a438f5dbeb
 LINUX_SYSCALL_SUPPORT_SITE = https://chromium.googlesource.com/linux-syscall-support
 LINUX_SYSCALL_SUPPORT_SITE_METHOD = git
 LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3c
-- 
2.5.5
