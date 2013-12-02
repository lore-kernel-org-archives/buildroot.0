From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 2 Dec 2013 10:51:05 +0000
Subject: [Buildroot] [PATCH] glibc: Backport upstream patch to accept
	make-4.0 or newer
Message-ID: <1385981465-763-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) added support for
make-4.0 or newer. We backport this patch to allow glibc to build on hosts
running the latest version of 'make'.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Two patches are necessary and they should not be in the top-level package
directory.
- eglibc snapshot may be bumped to a different revision in the future and the
patch may not be applicable to eglibc anymore.
- For egligc, the glibc code is located in the libc subdirectory. The patches are
applied with -p1 so the same patch can't be shared between eglibc and glibc.
---
 .../2.18-svnr23787/glibc-0001-accept-make4.patch   | 33 ++++++++++++++++++++++
 package/glibc/2.18/glibc-0001-accept-make4.patch   | 33 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
 create mode 100644 package/glibc/2.18/glibc-0001-accept-make4.patch

diff --git a/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch b/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
new file mode 100644
index 0000000..4f426f2
--- /dev/null
+++ b/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
@@ -0,0 +1,33 @@
+Backport upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) to accept
+make-4.0 or newer.
+We patch both configure and configure.in files so if we ever have to run
+autoreconf in the glibc source, then the fix will be propagated properly.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: glibc-2.18-svnr23787/libc/configure
+===================================================================
+--- glibc-2.18-svnr23787.orig/libc/configure
++++ glibc-2.18-svnr23787/libc/configure
+@@ -4772,7 +4772,7 @@ $as_echo_n "checking version of $MAKE...
+   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    3.79* | 3.[89]*)
++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+Index: glibc-2.18-svnr23787/libc/configure.in
+===================================================================
+--- glibc-2.18-svnr23787.orig/libc/configure.in
++++ glibc-2.18-svnr23787/libc/configure.in
+@@ -989,7 +989,7 @@ AC_CHECK_PROG_VER(CC, ${ac_tool_prefix}g
+   critic_missing="$critic_missing gcc")
+ AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
+   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
+-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
+ 
+ AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
+   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/package/glibc/2.18/glibc-0001-accept-make4.patch b/package/glibc/2.18/glibc-0001-accept-make4.patch
new file mode 100644
index 0000000..49db374
--- /dev/null
+++ b/package/glibc/2.18/glibc-0001-accept-make4.patch
@@ -0,0 +1,33 @@
+Backport upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) to accept
+make-4.0 or newer.
+We patch both configure and configure.in files so if we ever have to run
+autoreconf in the glibc source, then the fix will be propagated properly.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: glibc-2.18/configure
+===================================================================
+--- glibc-2.18.orig/configure
++++ glibc-2.18/configure
+@@ -4772,7 +4772,7 @@ $as_echo_n "checking version of $MAKE...
+   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    3.79* | 3.[89]*)
++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+Index: glibc-2.18/configure.in
+===================================================================
+--- glibc-2.18.orig/configure.in
++++ glibc-2.18/configure.in
+@@ -989,7 +989,7 @@ AC_CHECK_PROG_VER(CC, ${ac_tool_prefix}g
+   critic_missing="$critic_missing gcc")
+ AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
+   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
+-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
+ 
+ AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
+   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
-- 
1.8.4.4
