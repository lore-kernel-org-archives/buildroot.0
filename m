From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Sun, 24 Feb 2019 23:49:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: fix build with new headers
Message-ID: <20190224204931.2759-1-panfilov.artyom@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

net_tstamp.h in recent kernel versions requires time.h for clockid_t.

Fixes:
  http://autobuild.buildroot.net/results/93903e8abfeaa7df0b6525033fa63e29f2c9e7ae
Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 ...fix-building-with-new-kernel-headers.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/linuxptp/0002-fix-building-with-new-kernel-headers.patch

diff --git a/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch b/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
new file mode 100644
index 0000000000..332e5491ff
--- /dev/null
+++ b/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
@@ -0,0 +1,55 @@
+From d663a483c40939bad58301c256d86da1f3da6cc0 Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Tue, 13 Nov 2018 13:16:08 +0100
+Subject: [PATCH] Fix building with new kernel headers.
+
+net_tstamp.h in recent kernel versions requires time.h for clockid_t.
+
+Signed-off-by: Miroslav Lichvar <mlichvar@redhat.com>
+---
+ clock.c      | 2 +-
+ sk.c         | 1 +
+ timemaster.c | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/clock.c b/clock.c
+index 9c493c3..8533b39 100644
+--- a/clock.c
++++ b/clock.c
+@@ -17,11 +17,11 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ #include <errno.h>
++#include <time.h>
+ #include <linux/net_tstamp.h>
+ #include <poll.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <time.h>
+ #include <sys/queue.h>
+ 
+ #include "address.h"
+diff --git a/sk.c b/sk.c
+index e2b1f28..30162eb 100644
+--- a/sk.c
++++ b/sk.c
+@@ -18,6 +18,7 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ #include <errno.h>
++#include <time.h>
+ #include <linux/net_tstamp.h>
+ #include <linux/sockios.h>
+ #include <linux/ethtool.h>
+diff --git a/timemaster.c b/timemaster.c
+index 058678f..00db59f 100644
+--- a/timemaster.c
++++ b/timemaster.c
+@@ -22,6 +22,7 @@
+ #include <errno.h>
+ #include <libgen.h>
+ #include <limits.h>
++#include <time.h>
+ #include <linux/net_tstamp.h>
+ #include <net/if.h>
+ #include <signal.h>
-- 
2.19.1
