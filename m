From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 17 Apr 2017 16:14:57 -0700
Subject: [Buildroot] [PATCH] package/xen: Use POSIX complaint header includes
Message-ID: <20170417231457.2691-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fix build issues when using the musl library use POSIX compatible
library inclues.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...ls-Use-POSIX-poll.h-instead-of-sys-poll.h.patch | 79 ++++++++++++++++++++++
 ...se-POSIX-signal.h-instead-of-sys-signal.h.patch | 37 ++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch

diff --git a/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch b/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 000000000..019c9b96e
--- /dev/null
+++ b/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,79 @@
+From e407387926de4c75abd17bd1396caa95d35a4bea Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 17 Apr 2017 13:04:11 -0700
+Subject: [PATCH] tools: Use POSIX poll.h instead of sys/poll.h
+
+The POSIX spec specifies to use:
+    #include <poll.h>
+instead of:
+    #include <sys/poll.h>
+as seen here:
+    http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
+
+This removes the warning:
+    #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+when building with the musl C-library.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/libxl/libxl_internal.h               | 2 +-
+ tools/tests/xen-access/xen-access.c        | 2 +-
+ tools/xenstat/libxenstat/src/xenstat_qmp.c | 2 +-
+ tools/xentrace/xentrace.c                  | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
+index be24b76dfa..5d082c5704 100644
+--- a/tools/libxl/libxl_internal.h
++++ b/tools/libxl/libxl_internal.h
+@@ -38,7 +38,7 @@
+ #include <ctype.h>
+ 
+ #include <sys/mman.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/select.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+diff --git a/tools/tests/xen-access/xen-access.c b/tools/tests/xen-access/xen-access.c
+index ff4d289b45..238011e010 100644
+--- a/tools/tests/xen-access/xen-access.c
++++ b/tools/tests/xen-access/xen-access.c
+@@ -36,7 +36,7 @@
+ #include <signal.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include <xenctrl.h>
+ #include <xenevtchn.h>
+diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/libxenstat/src/xenstat_qmp.c
+index a87c9373c2..3fda487d49 100644
+--- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
++++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
+@@ -14,7 +14,7 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
+index f09fe6cf19..364a6fdad5 100644
+--- a/tools/xentrace/xentrace.c
++++ b/tools/xentrace/xentrace.c
+@@ -24,7 +24,7 @@
+ #include <getopt.h>
+ #include <assert.h>
+ #include <ctype.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/statvfs.h>
+ 
+ #include <xen/xen.h>
+-- 
+2.11.0
+
diff --git a/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch b/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
new file mode 100644
index 000000000..841feeb05
--- /dev/null
+++ b/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
@@ -0,0 +1,37 @@
+From 67315f02798cdccb186bd12dc5be94a7aec90852 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 17 Apr 2017 14:15:54 -0700
+Subject: [PATCH 2/2] tools: Use POSIX signal.h instead of sys/signal.h
+
+The POSIX spec specifies to use:
+    #include <signal.h>
+instead of:
+    #include <sys/signal.h>
+as seen here:
+   http://pubs.opengroup.org/onlinepubs/009695399/functions/signal.html
+
+This removes the warning:
+    #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
+when building with the musl C-library.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/drivers/tapdisk-server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/blktap2/drivers/tapdisk-server.c b/tools/blktap2/drivers/tapdisk-server.c
+index eecde3d23f..71315bb069 100644
+--- a/tools/blktap2/drivers/tapdisk-server.c
++++ b/tools/blktap2/drivers/tapdisk-server.c
+@@ -30,7 +30,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <sys/ioctl.h>
+-#include <sys/signal.h>
++#include <signal.h>
+ 
+ #include "tapdisk-utils.h"
+ #include "tapdisk-server.h"
+-- 
+2.11.0
+
-- 
2.11.0
