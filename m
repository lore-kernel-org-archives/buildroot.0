From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 19 Dec 2016 21:25:25 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: add C++11 dependency
	on the host variant
Message-ID: <1482179125-11704-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When google-breakpad has been updated to the latest version, the C++11
dependency has been added for the target variant only.
The C++11 dependency is also required for the host variant.

Fixes:
http://autobuild.buildroot.org/results/dce/dcecb17116c0cf400c98f0052c9bf71f15d0d398

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in                         | 1 +
 package/google-breakpad/Config.in | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 7ea1e60..d3bb7b8 100644
--- a/Config.in
+++ b/Config.in
@@ -529,6 +529,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 31ca422..c6171af 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -38,4 +39,4 @@ comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread,
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_HOST_GCC_AT_LEAST_4_7
-- 
2.5.5
