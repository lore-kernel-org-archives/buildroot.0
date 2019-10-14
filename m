From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 14 Oct 2019 10:40:52 +0200
Subject: [Buildroot] [PATCH] package/libqmi: bump to version 1.24.0
Message-ID: <20191014084052.467808-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop the musl compat patch as it was already included upstream.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 ...1-musl-compat-canonicalize_file_name.patch | 61 -------------------
 package/libqmi/libqmi.hash                    |  2 +-
 package/libqmi/libqmi.mk                      |  4 +-
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 package/libqmi/0001-musl-compat-canonicalize_file_name.patch

diff --git a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
deleted file mode 100644
index 3ae1c2eb47..0000000000
--- a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 8f6181b6f8dd82aa1ab1288cc7f2fd05d4a2519f Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 1 May 2017 19:55:07 -0500
-Subject: [PATCH] musl compat canonicalize_file_name()
-
-Adds an equivalent of canonicalize_file_name
-using realpath().
-
-Bug report (origin of this patch):
-https://bugs.freedesktop.org/show_bug.cgi?id=99944
-
-Bug report has been updated with suggestion to not use inline.
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- configure.ac                |  2 ++
- src/libqmi-glib/qmi-utils.c | 15 +++++++++++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c56fa3e..d835db4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -80,6 +80,8 @@ AC_SUBST(GLIB_LIBS)
- GLIB_MKENUMS=`$PKG_CONFIG --variable=glib_mkenums glib-2.0`
- AC_SUBST(GLIB_MKENUMS)
- 
-+AC_CHECK_FUNCS([canonicalize_file_name])
-+
- dnl qmi-firmware-update is optional, enabled by default
- AC_ARG_ENABLE([firmware-update],
-               AS_HELP_STRING([--enable-firmware-update],
-diff --git a/src/libqmi-glib/qmi-utils.c b/src/libqmi-glib/qmi-utils.c
-index 29e5f22..26aff9e 100644
---- a/src/libqmi-glib/qmi-utils.c
-+++ b/src/libqmi-glib/qmi-utils.c
-@@ -34,6 +34,21 @@
- #include "qmi-utils.h"
- #include "qmi-error-types.h"
- 
-+#ifndef HAVE_CANONICALIZE_FILE_NAME
-+#include <limits.h>
-+static char * canonicalize_file_name(const char *path)
-+{
-+       char buf[PATH_MAX] = { };
-+
-+       snprintf(buf, sizeof(buf) - 1, "%s", path);
-+
-+       if (!realpath(path, buf))
-+               return NULL;
-+
-+       return strdup(buf);
-+}
-+#endif
-+
- /**
-  * SECTION:qmi-utils
-  * @title: Common utilities
--- 
-1.9.1
-
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index ca3c747739..b0a703f3bd 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256	755bbea2a330ac16d56678fbcdd09201ddb14779059ecc895edfac388551d5de  libqmi-1.22.6.tar.xz
+sha256	aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79  libqmi-1.24.0.tar.xz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 78e7b4bea9..62aa176e4f 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.22.6
+LIBQMI_VERSION = 1.24.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_INSTALL_STAGING = YES
-# 0001-musl-compat-canonicalize_file_name.patch
-LIBQMI_AUTORECONF = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-- 
2.23.0
