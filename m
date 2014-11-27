From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:45:49 +0100
Subject: [Buildroot] [git commit] package/nfs-utils: use pkg-config to find
	libtirpc
Message-ID: <20141127224642.354A97FF3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=387bdde5df63a10f526346fe19ea78de6e2f4e94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
    http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
    and probably some others as well...

[Peter: correct tirpc/tirpcinclude mixmatch in patch description]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/0008-tirpc-with-pkgconfig.patch |  102 +++++++++++++++++++++
 package/nfs-utils/nfs-utils.mk                    |    2 +-
 2 files changed, 103 insertions(+), 1 deletions(-)

diff --git a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
new file mode 100644
index 0000000..712f710
--- /dev/null
+++ b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
@@ -0,0 +1,102 @@
+From 1ecd1f2008bfab7bb3cd6ada135c980414a7f1ba Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 23 Nov 2014 15:53:56 +0100
+Subject: [PATCH] configure: use pkg-config to find libtirpc
+
+Currently, we use a custom function to find libtirpc's headers and
+libraries. This works fine for shared linking.
+
+But for static linking, this forgets to link with -lpthread, which is
+required by libtirpc.
+
+A recent patch was sent to libtirpc to add that missing -lpthread in its
+Libs.private section of its .pc file. Thus, pkg-config will soon be able
+to return the appropriate libraries.
+
+So, use pkg-config to find libtirpc.
+
+And for older libtirpc versions, there is no change in behaviour: we're
+still missing the -lpthread. But once libtirpc has been fixed, we'll
+automatically get that missing library for free! :-)
+
+Remove the --with-libirpcinclude flag as it is no longer needed: pkg-config
+will provide us with the -I and -L flags, now.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Steve Dickson <steved@redhat.com>
+
+---
+Patch sent upstream:
+    http://article.gmane.org/gmane.linux.nfs/67708
+---
+ aclocal/libtirpc.m4 | 68 ++++++++++-------------------------------------------
+ 1 file changed, 13 insertions(+), 55 deletions(-)
+
+diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
+index b823364..4a19c1a 100644
+--- a/aclocal/libtirpc.m4
++++ b/aclocal/libtirpc.m4
+@@ -2,50 +2,19 @@ dnl Checks for TI-RPC library and headers
+ dnl
+ AC_DEFUN([AC_LIBTIRPC], [
+ 
+-  AC_ARG_WITH([tirpcinclude],
+-              [AC_HELP_STRING([--with-tirpcinclude=DIR],
+-                              [use TI-RPC headers in DIR])],
+-              [tirpc_header_dir=$withval],
+-              [tirpc_header_dir=/usr/include/tirpc])
+-
+-  dnl if --enable-tirpc was specifed, the following components
+-  dnl must be present, and we set up HAVE_ macros for them.
+-
+-  if test "$enable_tirpc" != "no"; then
+-
+-    dnl look for the library
+-    AC_CHECK_LIB([tirpc], [clnt_tli_create], [:],
+-                 [if test "$enable_tirpc" = "yes"; then
+-			AC_MSG_ERROR([libtirpc not found.])
+-		  else
+-			AC_MSG_WARN([libtirpc not found. TIRPC disabled!])
+-			enable_tirpc="no"
+-		  fi])
+-  fi
+-
+-  if test "$enable_tirpc" != "no"; then
+-    dnl also must have the headers installed where we expect
+-    dnl look for headers; add -I compiler option if found
+-    AC_CHECK_HEADERS([${tirpc_header_dir}/netconfig.h],
+-    		      AC_SUBST([AM_CPPFLAGS], ["-I${tirpc_header_dir}"]),
+-		      [if test "$enable_tirpc" = "yes"; then
+-			 AC_MSG_ERROR([libtirpc headers not found.])
+-		       else
+-			 AC_MSG_WARN([libtirpc headers not found. TIRPC disabled!])
+-			 enable_tirpc="no"
+-		       fi])
+-
+-  fi
+-
+-  dnl now set $LIBTIRPC accordingly
+-  if test "$enable_tirpc" != "no"; then
+-    AC_DEFINE([HAVE_LIBTIRPC], 1,
+-              [Define to 1 if you have and wish to use libtirpc.])
+-    LIBTIRPC="-ltirpc"
+-  else
+-    LIBTIRPC=""
+-  fi
+-
++  PKG_PROG_PKG_CONFIG([0.9.0])
++  AS_IF(
++    [test "$enable_tirpc" != "no"],
++    [PKG_CHECK_MODULES([TIRPC], [libtirpc >= 0.2.4],
++                       [LIBTIRPC="${TIRPC_LIBS}"
++                        AM_CPPFLAGS="${AM_CPPFLAGS} ${TIRPC_CFLAGS}"
++                        AC_DEFINE([HAVE_LIBTIRPC], [1],
++                                  [Define to 1 if you have and wish to use libtirpc.])],
++                       [AS_IF([test "$enable_tirpc" = "yes"],
++                              [AC_MSG_ERROR([libtirpc not found.])],
++                              [LIBTIRPC=""])])])
++
++  AC_SUBST([AM_CPPFLAGS])
+   AC_SUBST(LIBTIRPC)
+ 
+ ])dnl
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 522e790..8b56edf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -28,7 +28,7 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-NFS_UTILS_CONF_OPTS += --enable-tirpc --with-tirpcinclude=$(STAGING_DIR)/usr/include/tirpc/
+NFS_UTILS_CONF_OPTS += --enable-tirpc
 NFS_UTILS_DEPENDENCIES += libtirpc
 else
 NFS_UTILS_CONF_OPTS += --disable-tirpc
