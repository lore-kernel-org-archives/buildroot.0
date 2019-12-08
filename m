From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:44:13 +0100
Subject: [Buildroot] [git commit] package/apitrace: fix build under
 uClibc/musl
Message-ID: <20191208213600.5FB5388E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cda8162d8485bc4ff154f938555007a6f043245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch which has been merged upstream which allows apitrace to be
compiled under uClibc and musl.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-dlsym-Fix-build-under-uClibc.patch        | 31 ++++++++++++++++++++++
 package/apitrace/Config.in                         |  6 ++---
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch b/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
new file mode 100644
index 0000000000..bf47bba931
--- /dev/null
+++ b/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
@@ -0,0 +1,31 @@
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
+Upstream: https://github.com/apitrace/apitrace/commit/189a3b8397c61ba262a2221885e38dc514c59d94
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
