From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 16:50:46 +0200
Subject: [Buildroot] [git commit] google-breakpad: needs thread support
Message-ID: <20160919145135.BEC568212A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bb3983c9b612e861f43bc9f6470fc7c5b9adbbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When google-breakpad was enabled in uClibc configurations, the
dependency on threads was forgotten.

Fixes:

  http://autobuild.buildroot.net/results/6e6bc845314100f2deb8ed06d2a6373ccf715ffe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                         | 1 +
 package/google-breakpad/Config.in | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index dcd15e8..8d37c93 100644
--- a/Config.in
+++ b/Config.in
@@ -554,6 +554,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index fdaab7a..c800974 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
@@ -30,7 +31,8 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  http://code.google.com/p/google-breakpad/
 
-comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, C++ enabled"
+comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++ enabled"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
