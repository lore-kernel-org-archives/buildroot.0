From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:05:35 +0100
Subject: [Buildroot] [git commit] util-linux: link scriptreplay with libm
	(for isnan)
Message-ID: <20170209211251.AA80780127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a9737895cbca0d9ee6329052422bbeceb4feae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Cherry-pick a patch from upstream to link scriptreplay to libm (for
  "isnam").
- Add a patch that improves the detection of isnan when using uClibc.
  This patch is for util-linux v2.29.1 and must be adapted to their
  master branch to be submitted upstream.

Fixes:
  http://autobuild.buildroot.net/results/2c2/2c29a78ed81ca844a87dcd076ab3e14ea080296d
  http://autobuild.buildroot.net/results/404/404b10f359b2ae8a7216729fa1bab37fed2d3d4c

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-sys-use-lm-for-scriptreplay-if-necessary.patch | 30 ++++++++++++++++++
 ...mprove-detection-of-the-isnan-function-in.patch | 37 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch b/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
new file mode 100644
index 0000000..cbf1a81
--- /dev/null
+++ b/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
@@ -0,0 +1,30 @@
+From 02283be90292b2f57183aa930c4d69375f1d905d Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 18 Jan 2017 13:17:21 +0100
+Subject: [PATCH] build-sys: use -lm for scriptreplay if necessary
+
+Reported-by: Bert van Hall <bert.vanhall@avionic-design.de>
+Addresses: https://github.com/karelzak/util-linux/pull/397
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit feda4342df1ced25df3d200ed23469e740196c86)
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ term-utils/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/Makemodule.am b/term-utils/Makemodule.am
+index 1b7c5fc..ad1bb1f 100644
+--- a/term-utils/Makemodule.am
++++ b/term-utils/Makemodule.am
+@@ -21,7 +21,7 @@ if BUILD_SCRIPTREPLAY
+ usrbin_exec_PROGRAMS += scriptreplay
+ dist_man_MANS += term-utils/scriptreplay.1
+ scriptreplay_SOURCES = term-utils/scriptreplay.c
+-scriptreplay_LDADD = $(LDADD) libcommon.la
++scriptreplay_LDADD = $(LDADD) libcommon.la $(MATH_LIBS)
+ endif # BUILD_SCRIPTREPLAY
+ 
+ 
+-- 
+2.7.4
+
diff --git a/package/util-linux/0002-build-sys-improve-detection-of-the-isnan-function-in.patch b/package/util-linux/0002-build-sys-improve-detection-of-the-isnan-function-in.patch
new file mode 100644
index 0000000..5395104
--- /dev/null
+++ b/package/util-linux/0002-build-sys-improve-detection-of-the-isnan-function-in.patch
@@ -0,0 +1,37 @@
+From 064a0445f33a67e5498d492dabe0dfc687859756 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Wed, 8 Feb 2017 09:29:30 -0200
+Subject: [PATCH] build-sys: improve detection of the "isnan" function in
+ uClibc
+
+Since commit beceb14b450ded6560ed743634a5e80604a8edf3, MATH_LIBS is set
+to "-lm" when the isnan function is detected. In uClibc, however, isnan
+is a macro that calls __isnan, __isnanf, or __isnanl, depending on the
+size of the argument (double, float or long double).
+
+Fixes:
+  http://autobuild.buildroot.net/results/2c2/2c29a78ed81ca844a87dcd076ab3e14ea080296d/
+  http://autobuild.buildroot.net/results/404/404b10f359b2ae8a7216729fa1bab37fed2d3d4c/
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cc0563b..d03469c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -428,7 +428,8 @@ AC_CHECK_FUNCS([reboot], [have_reboot=yes],[have_reboot=no])
+ AM_CONDITIONAL([HAVE_OPENAT], [test "x$have_openat" = xyes])
+ 
+ AC_CHECK_FUNCS([isnan], [],
+-       [AC_CHECK_LIB([m], [isnan], [MATH_LIBS="-lm"])]
++	[AC_CHECK_LIB([m], [isnan], [MATH_LIBS="-lm"])]
++	[AC_CHECK_LIB([m], [__isnan], [MATH_LIBS="-lm"])]
+ )
+ AC_SUBST([MATH_LIBS])
+ 
+-- 
+2.7.4
+
