From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Nov 2016 23:54:11 +0100
Subject: [Buildroot] [PATCH v1 2/2] openjpeg: fix static linking of liblcms2
In-Reply-To: <1478904851-21040-1-git-send-email-ps.report@gmx.net>
References: <1478904851-21040-1-git-send-email-ps.report@gmx.net>
Message-ID: <1478904851-21040-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  .../host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/liblcms2.a(cmsplugin.o): In function `_cmsDeleteContext':
  cmsplugin.c:(.text+0x1c2): undefined reference to `_pthread_mutex_lock'
  cmsplugin.c:(.text+0x1f6): undefined reference to `_pthread_mutex_unlock'

http://autobuild.buildroot.net/results/5ce/5cee20afd8bef5268832cddcb3a5270746be7a57

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Depends on [2] from Samuel Martin.

[2] https://patchwork.ozlabs.org/patch/691655/
---
 ...lcms2-append-flags-found-by-pkg-config-if.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch

diff --git a/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch b/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
new file mode 100644
index 0000000..4366c0a
--- /dev/null
+++ b/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
@@ -0,0 +1,47 @@
+From 226daa77ea5a35da306f9af2548f3e2c9e79f577 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 11 Nov 2016 23:35:13 +0100
+Subject: [PATCH] thirdparty: lcms2: append flags found by pkg-config if
+ available
+
+This change allows to get all required CFLAGS/LDFLAGS in case of static only
+build.
+
+Fixes a buildroot build failure (see [1]).
+
+[1] http://autobuild.buildroot.net/results/5ce/5cee20afd8bef5268832cddcb3a5270746be7a57
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ thirdparty/CMakeLists.txt | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
+index 225f51d..42770ad 100644
+--- a/thirdparty/CMakeLists.txt
++++ b/thirdparty/CMakeLists.txt
+@@ -113,12 +113,19 @@ IF( BUILD_THIRDPARTY)
+   SET(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
+ ELSE (BUILD_THIRDPARTY)
+   FIND_PACKAGE(LCMS2)
++  # Static only build:
++  #   it is necessary to invoke pkg_check_module on lcms2 since it may have
++  #   several other dependencies not declared by its cmake module, but they are
++  #   in the its pkgconfig module.
++  IF(PKG_CONFIG_FOUND)
++    pkg_check_modules(PC_LCMS2 QUIET lcms2)
++  ENDIF(PKG_CONFIG_FOUND)
+   IF(LCMS2_FOUND)
+     message(STATUS "Your system seems to have a LCMS2 lib available, we will use it")
+     SET(OPJ_HAVE_LCMS2_H 1 PARENT_SCOPE)
+     SET(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
+-    SET(LCMS_LIBNAME ${LCMS2_LIBRARIES} PARENT_SCOPE)
+-    SET(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} PARENT_SCOPE)
++    SET(LCMS_LIBNAME ${LCMS2_LIBRARIES} ${PC_LCMS2_STATIC_LIBRARIES} PARENT_SCOPE)
++    SET(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} ${PC_LCMS2_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
+   ELSE (LCMS2_FOUND) # not found lcms2
+     # try to find LCMS
+     FIND_PACKAGE(LCMS)
+-- 
+2.8.1
+
-- 
2.8.1
