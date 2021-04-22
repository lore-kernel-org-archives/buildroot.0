From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Apr 2021 22:52:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: needs dynamic library
Message-ID: <20210422205256.707037-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable gerbera with static builds as it raises build failures since
bump to version 1.8.0 in commit 8974596836945eada8e162844fb87f88adec9100
and upstream does not seem to care or test static builds:
https://github.com/gerbera/gerbera/issues/1221

Fixes:
 - http://autobuild.buildroot.org/results/9c59ef912d09bb3c0647b98aa8e9eca7fccbe08f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 33a9705bea..46a163ec78 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -25,8 +26,9 @@ config BR2_PACKAGE_GERBERA
 
 	  https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, threads, wchar, gcc >= 8"
+comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.30.2
