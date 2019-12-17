From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Dec 2019 21:12:01 +0100
Subject: [Buildroot] [PATCH 1/2] package/apitrace: needs threads
Message-ID: <20191217201202.643563-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apitrace uses its own version of gtest which depends on threads since
version 8.0 and
https://github.com/apitrace/apitrace/commit/85cf7c8b86129699246574dfeec846e88a3f88a2

Moreover, apitrace also uses std::thread in lib/os/os_thread.hpp

Fixes:
 - http://autobuild.buildroot.org/results/03c4939fdfb7366c1835df946c4e869cd2b87b9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apitrace/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 08313c4891..116a864681 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,5 +1,6 @@
-comment "apitrace needs a toolchain w/ C++, wchar, gcc >= 4.9"
+comment "apitrace needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
@@ -7,6 +8,7 @@ config BR2_PACKAGE_APITRACE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
-- 
2.24.0
