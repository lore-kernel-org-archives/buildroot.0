From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Wed,  3 Jan 2018 21:15:44 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static toolchains
Message-ID: <1515010544-28357-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to respect the dependency libmount->libblkid->libuuid
properly in autoconf. This becomes necessary for static builds.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 ...nt-libblkid-fix-order-of-autoconf-probing.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch

diff --git a/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch b/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch
new file mode 100644
index 0000000..78b6902
--- /dev/null
+++ b/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch
@@ -0,0 +1,62 @@
+From 94732d03c5361a9f8f9d0f018e0fd9850a2c7d29 Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Wed, 3 Jan 2018 20:38:15 +0100
+Subject: [PATCH] libmount, libblkid: fix order of autoconf probing
+
+make sure that libuuid is linked during probes.
+Since libmount depends on libblkid, probe libblkid first.
+This fixes autoprobing on systems that use static libraries exclusively
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ configure.ac | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6fa8c41..50250d9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -103,9 +103,20 @@ AC_CHECK_HEADERS([ctype.h err.h fcntl.h grp.h libintl.h limits.h \
+ 		  time.h unistd.h])
+ 
+ # Check for conditional libraries and headers.
++if test "${with_blkid}" = "yes"; then
++   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
++   		[AC_DEFINE(HAVE_LIBBLKID, 1,
++		    [Define to 1 if you have the 'blkid' library (-lblkid).])
++		 LIB_BLKID="-lblkid -luuid"
++		],
++		AC_MSG_ERROR([BLKID library not found]), [-luuid])
++   AC_CHECK_HEADERS([blkid/blkid.h])
++fi
++AC_SUBST(LIB_BLKID)
++
+ if test "${with_libmount}" = "yes"; then
+-   AC_CHECK_LIB(mount, mnt_context_do_mount, [LIB_MOUNT="-lmount"],
+-   	AC_MSG_ERROR([Mount library is enabled but libmount not found]))
++   AC_CHECK_LIB(mount, mnt_context_do_mount, [LIB_MOUNT="-lmount $LIB_BLKID"],
++   	AC_MSG_ERROR([Mount library is enabled but libmount not found]), [$LIB_BLKID])
+    AC_CHECK_HEADERS([libmount/libmount.h])
+    with_selinux=no
+ fi
+@@ -124,17 +135,6 @@ if test "${with_selinux}" = "yes"; then
+ fi
+ AC_SUBST([LIB_SELINUX])
+ 
+-if test "${with_blkid}" = "yes"; then
+-   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
+-   		[AC_DEFINE(HAVE_LIBBLKID, 1,
+-		    [Define to 1 if you have the 'blkid' library (-lblkid).])
+-		 LIB_BLKID="-lblkid"
+-		],
+-		AC_MSG_ERROR([BLKID library not found]))
+-   AC_CHECK_HEADERS([blkid/blkid.h])
+-fi
+-AC_SUBST(LIB_BLKID)
+-
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ AC_C_INLINE
+-- 
+1.8.5.rc3
+
-- 
1.8.5.rc3
