From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:50 -0400
Subject: [Buildroot] [PATCH] libglib2: bump version to 2.53.3
Message-ID: <20170621203057.4346-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches were updated to work with new version, and now pass check-package.
0003-gio-2.0.pc-include-libmount-in-Libs.private.patch was added to upstream.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 .../0001-fix-compile-time-atomic-detection.patch   | 12 +++--
 package/libglib2/0002-disable-tests.patch          | 57 ++++++++++++++--------
 ...o-2.0.pc-include-libmount-in-Libs.private.patch | 32 ------------
 package/libglib2/libglib2.hash                     |  4 +-
 package/libglib2/libglib2.mk                       |  2 +-
 5 files changed, 48 insertions(+), 59 deletions(-)
 delete mode 100644 package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch

diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index f6d0c5d..ca55e3c 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -1,4 +1,7 @@
-[PATCH] Fix compilation issues on architectures with limited atomic support
+From 8d10c1c4ae9f20d4f03cbcdca6a23c5905f3df5a Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@codeblue.com>
+Date: Wed, 21 Jun 2017 15:31:50 -0400
+Subject: [PATCH] Fix compilation issues on architectures with limited atomic support
 
 Improved compile-time detection of atomic support in the compiler.
 
@@ -6,15 +9,16 @@ Upstream-Status: submitted
 See : https://bugzilla.gnome.org/show_bug.cgi?id=752731
 
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@codeblue.com>
 ---
  glib/gthread-posix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
-index ae5d805..8db8557 100644
+index aa0e36e..b33e466 100644
 --- a/glib/gthread-posix.c
 +++ b/glib/gthread-posix.c
-@@ -67,7 +67,7 @@
+@@ -65,7 +65,7 @@
  #endif
  
  /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
@@ -24,5 +28,5 @@ index ae5d805..8db8557 100644
  #endif
  
 -- 
-2.4.3
+2.9.4
 
diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
index 1b0c535..f7b826c 100644
--- a/package/libglib2/0002-disable-tests.patch
+++ b/package/libglib2/0002-disable-tests.patch
@@ -1,12 +1,37 @@
+From 1afcc0c993b6b08cfccf0fb3cc7f0afe64e32cb5 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@codeblue.com>
+Date: Wed, 21 Jun 2017 15:33:59 -0400
+Subject: [PATCH] disable tests
+
 Disable tests, some of them need python and sometimes host-python
 gets mixed with distro python leading to build failures.
 
 Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+Signed-off-by: Adam Duskett <aduskett@codeblue.com>
+---
+ Makefile.am      | 2 +-
+ gio/Makefile.am  | 2 +-
+ glib/Makefile.am | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
-diff -Nura glib-2.46.1.orig/gio/Makefile.am glib-2.46.1/gio/Makefile.am
---- glib-2.46.1.orig/gio/Makefile.am	2015-10-20 16:59:03.042212468 -0300
-+++ glib-2.46.1/gio/Makefile.am	2015-10-20 17:32:26.763146133 -0300
-@@ -233,7 +233,7 @@
+diff --git a/Makefile.am b/Makefile.am
+index 008ad58..007332d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,7 +6,7 @@ include $(top_srcdir)/glib.mk
+ 
+ ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
+ 
+-SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
++SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
+ DIST_SUBDIRS = $(SUBDIRS) build win32
+ 
+ bin_SCRIPTS = glib-gettextize
+diff --git a/gio/Makefile.am b/gio/Makefile.am
+index f07c94a..e0d0db9 100644
+--- a/gio/Makefile.am
++++ b/gio/Makefile.am
+@@ -244,7 +244,7 @@ platform_libadd += win32/libgiowin32.la
  platform_deps += win32/libgiowin32.la
  endif
  
@@ -15,10 +40,11 @@ diff -Nura glib-2.46.1.orig/gio/Makefile.am glib-2.46.1/gio/Makefile.am
  
  if HAVE_FAM
  SUBDIRS += fam
-diff -Nura glib-2.46.1.orig/glib/Makefile.am glib-2.46.1/glib/Makefile.am
---- glib-2.46.1.orig/glib/Makefile.am	2015-10-20 16:59:03.066213318 -0300
-+++ glib-2.46.1/glib/Makefile.am	2015-10-20 17:33:23.537155988 -0300
-@@ -33,8 +33,8 @@
+diff --git a/glib/Makefile.am b/glib/Makefile.am
+index d755853..61166e5 100644
+--- a/glib/Makefile.am
++++ b/glib/Makefile.am
+@@ -33,8 +33,8 @@ else
  MAYBE_PCRE = pcre 
  endif
  
@@ -29,15 +55,6 @@ diff -Nura glib-2.46.1.orig/glib/Makefile.am glib-2.46.1/glib/Makefile.am
  
  AM_CPPFLAGS = 				\
  	$(glib_INCLUDES) 		\
-diff -Nura glib-2.46.1.orig/Makefile.am glib-2.46.1/Makefile.am
---- glib-2.46.1.orig/Makefile.am	2015-10-20 16:59:03.003211087 -0300
-+++ glib-2.46.1/Makefile.am	2015-10-20 17:32:20.923939420 -0300
-@@ -6,7 +6,7 @@
- 
- ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
- 
--SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
-+SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
- DIST_SUBDIRS = $(SUBDIRS) build
- 
- bin_SCRIPTS = glib-gettextize
+-- 
+2.9.4
+
diff --git a/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch b/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch
deleted file mode 100644
index 364e179..0000000
--- a/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ee32416dec8462ee27c3c254100cf980b0889ce0 Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Date: Tue, 18 Oct 2016 23:04:50 +0530
-Subject: [PATCH] gio-2.0.pc: include libmount in Libs.private
-
-This helps with static linking. When application statically links with
-libgio, it needs to link against libmount explicitly. When it is
-mentioned in Libs.private, build system can figure out with which extra
-libs to link against with help of pkg-config.
-
-This build failure is detected by Buildroot autobuilder:
-http://autobuild.buildroot.net/results/fdf/fdf26abbed0014606a7788ce5d60828a0e871186
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- gio-2.0.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio-2.0.pc.in b/gio-2.0.pc.in
-index 899af0c..7574eb7 100644
---- a/gio-2.0.pc.in
-+++ b/gio-2.0.pc.in
-@@ -14,5 +14,5 @@ Version: @VERSION@
- Requires: glib-2.0 gobject-2.0
- Requires.private: gmodule-no-export-2.0
- Libs: -L${libdir} -lgio-2.0
--Libs.private: @ZLIB_LIBS@ @NETWORK_LIBS@ @SELINUX_LIBS@ @COCOA_LIBS@ @CARBON_LIBS@
-+Libs.private: @ZLIB_LIBS@ @NETWORK_LIBS@ @SELINUX_LIBS@ @COCOA_LIBS@ @CARBON_LIBS@ @LIBMOUNT_LIBS@
- Cflags:
--- 
-2.6.2
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index b31c212..1230139 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.50/glib-2.50.3.sha256sum
-sha256  82ee94bf4c01459b6b00cb9db0545c2237921e3060c0b74cff13fbc020cfd999  glib-2.50.3.tar.xz
+# https://download.gnome.org/sources/glib/2.53/glib-2.53.3.sha256sum
+sha256  ad727874057d369bf5f77f3ed32e2c50488672c99e62ee701a7f0ffdc47381a1  glib-2.53.3.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 47d9f63..71ae8c8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.50
+LIBGLIB2_VERSION_MAJOR = 2.53
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
2.9.4
