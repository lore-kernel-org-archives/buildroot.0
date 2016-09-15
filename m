From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 14 Sep 2016 21:46:29 -0300
Subject: [Buildroot] [PATCH] breakpad: enable for uClibc
Message-ID: <1473900389-14633-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

There's nothing holding it off for uClibc-based toolchains so enable it.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 Config.in                         | 3 ++-
 package/google-breakpad/Config.in | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index e614c8f..f3b6649 100644
--- a/Config.in
+++ b/Config.in
@@ -553,7 +553,8 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
 	  This option will enable the use of google breakpad, a library
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 7b8eeb1..06895af 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
 	  Google-Breakpad is a library and tool suite that allows you
@@ -29,6 +30,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  http://code.google.com/p/google-breakpad/
 
-comment "google-breakpad requires a glibc toolchain w/ C++ enabled"
+comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, C++ enabled"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
-- 
2.7.3
