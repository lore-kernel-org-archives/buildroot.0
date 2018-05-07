From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  7 May 2018 23:26:23 +0300
Subject: [Buildroot] [PATCH v2 1/1] zeromq: check if -latomic is needed
Message-ID: <20180507202623.29498-1-asafka7@gmail.com>
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

v2: fix typos and small refactoring.

 ...nclude.m4-check-if-latomic-is-needed.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch

diff --git a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
new file mode 100644
index 0000000000..6f3671c4a0
--- /dev/null
+++ b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
@@ -0,0 +1,70 @@
+From 9f4ca582555b208d065f730b5ce3b1901136b275 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Mon, 7 May 2018 23:19:09 +0300
+Subject: [PATCH 1/1] acinclude.m4: check if -latomic is needed
+
+On some cases, -latomic is needed for linking, and since the current
+acinclude.m4 checks only compilation we can sometimes miss the need for -latomic
+and the linking process will fail.
+Therefore, the AC_CHECK_IFELSE was replaced with AC_LINK_IFELSE. If the first
+try fails, we try to link again with -latomic and add LIBS="-latomic" in case we
+succeeded.
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ acinclude.m4 | 32 ++++++++++++++++++++++++++++----
+ 1 file changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index f648ed0f..aa35195f 100644
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
+@@ -677,9 +677,33 @@ int main (int, char **)
+     return t;
+ }
+     ])],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_has_atomic_instrisics="no"  ; $2]
+-    )
++    [libzmq_cv_has_atomic_instrisics="yes"],
++    [libzmq_cv_has_atomic_instrisics="no"])
++
++    if test "x$libzmq_cv_has_atomic_instrisics" = "xno"; then
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
++        [libzmq_cv_has_atomic_instrisics="yes" LIBS="-latomic"],
++        [libzmq_cv_has_atomic_instrisics="no"])
++        LDFLAGS=$save_LDFLAGS
++    fi
++
++    if test "x$libzmq_cv_has_atomic_instrisics" = "xyes"; then
++        AC_MSG_RESULT(yes)
++        $1
++    else
++        AC_MSG_RESULT(no)
++        $2
++    fi
+ }])
+ 
+ dnl ################################################################################
+-- 
+2.17.0
+
-- 
2.17.0
