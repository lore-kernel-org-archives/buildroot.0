From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:36:20 +0100
Subject: [Buildroot] [git commit] package/google-breakpad: really fix the
	C++11 dependency
Message-ID: <20161222093654.2ACAE81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=282ffecbe3c6fa123979ad2beb0b8fe86ecf5192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The C++11 build issue is still here since the C++11 is not complete in
gcc 4.7 [1]. So disable Google-breakpad for toolchains based on
gcc <= 4.7.

[1] https://gcc.gnu.org/gcc-4.7/cxx0x_status.html

Fixes:
http://autobuild.buildroot.net/results/c5e/c5e629f26bf6da369dff1e4588c16d2773173e9f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                         | 4 ++--
 package/google-breakpad/Config.in | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index d3bb7b8..ccd777e 100644
--- a/Config.in
+++ b/Config.in
@@ -529,8 +529,8 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_7 # C++11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index c6171af..e0e9106 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_7 # C++11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
@@ -34,9 +34,9 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.7"
+comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_HOST_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
