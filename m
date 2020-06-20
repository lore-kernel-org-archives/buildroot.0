From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:53:42 +0200
Subject: [Buildroot] [git commit] package/iproute2: fix build with uclibc
Message-ID: <20200620195153.2854082610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=004222f753c8d9d3ac491f5ffe9f129fd95df6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/08024dd20b174f2e22e641d200f6abd8bd2a9552

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-devlink-update-include-files.patch        | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/iproute2/0001-devlink-update-include-files.patch b/package/iproute2/0001-devlink-update-include-files.patch
new file mode 100644
index 0000000000..8cc6e4ec60
--- /dev/null
+++ b/package/iproute2/0001-devlink-update-include-files.patch
@@ -0,0 +1,55 @@
+From 12fafa27c7b306e6c397e858f4d5a8159500f659 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Thu, 11 Jun 2020 09:46:46 -0700
+Subject: devlink: update include files
+
+Use the tool iwyu to get more complete list of includes for
+all the bits used by devlink.
+
+This should also fix build with musl libc.
+
+Fixes: c4dfddccef4e ("fix JSON output of mon command")
+Reported-off-by: Dan Robertson <dan@dlrobertson.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=12fafa27c7b306e6c397e858f4d5a8159500f659]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ devlink/devlink.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/devlink/devlink.c b/devlink/devlink.c
+index 507972c3..ce2e4676 100644
+--- a/devlink/devlink.c
++++ b/devlink/devlink.c
+@@ -19,18 +19,25 @@
+ #include <limits.h>
+ #include <errno.h>
+ #include <inttypes.h>
++#include <signal.h>
++#include <time.h>
++#include <netinet/in.h>
++#include <arpa/inet.h>
+ #include <sys/sysinfo.h>
+ #define _LINUX_SYSINFO_H /* avoid collision with musl header */
+ #include <linux/genetlink.h>
+ #include <linux/devlink.h>
++#include <linux/netlink.h>
+ #include <libmnl/libmnl.h>
+ #include <netinet/ether.h>
++#include <sys/select.h>
++#include <sys/socket.h>
+ #include <sys/types.h>
+ 
+ #include "SNAPSHOT.h"
+ #include "list.h"
+ #include "mnlg.h"
+-#include "json_writer.h"
++#include "json_print.h"
+ #include "utils.h"
+ #include "namespace.h"
+ 
+-- 
+cgit 1.2.3-1.el7
+
