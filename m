From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Apr 2017 21:25:44 +0200
Subject: [Buildroot] [git commit] package/xen: Use POSIX complaint header
	includes
Message-ID: <20170422122354.5C0B282614@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3530e531e8ea93608305d36ae5710336d163cabc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To fix build issues when using the musl library use POSIX compatible
library inclues.

This fixes this autobuilder issue:
http://autobuild.buildroot.net/results/1aa/1aa1303f60372f51aa5a7eb18caac4a5b5c1d9d4/build-end.log

These two patches have been by accepted upstream Xen and will be in 4.9:
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=b4cd5173183fbc118e2dc2a0d2e0d5038daf4fb5
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4703a9ba9bb0c9c2804813ffe0943177d5f96039

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ls-Use-POSIX-poll.h-instead-of-sys-poll.h.patch | 83 ++++++++++++++++++++++
 ...se-POSIX-signal.h-instead-of-sys-signal.h.patch | 41 +++++++++++
 2 files changed, 124 insertions(+)

diff --git a/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch b/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..01843fb
--- /dev/null
+++ b/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,83 @@
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
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
+Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
+Release-acked-by: Julien Grall <julien.grall@arm.com>
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
index 0000000..40a8c50
--- /dev/null
+++ b/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
@@ -0,0 +1,41 @@
+From 67315f02798cdccb186bd12dc5be94a7aec90852 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 17 Apr 2017 14:15:54 -0700
+Subject: [PATCH] tools: Use POSIX signal.h instead of sys/signal.h
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
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
+Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
+Release-acked-by: Julien Grall <julien.grall@arm.com>
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
