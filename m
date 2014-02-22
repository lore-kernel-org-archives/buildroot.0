From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:48:11 +0100
Subject: [Buildroot] [git commit] pixman: add patch to fix Microblaze build
	failure
Message-ID: <20140222230556.71B8F9B2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9baea4345625f6f00fc59395faec83e08346015
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Microblaze build of pixman was failing due to FE_DIVBYZERO not
being implemented. It turns out that the usage of it, like fenv.h and
feenableexcept() is optional. So the patch simply adds a configure
check and disables the appropriate code (which is only use in the
tests anyway).

This commit also renames the existing patch to follow the patch naming
convention, and get a reliable ordering when applying patches.

Fixes:

  http://autobuild.buildroot.org/results/806/8064092cdbac85fbf4322429d29d5d11dc51860f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...flags.patch => pixman-01-loongson-cflags.patch} |    0
 package/pixman/pixman-02-check-fe-divbyzero.patch  |   41 ++++++++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/pixman/pixman-loongson-cflags.patch b/package/pixman/pixman-01-loongson-cflags.patch
similarity index 100%
rename from package/pixman/pixman-loongson-cflags.patch
rename to package/pixman/pixman-01-loongson-cflags.patch
diff --git a/package/pixman/pixman-02-check-fe-divbyzero.patch b/package/pixman/pixman-02-check-fe-divbyzero.patch
new file mode 100644
index 0000000..44dd691
--- /dev/null
+++ b/package/pixman/pixman-02-check-fe-divbyzero.patch
@@ -0,0 +1,41 @@
+Add a check for FE_DIVBYZERO
+
+Some architectures (namely Microblaze) do have fenv.h and
+feenableexcept, but they don't have the FE_DIVBYZERO definition. This
+patch adds a configure check for FE_DIVBYZERO, and only uses it if
+it's available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -838,6 +838,11 @@
+    AC_DEFINE(HAVE_FEENABLEEXCEPT, 1, [Whether we have feenableexcept()])
+ fi
+ 
++AC_CHECK_DECL([FE_DIVBYZERO], [], [], [[#include <fenv.h>]])
++if test x$have_fe_divbyzero = xyes; then
++   AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])
++fi
++
+ AC_CHECK_FUNC(gettimeofday, have_gettimeofday=yes, have_gettimeofday=no)
+ AC_CHECK_HEADER(sys/time.h, have_sys_time_h=yes, have_sys_time_h=no)
+ if test x$have_gettimeofday = xyes && test x$have_sys_time_h = xyes; then
+Index: b/test/utils.c
+===================================================================
+--- a/test/utils.c
++++ b/test/utils.c
+@@ -776,9 +776,11 @@
+ {
+ #ifdef HAVE_FENV_H
+ #ifdef HAVE_FEENABLEEXCEPT
++#ifdef HAVE_FE_DIVBYZERO
+     feenableexcept (FE_DIVBYZERO);
+ #endif
+ #endif
++#endif
+ }
+ 
+ void *
