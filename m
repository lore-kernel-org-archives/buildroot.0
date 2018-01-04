From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu,  4 Jan 2018 11:10:52 +0100
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <1515060652-22472-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to respect the dependency libmount->libblkid->libuuid
properly in autoconf. This becomes necessary for static builds.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 ...e-PKG_CHECK_MODULES-for-libmount-and-libb.patch | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch

diff --git a/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch b/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch
new file mode 100644
index 0000000..3ec4d43
--- /dev/null
+++ b/package/nilfs-utils/0004-autoconf-use-PKG_CHECK_MODULES-for-libmount-and-libb.patch
@@ -0,0 +1,139 @@
+From b98acc19604c9cfd473a2932cc69c1e0a6493ae1 Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Thu, 4 Jan 2018 09:47:45 +0100
+Subject: [PATCH] autoconf: use PKG_CHECK_MODULES for libmount and libblkid
+
+The dependencies of libmount to libblkid and libblkid to libuuid
+were not handled correctly, and only work for the shared object scenario.
+This commit switches the autoconfiguration to use PKG_CHECK_MODULES
+which handles the static vs. dynamic case.
+This commit has been compile-tested using buildroot on different compilers,
+including static & dynamic ones
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ configure.ac                 | 9 ++-------
+ sbin/mkfs/Makefile.am        | 4 ++--
+ sbin/mkfs/mkfs.c             | 6 +++---
+ sbin/mount/Makefile.am       | 4 ++--
+ sbin/mount/mount_libmount.c  | 4 +---
+ sbin/mount/umount_libmount.c | 2 --
+ 6 files changed, 10 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6fa8c41..83f52eb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -104,13 +104,11 @@ AC_CHECK_HEADERS([ctype.h err.h fcntl.h grp.h libintl.h limits.h \
+ 
+ # Check for conditional libraries and headers.
+ if test "${with_libmount}" = "yes"; then
+-   AC_CHECK_LIB(mount, mnt_context_do_mount, [LIB_MOUNT="-lmount"],
++   PKG_CHECK_MODULES([MOUNT], [mount],,
+    	AC_MSG_ERROR([Mount library is enabled but libmount not found]))
+-   AC_CHECK_HEADERS([libmount/libmount.h])
+    with_selinux=no
+ fi
+ AM_CONDITIONAL(CONFIG_LIBMOUNT, [test "$with_libmount" = "yes"])
+-AC_SUBST(LIB_MOUNT)
+ 
+ if test "${with_selinux}" = "yes"; then
+    AC_CHECK_LIB(selinux, getprevcon,
+@@ -125,15 +123,12 @@ fi
+ AC_SUBST([LIB_SELINUX])
+ 
+ if test "${with_blkid}" = "yes"; then
+-   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
++   PKG_CHECK_MODULES([BLKID], [blkid],
+    		[AC_DEFINE(HAVE_LIBBLKID, 1,
+ 		    [Define to 1 if you have the 'blkid' library (-lblkid).])
+-		 LIB_BLKID="-lblkid"
+ 		],
+ 		AC_MSG_ERROR([BLKID library not found]))
+-   AC_CHECK_HEADERS([blkid/blkid.h])
+ fi
+-AC_SUBST(LIB_BLKID)
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+diff --git a/sbin/mkfs/Makefile.am b/sbin/mkfs/Makefile.am
+index 28f5128..408c976 100644
+--- a/sbin/mkfs/Makefile.am
++++ b/sbin/mkfs/Makefile.am
+@@ -1,8 +1,8 @@
+ ## Makefile.am
+ 
+-AM_CFLAGS = -Wall
++AM_CFLAGS = -Wall $(BLKID_CFLAGS)
+ AM_CPPFLAGS = -I$(top_srcdir)/include
+-LDADD = -luuid $(LIB_BLKID) $(top_builddir)/lib/libnilfsfeature.la \
++LDADD = -luuid $(BLKID_LIBS) $(top_builddir)/lib/libnilfsfeature.la \
+ 	$(top_builddir)/lib/libmountchk.la \
+ 	$(top_builddir)/lib/libcrc32.la
+ 
+diff --git a/sbin/mkfs/mkfs.c b/sbin/mkfs/mkfs.c
+index d7f161e..0c45d6a 100644
+--- a/sbin/mkfs/mkfs.c
++++ b/sbin/mkfs/mkfs.c
+@@ -66,9 +66,9 @@
+ 
+ #include <errno.h>
+ 
+-#if HAVE_BLKID_BLKID_H
+-#include <blkid/blkid.h>
+-#endif	/* HAVE_BLKID_BLKID_H */
++#if HAVE_LIBBLKID
++#include <blkid.h>
++#endif	/* HAVE_LIBBLKID */
+ 
+ #include "nilfs.h"
+ #include "util.h"
+diff --git a/sbin/mount/Makefile.am b/sbin/mount/Makefile.am
+index f5d3c27..9554aa5 100644
+--- a/sbin/mount/Makefile.am
++++ b/sbin/mount/Makefile.am
+@@ -6,10 +6,10 @@ COMMONHEADERS = mount.nilfs2.h sundries.h xmalloc.h
+ LEGACYSOURCES = fstab.c mount_mntent.c mount_opts.c
+ LEGACYHEADERS = fstab.h mount_constants.h mount_mntent.h mount_opts.h
+ 
+-AM_CFLAGS = -Wall
++AM_CFLAGS = -Wall $(MOUNT_CFLAGS)
+ AM_CPPFLAGS = -I$(top_srcdir)/include
+ LDADD = $(top_builddir)/lib/librealpath.la \
+-	$(top_builddir)/lib/libcleanerexec.la $(LIB_MOUNT) $(LIB_SELINUX) \
++	$(top_builddir)/lib/libcleanerexec.la $(MOUNT_LIBS) $(LIB_SELINUX) \
+ 	$(LIB_POSIX_TIMER)
+ 
+ root_sbin_PROGRAMS = mount.nilfs2 umount.nilfs2
+diff --git a/sbin/mount/mount_libmount.c b/sbin/mount/mount_libmount.c
+index ef40e68..a7fec00 100644
+--- a/sbin/mount/mount_libmount.c
++++ b/sbin/mount/mount_libmount.c
+@@ -67,9 +67,7 @@
+ #include <syslog.h>
+ #endif	/* HAVE_SYSLOG_H */
+ 
+-#if HAVE_LIBMOUNT_LIBMOUNT_H
+-#include <libmount/libmount.h>
+-#endif	/* HAVE_LIBMOUNT_H */
++#include <libmount.h>
+ 
+ #include <stdarg.h>
+ #include <errno.h>
+diff --git a/sbin/mount/umount_libmount.c b/sbin/mount/umount_libmount.c
+index ae5a337..2987f5d 100644
+--- a/sbin/mount/umount_libmount.c
++++ b/sbin/mount/umount_libmount.c
+@@ -59,9 +59,7 @@
+ #include <syslog.h>
+ #endif	/* HAVE_SYSLOG_H */
+ 
+-#if HAVE_LIBMOUNT_LIBMOUNT_H
+ #include <libmount/libmount.h>
+-#endif	/* HAVE_LIBMOUNT_H */
+ 
+ #include <stdarg.h>
+ #include <errno.h>
+-- 
+1.8.5.rc3
+
-- 
1.8.5.rc3
