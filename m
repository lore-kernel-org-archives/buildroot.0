From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 29 Jul 2015 19:50:15 +0100
Subject: [Buildroot] [PATCH 1/1] packages/btrfs-progs: fix build issues
	under musl
Message-ID: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b97/b97f1e9cd459da96e3e1680bb7c43d8103ab12c2/

Caused by assumptions around __GLIBC__ and header inclusion.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 ...s-compilation-errors-when-using-musl-libc.patch | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 package/btrfs-progs/0001-btrfs-progs-compilation-errors-when-using-musl-libc.patch

diff --git a/package/btrfs-progs/0001-btrfs-progs-compilation-errors-when-using-musl-libc.patch b/package/btrfs-progs/0001-btrfs-progs-compilation-errors-when-using-musl-libc.patch
new file mode 100644
index 0000000..dde1851
--- /dev/null
+++ b/package/btrfs-progs/0001-btrfs-progs-compilation-errors-when-using-musl-libc.patch
@@ -0,0 +1,91 @@
+From 8905b451014fce570984335f153f3977e94f0115 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Wed, 29 Jul 2015 19:27:26 +0100
+Subject: [PATCH 1/1] btrfs-progs: compilation errors when using musl libc
+
+- limits.h must be included to pick up PATH_MAX.
+- remove double declaration of BTRFS_DISABLE_BACKTRACE
+
+kerncompat.h assumed that if __GLIBC__ was not defined,
+it could safely define BTRFS_DISABLE_BACKTRACE, however this can be
+defined by the configure script. Added a check to ensure it is not
+defined first.
+
+Upstream-status: submitted
+
+See : http://thread.gmane.org/gmane.comp.file-systems.btrfs/46771
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ cmds-inspect.c | 1 +
+ cmds-receive.c | 1 +
+ cmds-scrub.c   | 1 +
+ cmds-send.c    | 1 +
+ kerncompat.h   | 2 ++
+ 5 files changed, 6 insertions(+)
+
+diff --git a/cmds-inspect.c b/cmds-inspect.c
+index 71451fe..9712581 100644
+--- a/cmds-inspect.c
++++ b/cmds-inspect.c
+@@ -20,6 +20,7 @@
+ #include <stdint.h>
+ #include <sys/ioctl.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #include "kerncompat.h"
+ #include "ioctl.h"
+diff --git a/cmds-receive.c b/cmds-receive.c
+index 071bea9..d4b3103 100644
+--- a/cmds-receive.c
++++ b/cmds-receive.c
+@@ -28,6 +28,7 @@
+ #include <wait.h>
+ #include <assert.h>
+ #include <getopt.h>
++#include <limits.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/cmds-scrub.c b/cmds-scrub.c
+index b7aa809..5a85dc4 100644
+--- a/cmds-scrub.c
++++ b/cmds-scrub.c
+@@ -34,6 +34,7 @@
+ #include <ctype.h>
+ #include <signal.h>
+ #include <stdarg.h>
++#include <limits.h>
+ 
+ #include "ctree.h"
+ #include "ioctl.h"
+diff --git a/cmds-send.c b/cmds-send.c
+index 20bba18..a0b7f95 100644
+--- a/cmds-send.c
++++ b/cmds-send.c
+@@ -33,6 +33,7 @@
+ #include <assert.h>
+ #include <getopt.h>
+ #include <uuid/uuid.h>
++#include <limits.h>
+ 
+ #include "ctree.h"
+ #include "ioctl.h"
+diff --git a/kerncompat.h b/kerncompat.h
+index 5d92856..7c627ba 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -33,7 +33,9 @@
+ #include <features.h>
+ 
+ #ifndef __GLIBC__
++#ifndef BTRFS_DISABLE_BACKTRACE
+ #define BTRFS_DISABLE_BACKTRACE
++#endif
+ #define __always_inline __inline __attribute__ ((__always_inline__))
+ #endif
+ 
+-- 
+2.4.3
+
-- 
2.4.3
