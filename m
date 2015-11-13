From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 09:35:27 -0300
Subject: [Buildroot] [PATCH] exiv2: bump to version 0.25
Message-ID: <1447418127-6439-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exiv2/0001-remove-useless-header.patch | 19 -------------------
 package/exiv2/Config.in                        |  6 ++++--
 package/exiv2/exiv2.hash                       |  4 ++--
 package/exiv2/exiv2.mk                         |  2 +-
 4 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 package/exiv2/0001-remove-useless-header.patch

diff --git a/package/exiv2/0001-remove-useless-header.patch b/package/exiv2/0001-remove-useless-header.patch
deleted file mode 100644
index 96a3734..0000000
--- a/package/exiv2/0001-remove-useless-header.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-version.cpp: remove useless header inclusion
-
-The inclusion of link.h header is not required and can create build
-error with some toolchains.
-The patch is pushed on the upstream for the next release.
-http://dev.exiv2.org/issues/1007
-
-Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
-
---- exiv2-0.24.orig/src/version.cpp	2013-12-01 13:13:42.000000000 +0100
-+++ exiv2-0.24/src/version.cpp	2014-12-04 09:30:39.667234130 +0100
-@@ -116,7 +116,6 @@ typedef string_v::iterator  string_i;
- #elif defined(__linux__)
- # include <unistd.h>
- // http://syprog.blogspot.com/2011/12/listing-loaded-shared-objects-in-linux.html
--# include "link.h"
- # include <dlfcn.h>
-   struct something
-   {
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 9a7cf44..8ca95eb 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -1,10 +1,12 @@
-comment "exiv2 needs a toolchain w/ C++, dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+comment "exiv2 needs a toolchain w/ C++, wchar, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_EXIV2
 	bool "exiv2"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  Exiv2 is a C++ library and a command line utility to manage
 	  image metadata. It provides fast and easy read and write
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index d4f8c60..b1e78d2 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,4 @@
 # From http://www.exiv2.org/download.html
-md5 b8a23dc56a98ede85c00718a97a8d6fc exiv2-0.24.tar.gz
+md5 258d4831b30f75a01e0234065c6c2806 exiv2-0.25.tar.gz
 # Locally calculated
-sha256 f4a443e6c7fb9d9f5e787732f76969a64c72c4c04af69b10ed57f949c2dfef8e exiv2-0.24.tar.gz
+sha256 c80bfc778a15fdb06f71265db2c3d49d8493c382e516cb99b8c9f9cbde36efa4 exiv2-0.25.tar.gz
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 93e36f7..45f9289 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.24
+EXIV2_VERSION = 0.25
 EXIV2_SITE = http://www.exiv2.org
 EXIV2_INSTALL_STAGING = YES
 
-- 
2.4.10
