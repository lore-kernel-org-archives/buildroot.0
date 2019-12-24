From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 10:32:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/apitrace: needs dynamic library
Message-ID: <20191224093212.585613-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apitrace uses dlfcn.h in lib/os/os_backtrace.cpp if _Unwind_Backtrace
symbol is found in unwind.h. dlfcn.h is also used in 9 other source
files

Fixes:
 - http://autobuild.buildroot.org/results/4d60477cc46e4071dd3da21abfe7082e0d12cee2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apitrace/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index abd7ae00ee..263eec5e7d 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,7 +1,7 @@
-comment "apitrace needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "apitrace needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
@@ -9,6 +9,7 @@ config BR2_PACKAGE_APITRACE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-- 
2.24.0
