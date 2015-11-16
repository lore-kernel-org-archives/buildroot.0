From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:02:07 +0100
Subject: [Buildroot] [git commit] package/gauche: fix getcontext build issue
	at link time
Message-ID: <20151116220222.CCB287FC2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91f888cbc4bd2c76dc6896f6ab47da3826139a60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is ported from bdwgc package. Since Gauche uses an internal
copy of the boehm gc code, it is affected by the same problem.

Both configure and configure.ac are modified because autoreconf fails
due to an incompatibility with the version of the autotools used by
Buildroot.

Fixes:

   http://autobuild.buildroot.org/results/8c6/8c6ce526735a36b8c8b4c6047e3c69039c4527cb/
   http://autobuild.buildroot.org/results/894/89460829a737a4dab19103f7a46905636420b0a8/

[Thomas: adjust commit log and patch description.]

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   62 ++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
new file mode 100644
index 0000000..6cc0656
--- /dev/null
+++ b/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
@@ -0,0 +1,62 @@
+gc/configure.ac: add check for NO_GETCONTEXT definition
+
+This patch is ported from bdwgc package. Since Gauche uses an internal
+copy of the boehm gc code, it is affected by the same problem.
+
+Both configure and configure.ac are modified because autoreconf fails
+due to an incompatibility with the version of the autotools used by
+Buildroot.
+
+Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+
+Original credits of patch in bdwgc package:
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[yann.morin.1998 at free.fr: add a comment, change variable name, use
+ AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
+ Thomas)]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -ur a/gc/configure b/gc/configure
+--- a/gc/configure	2015-11-12 21:41:02.394822056 +0900
++++ b/gc/configure	2015-11-12 22:04:14.655157423 +0900
+@@ -16153,6 +16153,23 @@
+ $as_echo "$ac_cv_fno_strict_aliasing" >&6; }
+ fi
+ 
++# Check for getcontext (uClibc can be configured without it, for example)
++for ac_func in getcontext
++do :
++  ac_fn_c_check_func "$LINENO" "getcontext" "ac_cv_func_getcontext"
++if test "x$ac_cv_func_getcontext" = xyes; then :
++  cat >>confdefs.h <<_ACEOF
++#define HAVE_GETCONTEXT 1
++_ACEOF
++
++fi
++done
++
++if test "$ac_cv_func_getcontext" = "no"; then :
++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
++fi
++
+ case "$host" in
+ # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
+ # and unnecessary everywhere.
+diff -ur a/gc/configure.ac b/gc/configure.ac
+--- a/gc/configure.ac	2015-11-12 22:31:44.851510997 +0900
++++ b/gc/configure.ac	2015-11-12 22:33:39.292191227 +0900
+@@ -459,6 +459,12 @@
+   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
+ fi
+ 
++# Check for getcontext (uClibc can be configured without it, for example)
++AC_CHECK_FUNCS([getcontext])
++AS_IF([test "$ac_cv_func_getcontext" = "no"],
++  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
++
+ case "$host" in
+ # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
+ # and unnecessary everywhere.
