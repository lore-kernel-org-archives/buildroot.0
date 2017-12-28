From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 28 Dec 2017 20:45:55 +0100
Subject: [Buildroot] [PATCH v2] nilfs-utils: add new package
Message-ID: <1514490355-5272-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nilfs-utils provides the user-space utilities for the nilfs2 filesystem.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
Note: the package has not been tested using utils/test-pkg yet. I do suspect issues
using uclibc toolchains given '0003...patch', yet I was unable to do the test.
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch    | 32 ++++++++++++++++++++++
 .../0002-nilfs_cleanerd-link-dynamically.patch     | 32 ++++++++++++++++++++++
 ...0003-mount.nilfs-drop-include-rpc-types.h.patch | 32 ++++++++++++++++++++++
 package/nilfs-utils/Config.in                      | 11 ++++++++
 package/nilfs-utils/nilfs-utils.hash               |  3 ++
 package/nilfs-utils/nilfs-utils.mk                 | 24 ++++++++++++++++
 8 files changed, 136 insertions(+)
 create mode 100644 package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
 create mode 100644 package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch
 create mode 100644 package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
 create mode 100644 package/nilfs-utils/Config.in
 create mode 100644 package/nilfs-utils/nilfs-utils.hash
 create mode 100644 package/nilfs-utils/nilfs-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dddc1e1..5f30bcc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -951,6 +951,7 @@ F:	package/linuxconsoletools/
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
 F:	package/libpthsem/
+F:	package/nilfs-utils/
 
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
diff --git a/package/Config.in b/package/Config.in
index 9c9a4a7..26820ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ menu "Filesystem and flash utilities"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
 	source "package/nfs-utils/Config.in"
+	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
diff --git a/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch b/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
new file mode 100644
index 0000000..f14079a
--- /dev/null
+++ b/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
@@ -0,0 +1,32 @@
+From c6e5a79b130ac33093c36f972be49454f506be7e Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Thu, 28 Dec 2017 20:06:38 +0100
+Subject: [PATCH] nilfs-utils: use _POSIX_MAX_INPUT
+
+musl does provide _POSIX_MAX_INPUT, but no MAX_INPUT out of the box.
+This commit assigns _POSIX_MAX_INPUT to MAX_INPUT.
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ bin/rmcp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/bin/rmcp.c b/bin/rmcp.c
+index 0140f56..6773912 100644
+--- a/bin/rmcp.c
++++ b/bin/rmcp.c
+@@ -47,6 +47,11 @@
+ #include <limits.h>
+ #endif	/* HAVE_LIMITS_H */
+ 
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include <errno.h>
+ #include "nilfs.h"
+ #include "parser.h"
+-- 
+1.8.5.rc3
+
diff --git a/package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch b/package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch
new file mode 100644
index 0000000..ab057b2
--- /dev/null
+++ b/package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch
@@ -0,0 +1,32 @@
+From 7888f8f24ec08cdfd51929cde4e177396d7504e7 Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Thu, 28 Dec 2017 20:22:00 +0100
+Subject: [PATCH] nilfs_cleanerd: link dynamically
+
+When nilfs_cleanerd does not run due to shared object problems,
+nilfs2 filesystems may run out of space soon.
+This logic that justified linking nilfs_cleanerd statically
+does IMO not apply to embedded systems built by buildroot.
+This commit therefore drops the static linking.
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ sbin/cleanerd/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/sbin/cleanerd/Makefile.am b/sbin/cleanerd/Makefile.am
+index 3a5335d..06f0847 100644
+--- a/sbin/cleanerd/Makefile.am
++++ b/sbin/cleanerd/Makefile.am
+@@ -9,8 +9,6 @@ nilfs_cleanerd_SOURCES = cleanerd.c cldconfig.c \
+ nilfs_cleanerd_CFLAGS = -Wall
+ nilfs_cleanerd_CPPFLAGS = -I$(top_srcdir)/include \
+ 	-DSYSCONFDIR=\"$(sysconfdir)\"
+-# Use -static option to make nilfs_cleanerd self-contained.
+-nilfs_cleanerd_LDFLAGS = -static
+ 
+ dist_sysconf_DATA = nilfs_cleanerd.conf
+ 
+-- 
+1.8.5.rc3
+
diff --git a/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch b/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
new file mode 100644
index 0000000..9d54c40
--- /dev/null
+++ b/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
@@ -0,0 +1,32 @@
+From a924a05ea6fd8c5284983a09d1ea8993124b6b77 Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Thu, 28 Dec 2017 20:26:09 +0100
+Subject: [PATCH] mount.nilfs: drop include rpc/types.h
+
+rpc/types.h does not exist on low-footprint musl toolchains,
+and is only required for the boolean types, which musl provides
+elsewhere.
+This commit drops the include completely.
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ sbin/mount/sundries.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/sbin/mount/sundries.h b/sbin/mount/sundries.h
+index b3064a7..94d8ce4 100644
+--- a/sbin/mount/sundries.h
++++ b/sbin/mount/sundries.h
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
+-- 
+1.8.5.rc3
+
diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
new file mode 100644
index 0000000..2763af5
--- /dev/null
+++ b/package/nilfs-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NILFS_UTILS
+	bool "nilfs-utils"
+	depends on BR2_USE_MMU # util-linux libmount, libblkid
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
index 0000000..bf80367
--- /dev/null
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+sha512	8a73b807bbdb2dc56b100ab8fbffe8129c9db31a6cbceecf267bdeb726fc13dd6844ce8ef96690bd7786709cb884881a3cd6d3cf24290248c5abc457976e9487  nilfs-utils-v2.2.7.tar.gz
+sha512	4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
new file mode 100644
index 0000000..fb2d61c
--- /dev/null
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -0,0 +1,24 @@
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
+NILFS_UTILS_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+NILFS_UTILS_CONF_OPTS += --with-selinux
+NILFS_UTILS_DEPENDENCIES += libselinux
+else
+NILFS_UTILS_CONF_OPTS += --without-selinux
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.rc3
