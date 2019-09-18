From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Sep 2019 19:03:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/nilfs-utils: bump to version 2.2.8
Message-ID: <20190918170338.31163-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Change NILFS_UTILS_SITE to https://nilfs.sourceforge.io as this is the
  official site with the official tarballs
- Remove first and third patch (already in version)
- Drop fourth patch and host-pkgconf from dependencies, not needed since
  https://github.com/nilfs-dev/nilfs-utils/commit/d5ce780856db5200917b69cd1049bd7b839ac6bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-nilfs-utils-use-_POSIX_MAX_INPUT.patch |  32 ----
 ...001-nilfs_cleanerd-link-dynamically.patch} |   0
 ...mount.nilfs-drop-include-rpc-types.h.patch |  32 ----
 ..._CHECK_MODULES-for-libmount-and-libb.patch | 141 ------------------
 package/nilfs-utils/Config.in                 |   2 +-
 package/nilfs-utils/nilfs-utils.hash          |   2 +-
 package/nilfs-utils/nilfs-utils.mk            |   9 +-
 7 files changed, 7 insertions(+), 211 deletions(-)
 delete mode 100644 package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
 rename package/nilfs-utils/{0002-nilfs_cleanerd-link-dynamically.patch => 0001-nilfs_cleanerd-link-dynamically.patch} (100%)
 delete mode 100644 package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
 delete mode 100644 package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch

diff --git a/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch b/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
deleted file mode 100644
index f14079a5c5..0000000000
--- a/package/nilfs-utils/0001-nilfs-utils-use-_POSIX_MAX_INPUT.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c6e5a79b130ac33093c36f972be49454f506be7e Mon Sep 17 00:00:00 2001
-From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
-Date: Thu, 28 Dec 2017 20:06:38 +0100
-Subject: [PATCH] nilfs-utils: use _POSIX_MAX_INPUT
-
-musl does provide _POSIX_MAX_INPUT, but no MAX_INPUT out of the box.
-This commit assigns _POSIX_MAX_INPUT to MAX_INPUT.
-
-Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
----
- bin/rmcp.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/bin/rmcp.c b/bin/rmcp.c
-index 0140f56..6773912 100644
---- a/bin/rmcp.c
-+++ b/bin/rmcp.c
-@@ -47,6 +47,11 @@
- #include <limits.h>
- #endif	/* HAVE_LIMITS_H */
- 
-+/* define MAX_INPUT for musl */
-+#ifndef MAX_INPUT
-+#define MAX_INPUT _POSIX_MAX_INPUT
-+#endif
-+
- #include <errno.h>
- #include "nilfs.h"
- #include "parser.h"
--- 
-1.8.5.rc3
-
diff --git a/package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch b/package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch
similarity index 100%
rename from package/nilfs-utils/0002-nilfs_cleanerd-link-dynamically.patch
rename to package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch
diff --git a/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch b/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
deleted file mode 100644
index 9d54c40fcc..0000000000
--- a/package/nilfs-utils/0003-mount.nilfs-drop-include-rpc-types.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a924a05ea6fd8c5284983a09d1ea8993124b6b77 Mon Sep 17 00:00:00 2001
-From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
-Date: Thu, 28 Dec 2017 20:26:09 +0100
-Subject: [PATCH] mount.nilfs: drop include rpc/types.h
-
-rpc/types.h does not exist on low-footprint musl toolchains,
-and is only required for the boolean types, which musl provides
-elsewhere.
-This commit drops the include completely.
-
-Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
----
- sbin/mount/sundries.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/sbin/mount/sundries.h b/sbin/mount/sundries.h
-index b3064a7..94d8ce4 100644
---- a/sbin/mount/sundries.h
-+++ b/sbin/mount/sundries.h
-@@ -15,9 +15,6 @@
- #include <signal.h>
- #include <stdarg.h>
- #include <stdlib.h>
--#if !defined(bool_t) && !defined(__GLIBC__)
--#include <rpc/types.h>
--#endif
- 
- extern int mount_quiet;
- 
--- 
-1.8.5.rc3
-
diff --git a/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch b/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch
deleted file mode 100644
index 49cdd26610..0000000000
--- a/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 65ce9b4817544734770e410c5c2779065152f991 Mon Sep 17 00:00:00 2001
-From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
-Date: Thu, 4 Jan 2018 09:47:45 +0100
-Subject: [PATCH] autoconf: use PKG_CHECK_MODULES for libmount and libblkid
-
-The dependencies of libmount to libblkid and libblkid to libuuid
-were not handled correctly, and only work for the shared object scenario.
-This commit switches the autoconfiguration to use PKG_CHECK_MODULES
-which handles the static vs. dynamic case.
-This commit has been compile-tested using buildroot on different compilers,
-including static & dynamic ones
-
-Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
----
- configure.ac                 | 13 +++----------
- sbin/mkfs/Makefile.am        |  4 ++--
- sbin/mkfs/mkfs.c             |  6 +++---
- sbin/mount/Makefile.am       |  4 ++--
- sbin/mount/mount_libmount.c  |  4 +---
- sbin/mount/umount_libmount.c |  4 +---
- 6 files changed, 12 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6fa8c41..3e31e55 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -104,13 +104,10 @@ AC_CHECK_HEADERS([ctype.h err.h fcntl.h grp.h libintl.h limits.h \
- 
- # Check for conditional libraries and headers.
- if test "${with_libmount}" = "yes"; then
--   AC_CHECK_LIB(mount, mnt_context_do_mount, [LIB_MOUNT="-lmount"],
--   	AC_MSG_ERROR([Mount library is enabled but libmount not found]))
--   AC_CHECK_HEADERS([libmount/libmount.h])
-+   PKG_CHECK_MODULES([MOUNT], [mount])
-    with_selinux=no
- fi
- AM_CONDITIONAL(CONFIG_LIBMOUNT, [test "$with_libmount" = "yes"])
--AC_SUBST(LIB_MOUNT)
- 
- if test "${with_selinux}" = "yes"; then
-    AC_CHECK_LIB(selinux, getprevcon,
-@@ -125,15 +122,11 @@ fi
- AC_SUBST([LIB_SELINUX])
- 
- if test "${with_blkid}" = "yes"; then
--   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
-+   PKG_CHECK_MODULES([BLKID], [blkid],
-    		[AC_DEFINE(HAVE_LIBBLKID, 1,
- 		    [Define to 1 if you have the 'blkid' library (-lblkid).])
--		 LIB_BLKID="-lblkid"
--		],
--		AC_MSG_ERROR([BLKID library not found]))
--   AC_CHECK_HEADERS([blkid/blkid.h])
-+		])
- fi
--AC_SUBST(LIB_BLKID)
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
-diff --git a/sbin/mkfs/Makefile.am b/sbin/mkfs/Makefile.am
-index 28f5128..408c976 100644
---- a/sbin/mkfs/Makefile.am
-+++ b/sbin/mkfs/Makefile.am
-@@ -1,8 +1,8 @@
- ## Makefile.am
- 
--AM_CFLAGS = -Wall
-+AM_CFLAGS = -Wall $(BLKID_CFLAGS)
- AM_CPPFLAGS = -I$(top_srcdir)/include
--LDADD = -luuid $(LIB_BLKID) $(top_builddir)/lib/libnilfsfeature.la \
-+LDADD = -luuid $(BLKID_LIBS) $(top_builddir)/lib/libnilfsfeature.la \
- 	$(top_builddir)/lib/libmountchk.la \
- 	$(top_builddir)/lib/libcrc32.la
- 
-diff --git a/sbin/mkfs/mkfs.c b/sbin/mkfs/mkfs.c
-index d7f161e..0c45d6a 100644
---- a/sbin/mkfs/mkfs.c
-+++ b/sbin/mkfs/mkfs.c
-@@ -66,9 +66,9 @@
- 
- #include <errno.h>
- 
--#if HAVE_BLKID_BLKID_H
--#include <blkid/blkid.h>
--#endif	/* HAVE_BLKID_BLKID_H */
-+#if HAVE_LIBBLKID
-+#include <blkid.h>
-+#endif	/* HAVE_LIBBLKID */
- 
- #include "nilfs.h"
- #include "util.h"
-diff --git a/sbin/mount/Makefile.am b/sbin/mount/Makefile.am
-index f5d3c27..9554aa5 100644
---- a/sbin/mount/Makefile.am
-+++ b/sbin/mount/Makefile.am
-@@ -6,10 +6,10 @@ COMMONHEADERS = mount.nilfs2.h sundries.h xmalloc.h
- LEGACYSOURCES = fstab.c mount_mntent.c mount_opts.c
- LEGACYHEADERS = fstab.h mount_constants.h mount_mntent.h mount_opts.h
- 
--AM_CFLAGS = -Wall
-+AM_CFLAGS = -Wall $(MOUNT_CFLAGS)
- AM_CPPFLAGS = -I$(top_srcdir)/include
- LDADD = $(top_builddir)/lib/librealpath.la \
--	$(top_builddir)/lib/libcleanerexec.la $(LIB_MOUNT) $(LIB_SELINUX) \
-+	$(top_builddir)/lib/libcleanerexec.la $(MOUNT_LIBS) $(LIB_SELINUX) \
- 	$(LIB_POSIX_TIMER)
- 
- root_sbin_PROGRAMS = mount.nilfs2 umount.nilfs2
-diff --git a/sbin/mount/mount_libmount.c b/sbin/mount/mount_libmount.c
-index ef40e68..a7fec00 100644
---- a/sbin/mount/mount_libmount.c
-+++ b/sbin/mount/mount_libmount.c
-@@ -67,9 +67,7 @@
- #include <syslog.h>
- #endif	/* HAVE_SYSLOG_H */
- 
--#if HAVE_LIBMOUNT_LIBMOUNT_H
--#include <libmount/libmount.h>
--#endif	/* HAVE_LIBMOUNT_H */
-+#include <libmount.h>
- 
- #include <stdarg.h>
- #include <errno.h>
-diff --git a/sbin/mount/umount_libmount.c b/sbin/mount/umount_libmount.c
-index ae5a337..b678f54 100644
---- a/sbin/mount/umount_libmount.c
-+++ b/sbin/mount/umount_libmount.c
-@@ -59,9 +59,7 @@
- #include <syslog.h>
- #endif	/* HAVE_SYSLOG_H */
- 
--#if HAVE_LIBMOUNT_LIBMOUNT_H
--#include <libmount/libmount.h>
--#endif	/* HAVE_LIBMOUNT_H */
-+#include <libmount.h>
- 
- #include <stdarg.h>
- #include <errno.h>
--- 
-1.8.5.rc3
-
diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index 7b239b1af5..30d7dba75d 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NILFS_UTILS
 	help
 	  Tools for creating and managing NILFS2 filesystems.
 
-	  https://github.com/nilfs-dev/nilfs-utils
+	  https://nilfs.sourceforge.io
 
 comment "nilfs-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index 3383bfc9d8..ad6a57d8f5 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512	8a73b807bbdb2dc56b100ab8fbffe8129c9db31a6cbceecf267bdeb726fc13dd6844ce8ef96690bd7786709cb884881a3cd6d3cf24290248c5abc457976e9487  nilfs-utils-2.2.7.tar.gz
+sha512	3232390581f63de5ebe7b461b178a40dfbdaa4bc6aa96b218ea8182c5bf81b162a1e632a1c21d9f1e89fdba9393b4e268e001c335a99ce22f645a62ae3154783  nilfs-utils-2.2.8.tar.bz2
 sha512	4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index d740589ee5..7335d87209 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = 2.2.7
-NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,v$(NILFS_UTILS_VERSION))
+NILFS_UTILS_VERSION = 2.2.8
+NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
+NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 NILFS_UTILS_LICENSE_FILES = COPYING
 
 # need libuuid, libblkid, libmount
-NILFS_UTILS_DEPENDENCIES = host-pkgconf util-linux
+NILFS_UTILS_DEPENDENCIES = util-linux
 
-# we're fetching from github
+# We're patching sbin/cleanerd/Makefile.am
 NILFS_UTILS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.23.0
