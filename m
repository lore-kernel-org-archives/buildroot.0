From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Wed, 27 Dec 2017 21:34:49 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: add new package
Message-ID: <1514406889-8233-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nilfs-utils provide the user-space utilities for the nilfs2 filesystem.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/Config.in                               |  1 +
 package/nilfs-utils/0001-max-input.patch        | 14 +++++++++++++
 package/nilfs-utils/0002-dynamic-cleanerd.patch | 11 +++++++++++
 package/nilfs-utils/0003-drop-rpc-types-h.patch | 12 ++++++++++++
 package/nilfs-utils/Config.in                   | 10 ++++++++++
 package/nilfs-utils/nilfs-utils.hash            |  2 ++
 package/nilfs-utils/nilfs-utils.mk              | 26 +++++++++++++++++++++++++
 7 files changed, 76 insertions(+)
 create mode 100644 package/nilfs-utils/0001-max-input.patch
 create mode 100644 package/nilfs-utils/0002-dynamic-cleanerd.patch
 create mode 100644 package/nilfs-utils/0003-drop-rpc-types-h.patch
 create mode 100644 package/nilfs-utils/Config.in
 create mode 100644 package/nilfs-utils/nilfs-utils.hash
 create mode 100644 package/nilfs-utils/nilfs-utils.mk

diff --git a/package/Config.in b/package/Config.in
index fc35f12..bbacc7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ menu "Filesystem and flash utilities"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
 	source "package/nfs-utils/Config.in"
+	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
 	source "package/simicsfs/Config.in"
 	source "package/squashfs/Config.in"
diff --git a/package/nilfs-utils/0001-max-input.patch b/package/nilfs-utils/0001-max-input.patch
new file mode 100644
index 0000000..b1542f0
--- /dev/null
+++ b/package/nilfs-utils/0001-max-input.patch
@@ -0,0 +1,14 @@
+--- a/bin/rmcp.c	2017-12-20 00:49:40.560348415 +0100
++++ b/bin/rmcp.c	2017-12-20 00:50:01.780241186 +0100
+@@ -47,6 +47,11 @@
+ #include <limits.h>
+ #endif	/* HAVE_LIMITS_H */
+ 
++/* define MAX_INPUT for libmusl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include <errno.h>
+ #include "nilfs.h"
+ #include "parser.h"
diff --git a/package/nilfs-utils/0002-dynamic-cleanerd.patch b/package/nilfs-utils/0002-dynamic-cleanerd.patch
new file mode 100644
index 0000000..e91f7b2
--- /dev/null
+++ b/package/nilfs-utils/0002-dynamic-cleanerd.patch
@@ -0,0 +1,11 @@
+--- a/sbin/cleanerd/Makefile.am	2017-12-20 00:58:44.737518604 +0100
++++ b/sbin/cleanerd/Makefile.am	2017-12-20 00:58:55.507462752 +0100
+@@ -9,8 +9,6 @@
+ nilfs_cleanerd_CFLAGS = -Wall
+ nilfs_cleanerd_CPPFLAGS = -I$(top_srcdir)/include \
+ 	-DSYSCONFDIR=\"$(sysconfdir)\"
+-# Use -static option to make nilfs_cleanerd self-contained.
+-nilfs_cleanerd_LDFLAGS = -static
+ 
+ dist_sysconf_DATA = nilfs_cleanerd.conf
+ 
diff --git a/package/nilfs-utils/0003-drop-rpc-types-h.patch b/package/nilfs-utils/0003-drop-rpc-types-h.patch
new file mode 100644
index 0000000..0e6326d
--- /dev/null
+++ b/package/nilfs-utils/0003-drop-rpc-types-h.patch
@@ -0,0 +1,12 @@
+--- a/sbin/mount/sundries.h	2017-12-20 01:04:05.455861025 +0100
++++ b/sbin/mount/sundries.h	2017-12-20 01:04:10.475835128 +0100
+@@ -15,9 +15,6 @@
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+-#if !defined(bool_t) && !defined(__GLIBC__)
+-#include <rpc/types.h>
+-#endif
+ 
+ extern int mount_quiet;
+ 
diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
new file mode 100644
index 0000000..abd4a75
--- /dev/null
+++ b/package/nilfs-utils/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NILFS_UTILS
+	bool "nilfs-utils"
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX
+	help
+	  Tools for creating and managing NILFS2 filesystems.
+
+	  https://github.com/nilfs-dev/nilfs-utils
diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
new file mode 100644
index 0000000..e772025
--- /dev/null
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha1	99504805c6f9363fb6b775bea14c5cadfab97898  nilfs-utils-v2.2.7.tar.gz
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
new file mode 100644
index 0000000..99fa22c
--- /dev/null
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# nilfs-utils
+#
+################################################################################
+
+NILFS_UTILS_VERSION = v2.2.7
+NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,$(NILFS_UTILS_VERSION))
+NILFS_UTILS_LICENSE = LGPL-2.1
+NILFS_UTILS_LICENSE_FILES = COPYING
+
+# need libuuid, libblkid, libmount
+NILFS_UTILS_DEPENDENCIES += util-linux
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+NILFS_UTILS_CONF_OPTS += --with-selinux
+NILFS_UTILS_DEPENDENCIES += libselinux
+else
+NILFS_UTILS_CONF_OPTS += --without-selinux
+endif
+
+NILFS_UTILS_CONF_OPTS += --disable-static
+NILFS_UTILS_AUTORECONF=YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.5.rc3
