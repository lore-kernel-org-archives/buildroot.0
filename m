From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 20 Mar 2015 00:00:01 +0100
Subject: [Buildroot] [PATCH v1] libevdev: fix program_invocation_short_name
	undeclared
Message-ID: <1426806001-28174-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:
touchpad-edge-detector.c:46:42: error: 'program_invocation_short_name undeclared' (first use in this function)
  printf("Usage: %s /dev/input/event0\n", program_invocation_short_name);

libevdev-tweak-device.c:53:9: error: 'program_invocation_short_name undeclared' (first use in this function)
         program_invocation_short_name, program_invocation_short_name);

mouse-dpi-tool.c:52:42: error: 'program_invocation_short_name undeclared' (first use in this function)
  printf("Usage: %s /dev/input/event0\n", program_invocation_short_name);

[1] http://autobuild.buildroot.net/results/39b/39b22d299441c8858a409120c5a20f288b0aa2ce

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-program_invocation_short_name-undeclared.patch | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/libevdev/0002-fix-program_invocation_short_name-undeclared.patch

diff --git a/package/libevdev/0002-fix-program_invocation_short_name-undeclared.patch b/package/libevdev/0002-fix-program_invocation_short_name-undeclared.patch
new file mode 100644
index 0000000..8449ccf
--- /dev/null
+++ b/package/libevdev/0002-fix-program_invocation_short_name-undeclared.patch
@@ -0,0 +1,83 @@
+From d9a135d9fbc63cb8955cb3efb523baf41e0a6fa5 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 19 Mar 2015 23:50:59 +0100
+Subject: [PATCH] fix program_invocation_short_name undeclared
+
+Add fallback in case program_invocation_short_name is undeclared,
+e.g. in case of some uclibc configurations.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac                   | 8 ++++++++
+ tools/libevdev-tweak-device.c  | 4 ++++
+ tools/mouse-dpi-tool.c         | 4 ++++
+ tools/touchpad-edge-detector.c | 4 ++++
+ 4 files changed, 20 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 59c691b..e8abcc1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -144,6 +144,14 @@ fi
+ 
+ AM_CONDITIONAL(ENABLE_STATIC_SYMBOL_LEAKS_TEST, [test "x$static_symbol_leaks_test" = "xyes"])
+ 
++AC_MSG_CHECKING([for program_invocation_short_name])
++AC_TRY_COMPILE([#define _GNU_SOURCE
++		#include <errno.h>],
++	[strlen(program_invocation_short_name)],
++	AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
++		[Defined if program_invocation_short_name is defined])
++	AC_MSG_RESULT(yes), AC_MSG_RESULT(no))
++
+ AC_CONFIG_FILES([Makefile
+ 		 libevdev/Makefile
+ 		 doc/Makefile
+diff --git a/tools/libevdev-tweak-device.c b/tools/libevdev-tweak-device.c
+index f2031c2..3dacb4e 100644
+--- a/tools/libevdev-tweak-device.c
++++ b/tools/libevdev-tweak-device.c
+@@ -36,6 +36,10 @@
+ 
+ #include "libevdev.h"
+ 
++#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
++static char *program_invocation_short_name = "libevdev-tweak-device";
++#endif
++
+ static unsigned int changes; /* bitmask of changes */
+ static struct input_absinfo absinfo;
+ static int axis;
+diff --git a/tools/mouse-dpi-tool.c b/tools/mouse-dpi-tool.c
+index be30a4d..4e396b2 100644
+--- a/tools/mouse-dpi-tool.c
++++ b/tools/mouse-dpi-tool.c
+@@ -41,6 +41,10 @@
+ #define min(a, b) (((a) < (b)) ? (a) : (b))
+ #define max(a, b) (((a) > (b)) ? (a) : (b))
+ 
++#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
++static char *program_invocation_short_name = "mouse-dpi-tool";
++#endif
++
+ struct measurements {
+ 	int distance;
+ 	double frequency;
+diff --git a/tools/touchpad-edge-detector.c b/tools/touchpad-edge-detector.c
+index e5420cf..12e1127 100644
+--- a/tools/touchpad-edge-detector.c
++++ b/tools/touchpad-edge-detector.c
+@@ -41,6 +41,10 @@
+ #define min(a, b) (((a) < (b)) ? (a) : (b))
+ #define max(a, b) (((a) > (b)) ? (a) : (b))
+ 
++#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
++static char *program_invocation_short_name = "touchpad-edge-detector";
++#endif
++
+ static int
+ usage(void) {
+ 	printf("Usage: %s /dev/input/event0\n", program_invocation_short_name);
+-- 
+2.1.4
+
-- 
2.1.4
