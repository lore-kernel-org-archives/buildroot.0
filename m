From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 13 Dec 2014 18:43:06 +0100
Subject: [Buildroot] [PATCH 1/3] bdwgc: add patch automatically detecting
	for NO_GETCONTEXT need
Message-ID: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is necessary to successfully build guile with toolchain
missing its support.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

diff --git a/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
new file mode 100644
index 0000000..912a659
--- /dev/null
+++ b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
@@ -0,0 +1,38 @@
+From e4448da044338f81548c13cb7eda2a49074156b3 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 8 Dec 2014 21:17:10 +0100
+Subject: [PATCH] configure.ac: add check for NO_GETCONTEXT definition
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 6551cbd..c3a0454 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -365,6 +365,20 @@ if test "$GCC" = yes; then
+   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
+ fi
+ 
++AC_MSG_CHECKING(for NO_GETCONTEXT need)
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[
++    #include <ucontext.h>
++  ]],[[
++    getcontext(0);
++  ]])],[need_no_getcontext=no],[need_no_getcontext=yes])
++AC_MSG_RESULT($need_no_getcontext)
++if test x$need_no_getcontext = xyes ; then
++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
++  CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
++fi
++AC_MSG_NOTICE([[CFLAGS=$CFLAGS]])
++AC_MSG_NOTICE([[CPPFLAGS=$CPPFLAGS]])
++
+ case "$host" in
+ # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
+ # and unnecessary everywhere.
+-- 
+2.1.3
+
-- 
2.1.3
