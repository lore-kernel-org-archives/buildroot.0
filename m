From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 14:20:02 +0100
Subject: [Buildroot] [PATCH 4/4] package/nfs-utils: use pkg-config to find
	libtirpc
In-Reply-To: <cover.1416748649.git.yann.morin.1998@free.fr>
References: <cover.1416748649.git.yann.morin.1998@free.fr>
Message-ID: <11a2fb7a110021c76aeee7d6ee193932d6c5b569.1416748649.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
    http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
    and probably some others as well...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nfs-utils/0008-tirpc-with-pkgconfig.patch | 71 +++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch

diff --git a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
new file mode 100644
index 0000000..c94b380
--- /dev/null
+++ b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
@@ -0,0 +1,71 @@
+configure: use pkg-config to find libtirpc
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN nfs-utils-1.2.6.orig/aclocal/libtirpc.m4 nfs-utils-1.2.6/aclocal/libtirpc.m4
+--- nfs-utils-1.2.6.orig/aclocal/libtirpc.m4	2012-05-14 16:40:52.000000000 +0200
++++ nfs-utils-1.2.6/aclocal/libtirpc.m4	2014-11-23 12:28:53.933717440 +0100
+@@ -11,40 +11,13 @@
+   dnl if --enable-tirpc was specifed, the following components
+   dnl must be present, and we set up HAVE_ macros for them.
+ 
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
++  PKG_CHECK_MODULES([TIRPC], [libtirpc >= 0.2.4],
++                    [LIBTIRPC="${TIRPC_LIBS}"
++                     AM_CPPFLAGS="${AM_CPPFLAGS} ${TIRPC_CFLAGS}"
++                     AC_DEFINE([HAVE_LIBTIRPC], [1],
++                               [Define to 1 if you have and wish to use libtirpc.])],
++                    [AS_IF([test "$enable_tirpc" != "no"], [AC_MSG_ERROR([libtirpc not found.])],
++                           [LIBTIRPC=""])])
+ 
+   AC_SUBST(LIBTIRPC)
+ 
+diff -durN nfs-utils-1.2.6.orig/configure.ac nfs-utils-1.2.6/configure.ac
+--- nfs-utils-1.2.6.orig/configure.ac	2014-11-23 13:48:42.636192256 +0100
++++ nfs-utils-1.2.6/configure.ac	2014-11-23 13:53:15.695249004 +0100
+@@ -420,6 +420,12 @@
+ AC_DEFINE_UNQUOTED(NFS_STATEDIR, "$statedir", [This defines the location of the NFS state files. Warning: this must match definitions in config.mk!])
+ AC_DEFINE_UNQUOTED(NSM_DEFAULT_STATEDIR, "$statdpath", [Define this to the pathname where statd keeps its state file])
+ 
++dnl *************************************************************
++dnl Aggregate all CFLAGS and CPPFLAGS
++dnl *************************************************************
++CFLAGS="$CFLAGS $AM_CPPFLAGS"
++CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"
++
+ if test "x$cross_compiling" = "xno"; then
+ 	CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-"$CFLAGS"}
+ 	CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-"$CXXFLAGS"}
-- 
1.9.1
