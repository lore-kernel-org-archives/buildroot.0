From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:02:43 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/irqbalance: fix
 irqbalance/irqbalance-ui socket communication
Message-ID: <20210227182007.84FD18396F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e6dc0609e0c224cf59c4ff986c56ed28cae3b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Add patch to fix irqbalance/irqbalance-ui socket communication by
fixing uint64_t printf format usage.

Fixes:

  $ irqbalance-ui
  Invalid data sent.  Unexpected token: (null)TYPE

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - do an actual backport as upstream applied the patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f204e5874082f01170c26f4e6cddca20ad517dbd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-fix-uint64_t-printf-format-use-PRIu64.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch b/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch
new file mode 100644
index 0000000000..95a9616c71
--- /dev/null
+++ b/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch
@@ -0,0 +1,105 @@
+From 0cdc7a22d5156440fecff14c438d4e24261ac793 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 20 Feb 2021 23:38:56 +0100
+Subject: [PATCH] fix uint64_t printf format (use PRIu64)
+
+Fixes (on arm 32-bit):
+
+  $ irqbalance-ui
+  Invalid data sent.  Unexpected token: (null)TYPE
+
+And strace showed the following:
+
+  237   sendmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="stats", iov_len=5}], msg_iovlen=1, msg_control=[{cmsg_len=24, cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, cmsg_data={pid=237, uid=0, gid=0}}], msg_controllen=24, msg_flags=0}, 0) = 5
+  237   recv(3, "TYPE 3 NUMBER -1 LOAD 0 SAVE_MODE 0 (null)TYPE 2 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 3 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 1 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 1 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 2 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 2 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 3 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)", 8192, 0) = 411
+
+[backported from upstream]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ cputree.c    | 3 ++-
+ irqbalance.c | 5 +++--
+ ui/ui.c      | 5 +++--
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/cputree.c b/cputree.c
+index fda0200..a8dba73 100644
+--- a/cputree.c
++++ b/cputree.c
+@@ -33,6 +33,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <dirent.h>
++#include <inttypes.h>
+ 
+ #include <glib.h>
+ 
+@@ -417,7 +418,7 @@ static void dump_irq(struct irq_info *info, void *data)
+ 		indent[i] = log_indent[0];
+ 
+ 	indent[i] = '\0';
+-	log(TO_CONSOLE, LOG_INFO, "%sInterrupt %i node_num is %d (%s/%lu:%lu) \n", indent,
++	log(TO_CONSOLE, LOG_INFO, "%sInterrupt %i node_num is %d (%s/%" PRIu64 ":%" PRIu64 ") \n", indent,
+ 	    info->irq, irq_numa_node(info)->number, classes[info->class], info->load, (info->irq_count - info->last_irq_count));
+ 	free(indent);
+ }
+diff --git a/irqbalance.c b/irqbalance.c
+index 9baa955..458bb07 100644
+--- a/irqbalance.c
++++ b/irqbalance.c
+@@ -34,6 +34,7 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <fcntl.h>
++#include <inttypes.h>
+ #ifdef HAVE_GETOPT_LONG 
+ #include <getopt.h>
+ #endif
+@@ -357,7 +358,7 @@ void get_irq_data(struct irq_info *irq, void *data)
+ 	*irqdata = newptr;
+ 
+ 	sprintf(*irqdata + strlen(*irqdata),
+-			"IRQ %d LOAD %lu DIFF %lu CLASS %d ", irq->irq, irq->load,
++			"IRQ %d LOAD %" PRIu64 " DIFF %" PRIu64 " CLASS %d ", irq->irq, irq->load,
+ 			(irq->irq_count - irq->last_irq_count), irq->class);
+ }
+ 
+@@ -395,7 +396,7 @@ void get_object_stat(struct topo_obj *object, void *data)
+ 
+ 	*stats = newptr;
+ 
+-	sprintf(*stats + strlen(*stats), "TYPE %d NUMBER %d LOAD %lu SAVE_MODE %d %s",
++	sprintf(*stats + strlen(*stats), "TYPE %d NUMBER %d LOAD %" PRIu64 " SAVE_MODE %d %s",
+ 			object->obj_type, object->number, object->load,
+ 			object->powersave_mode, irq_data ? irq_data : "");
+ 	free(irq_data);
+diff --git a/ui/ui.c b/ui/ui.c
+index 06ec472..4cf68bf 100644
+--- a/ui/ui.c
++++ b/ui/ui.c
+@@ -1,4 +1,5 @@
+ 
++#include <inttypes.h>
+ #include <string.h>
+ #include "ui.h"
+ 
+@@ -563,7 +564,7 @@ void settings()
+ 
+ 	char info[128] = "Current sleep interval between rebalancing: \0";
+ 	uint8_t sleep_input_offset = strlen(info) + 3;
+-	snprintf(info + strlen(info), 128 - strlen(info), "%lu\n", setup.sleep);
++	snprintf(info + strlen(info), 128 - strlen(info), "%" PRIu64 "\n", setup.sleep);
+ 	attrset(COLOR_PAIR(1));
+ 	mvprintw(2, 3, info);
+ 	print_all_cpus();
+@@ -588,7 +589,7 @@ void settings()
+ 			if(new_sleep != setup.sleep) {
+ 				setup.sleep = new_sleep;
+ 				char settings_data[128];
+-				snprintf(settings_data, 128, "%s %lu", SET_SLEEP, new_sleep);
++				snprintf(settings_data, 128, "%s %" PRIu64, SET_SLEEP, new_sleep);
+ 				send_settings(settings_data);
+ 			}
+ 			break;
+-- 
+2.25.1
+
