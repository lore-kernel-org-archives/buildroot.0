From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Mar 2020 23:20:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/libcpprestsdk: needs locale
In-Reply-To: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
References: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314222027.2317520-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

locale_t is unconditionally used since version 2.3.0 and
https://github.com/microsoft/cpprestsdk/commit/814caa4c0a80ef223535446a274146bf46a5ef2b

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index 1551a0c6b1..af97509d1b 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk"
+	depends on BR2_ENABLE_LOCALE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
@@ -21,10 +22,10 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 
 	  https://github.com/Microsoft/cpprestsdk
 
-comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar"
+comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
 
 comment "libcpprestsdk needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.25.1
