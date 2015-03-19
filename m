From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 14:02:03 -0700
Subject: [Buildroot] [PATCH] package/libpthsem: correctly handle --{en,
	dis}able-debug arguments on configure
In-Reply-To: <1426798923-13980-1-git-send-email-steven@uplinklabs.net>
References: <1426798923-13980-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426798923-13980-2-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pthsem package was incorrectly handling --{en,dis}able-debug. If either of
the two were provided, it always assumed that meant that debugging should be
enabled, which resulted in *extremely* noisy debug logging (e.g. this can be
observed by generating a GPG keypair).

This patch makes pthsem handle the argument correctly.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 .../0002-fix-configure-disable-debug.patch         | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/libpthsem/0002-fix-configure-disable-debug.patch

diff --git a/package/libpthsem/0002-fix-configure-disable-debug.patch b/package/libpthsem/0002-fix-configure-disable-debug.patch
new file mode 100644
index 0000000..512291e
--- /dev/null
+++ b/package/libpthsem/0002-fix-configure-disable-debug.patch
@@ -0,0 +1,54 @@
+The existing pthsem configure script incorrectly handles the enable-debug and
+disable-debug arguments. The inside of the AC_ARG_ENABLE conditional indicates
+whether or not the value was explicitly defined by the user, not that it was
+enabled. The value of "$enableval" should be checked in order for it to work.
+
+Source: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Package-Options.html
+
+Signed-off-by: Steven Noonan <steven@uplinklabs.net>
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 03b42de..a5b3f98 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -344,7 +344,21 @@ AC_DEFUN(AC_CHECK_DEBUGGING,[dnl
+ AC_ARG_ENABLE(debug,dnl
+ [  --enable-debug          build for debugging (default=no)],
+ [dnl
+-if test ".$ac_cv_prog_gcc" = ".yes"; then
++case "${enableval}" in
++yes)
++  msg="enabled" ;;
++no)
++  msg="disabled" ;;
++esac
++],[
++msg="disabled"
++])dnl
++AC_MSG_CHECKING(for compilation debug mode)
++AC_MSG_RESULT([$msg])
++if test ".$msg" = .enabled; then
++  AC_DEFINE(PTH_DEBUG, 1, [define to enable Pth debugging])
++  enable_shared=no
++  if test ".$ac_cv_prog_gcc" = ".yes"; then
+     case $PLATFORM in
+         *-*-freebsd*|*-*-solaris* ) CFLAGS="$CFLAGS -pedantic" ;;
+     esac
+@@ -354,16 +368,7 @@ if test ".$ac_cv_prog_gcc" = ".yes"; then
+     AC_COMPILER_OPTION(wmore, -W<xxx>, $WMORE, CFLAGS="$CFLAGS $WMORE")
+     AC_COMPILER_OPTION(wnolonglong, -Wno-long-long, -Wno-long-long, CFLAGS="$CFLAGS -Wno-long-long")
+     AC_COMPILER_OPTION(fnostrictaliasing, -fno-strict-aliasing, -fno-strict-aliasing, CFLAGS="$CFLAGS -fno-strict-aliasing")
+-fi
+-msg="enabled"
+-AC_DEFINE(PTH_DEBUG, 1, [define to enable Pth debugging])
+-],[
+-msg="disabled"
+-])dnl
+-AC_MSG_CHECKING(for compilation debug mode)
+-AC_MSG_RESULT([$msg])
+-if test ".$msg" = .enabled; then
+-    enable_shared=no
++  fi
+ fi
+ ])
+ 
-- 
2.3.3
