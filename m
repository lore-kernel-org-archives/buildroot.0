From: Paul Cercueil <paul@crapouillou.net>
Date: Sun,  8 Dec 2019 19:58:22 +0100
Subject: [Buildroot] [PATCH] package/apitrace: Fix build under uClibc/musl
Message-ID: <20191208185822.163008-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch which has been merged upstream
(PR: https://github.com/apitrace/apitrace/pull/644) which allows
apitrace to be compiled under uClibc and musl.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-dlsym-Fix-build-under-uClibc.patch   | 30 +++++++++++++++++++
 package/apitrace/Config.in                    |  6 ++--
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch

diff --git a/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch b/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
new file mode 100644
index 0000000000..73286c4cbf
--- /dev/null
+++ b/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
@@ -0,0 +1,30 @@
+From 189a3b8397c61ba262a2221885e38dc514c59d94 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Sat, 7 Dec 2019 00:00:57 +0100
+Subject: [PATCH] dlsym: Fix build under uClibc
+
+uClibc defines the __GLIBC__ macro too (I know, right?), so verify that
+__UCLIBC__ is not defined before we can use glibc-specific internal
+functions.
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ wrappers/dlsym.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
+index 2eda082a..5ab8465b 100644
+--- a/wrappers/dlsym.cpp
++++ b/wrappers/dlsym.cpp
+@@ -34,7 +34,7 @@
+ #include "os.hpp"
+ 
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 
+ 
+ #include <dlfcn.h>
+-- 
+2.24.0
+
diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index c1be619f1b..45b4c307bb 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,11 +1,9 @@
-comment "apitrace needs a glibc toolchain w/ C++, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "apitrace needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_USES_GLIBC # uses glibc specific __libc_dlsym
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
-- 
2.24.0
