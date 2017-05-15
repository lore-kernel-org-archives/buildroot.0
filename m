From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 14 May 2017 21:26:00 -0500
Subject: [Buildroot] [PATCH 1/1] libqmi: move canonicalize_file_name()
Message-ID: <1494815160-53868-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously was defined in qmi-util.h to fix musl
compatibility.  It was missed that this is a shared
header which causes other dependent package builds
to fail, so the static definition was moved into the
implementation where it was used.

Upstream bug report has been updated and this resolves
the following autobuilder related failures.

 http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec97c2480025
 http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d63549caf6d

test-pkg testing was performed against 10 random toolchains

++ Config snippet ++
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
BR2_PACKAGE_MODEM_MANAGER=y
BR2_PACKAGE_LIBQMI=y

++ Tested Toolchains ++ (Verified I hit all libc varients)
br-arm-cortex-a9-musl
br-arm-full-static
br-m68k-68040-full    (uclibc)
br-mips32r6-el-hf-glibc
br-mips64-n64-full
br-mips64r6-el-hf-glibc
br-mipsel-o32-full
br-sparc64-glibc
linaro-arm
sourcery-arm

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../0001-musl-compat-canonicalize_file_name.patch  | 37 +++++++++++-----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
index fd606d8..3ae1c2e 100644
--- a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
+++ b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
@@ -1,22 +1,24 @@
-From 85863c9e051fe59add4e47dbfcb37072234f0110 Mon Sep 17 00:00:00 2001
+From 8f6181b6f8dd82aa1ab1288cc7f2fd05d4a2519f Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Mon, 1 May 2017 19:55:07 -0500
 Subject: [PATCH] musl compat canonicalize_file_name()
 
-Adds an inline equivalent of canonicalize_file_name
+Adds an equivalent of canonicalize_file_name
 using realpath().
 
 Bug report (origin of this patch):
 https://bugs.freedesktop.org/show_bug.cgi?id=99944
 
+Bug report has been updated with suggestion to not use inline.
+
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
  configure.ac                |  2 ++
- src/libqmi-glib/qmi-utils.h | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+)
+ src/libqmi-glib/qmi-utils.c | 15 +++++++++++++++
+ 2 files changed, 17 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 162d5ae..9cb82fd 100644
+index c56fa3e..d835db4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -80,6 +80,8 @@ AC_SUBST(GLIB_LIBS)
@@ -28,19 +30,16 @@ index 162d5ae..9cb82fd 100644
  dnl qmi-firmware-update is optional, enabled by default
  AC_ARG_ENABLE([firmware-update],
                AS_HELP_STRING([--enable-firmware-update],
-diff --git a/src/libqmi-glib/qmi-utils.h b/src/libqmi-glib/qmi-utils.h
-index 4fd5199..4869da5 100644
---- a/src/libqmi-glib/qmi-utils.h
-+++ b/src/libqmi-glib/qmi-utils.h
-@@ -29,6 +29,24 @@
- #error "Only <libqmi-glib.h> can be included directly."
- #endif
+diff --git a/src/libqmi-glib/qmi-utils.c b/src/libqmi-glib/qmi-utils.c
+index 29e5f22..26aff9e 100644
+--- a/src/libqmi-glib/qmi-utils.c
++++ b/src/libqmi-glib/qmi-utils.c
+@@ -34,6 +34,21 @@
+ #include "qmi-utils.h"
+ #include "qmi-error-types.h"
  
 +#ifndef HAVE_CANONICALIZE_FILE_NAME
 +#include <limits.h>
-+#include <string.h>
-+#include <stdlib.h>
-+#include <stdio.h>
 +static char * canonicalize_file_name(const char *path)
 +{
 +       char buf[PATH_MAX] = { };
@@ -54,9 +53,9 @@ index 4fd5199..4869da5 100644
 +}
 +#endif
 +
- #include <glib.h>
- 
- G_BEGIN_DECLS
+ /**
+  * SECTION:qmi-utils
+  * @title: Common utilities
 -- 
-2.7.4
+1.9.1
 
-- 
1.9.1
