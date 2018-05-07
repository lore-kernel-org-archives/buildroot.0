From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  7 May 2018 22:51:14 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: check if -latomic is needed.
Message-ID: <20180507195114.16417-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b149aa2ee00e4d6a53c884cf99ecb2dd8af58b65/
http://autobuild.buildroot.net/results/e4b3616ac2695d3b6898185a70da6509b1faa2b8/

Patch the package to check if -latomic is needed to be added, depending on the
result of AC_LINK_IFELSE.

The patch was sent to upstream, see:
https://github.com/zeromq/libzmq/pull/3083

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...nclude.m4-check-if-latomic-is-needed.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch

diff --git a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
new file mode 100644
index 0000000000..3fe290474c
--- /dev/null
+++ b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
@@ -0,0 +1,61 @@
+From 2ec5a33f6e986661dc92f3585ea400f919a39cae Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Mon, 7 May 2018 22:02:25 +0300
+Subject: [PATCH 1/1] acinclude.m4: check if -latomic is needed.
+
+On some cases, -latomic is needed for likning, and since the current
+acinclude.m4 checks only compilation we can sometimes miss the need for -latomic
+and the linking process will fail.
+Therefore, the AC_CHECK_IFELSE was replaced with AC_LINK_IFELSE. If the first
+try fails, we try to link again with -latomic and add LIBS="-latmoic" in case we
+succeeded.
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ acinclude.m4 | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index f648ed0f..26c83ad9 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -668,7 +668,7 @@ dnl # Check if compiler supoorts __atomic_Xxx intrinsics
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_ATOMIC_INTRINSICS], [{
+     AC_MSG_CHECKING(whether compiler supports __atomic_Xxx intrinsics)
+-    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++    AC_LINK_IFELSE([AC_LANG_SOURCE([
+ /* atomic intrinsics test */
+ int v = 0;
+ int main (int, char **)
+@@ -677,9 +677,24 @@ int main (int, char **)
+     return t;
+ }
+     ])],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_has_atomic_instrisics="no"  ; $2]
+-    )
++    [AC_MSG_RESULT(yes) ; GCC_ATOMIC_BUILTINS_SUPPORTED=1 libzmq_cv_has_atomic_instrisics="yes" ; $1])
++
++    if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != x1; then
++        save_LDFLAGS=$LDFLAGS
++        LDFLAGS="$LDFLAGS -latomic"
++        AC_LINK_IFELSE([AC_LANG_SOURCE([
++        /* atomic intrinsics test */
++        int v = 0;
++        int main (int, char **)
++        {
++            int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
++            return t;
++        }
++        ])],
++        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" LIBS="-latomic" ; $1],
++        [AC_MSG_RESULT(no) ; libzmq_cv_has_atomic_instrisics="no"; $2])
++        LDFLAGS=$save_LDFLAGS
++    fi
+ }])
+ 
+ dnl ################################################################################
+-- 
+2.17.0
+
-- 
2.17.0
