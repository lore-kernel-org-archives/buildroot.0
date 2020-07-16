From: Joris Offouga <offougajoris@gmail.com>
Date: Thu, 16 Jul 2020 10:20:41 +0200
Subject: [Buildroot] [PATCH] package/swupdate: Backport fixes
Message-ID: <20200716082042.9335-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Applied same commit [1] of  meta-swupdate for fixes:

[2] Shellscript stops before completing
[3] diskpart: force kernel to reread partition table

[1]: https://github.com/sbabic/meta-swupdate/commit/3fccf23e2816b176075588309e3e4702a318dfc7
[2]: https://github.com/sbabic/swupdate/commit/1078af97a5ac5c3091c8e601b836cd69a7aab7fc
[3]: https://github.com/sbabic/swupdate/commit/e3a6b120ff88f6dc34570002de97754b607966ec

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 ...-Shellscript-stops-before-completing.patch | 51 +++++++++++++++++++
 ...rce-kernel-to-reread-partition-table.patch | 31 +++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 package/swupdate/0001-Shellscript-stops-before-completing.patch
 create mode 100644 package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch

diff --git a/package/swupdate/0001-Shellscript-stops-before-completing.patch b/package/swupdate/0001-Shellscript-stops-before-completing.patch
new file mode 100644
index 0000000000..7a6038afc0
--- /dev/null
+++ b/package/swupdate/0001-Shellscript-stops-before-completing.patch
@@ -0,0 +1,51 @@
+From 1078af97a5ac5c3091c8e601b836cd69a7aab7fc Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Tue, 16 Jun 2020 10:29:55 +0200
+Subject: [PATCH] Shellscript stops before completing
+
+Commit 8fb94d7 reworks the way shell script are called, redirecting
+stdout and stderr to SWUpdate. A shell script runs then in a child
+process. Under some circumstances, SWUpdate closes the forked process
+before the child process completes.
+
+Be sure that the child process has terminated before to go on.
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+Reported-by: Piotr Piwko <piotr.piwko@gmail.com>
+Tested-by: Piotr Piwko <piotr.piwko@gmail.com>
+---
+ core/pctl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/core/pctl.c b/core/pctl.c
+index 8b1c667..01ad540 100644
+--- a/core/pctl.c
++++ b/core/pctl.c
+@@ -263,6 +263,7 @@ int run_system_cmd(const char *cmd)
+ 		}
+ 	} else {
+ 		int fds[2];
++		pid_t w;
+ 
+ 		close(stdoutpipe[PIPE_WRITE]);
+ 		close(stderrpipe[PIPE_WRITE]);
+@@ -276,7 +277,6 @@ int run_system_cmd(const char *cmd)
+ 		 * and from stderr (of the child process) as ERROR
+ 		 */
+ 		do {
+-			pid_t w;
+ 			int n1 = 0;
+ 			struct timeval tv;
+ 			fd_set readfds;
+@@ -373,7 +373,7 @@ int run_system_cmd(const char *cmd)
+ 					}
+ 				}
+ 			} while (ret > 0 && n1 > 0);
+-		} while (!WIFEXITED(wstatus));
++		} while (w != process_id);
+ 
+ 		close(stdoutpipe[PIPE_READ]);
+ 		close(stderrpipe[PIPE_READ]);
+-- 
+2.25.1
+
diff --git a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
new file mode 100644
index 0000000000..275493e1b5
--- /dev/null
+++ b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
@@ -0,0 +1,31 @@
+From e3a6b120ff88f6dc34570002de97754b607966ec Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Tue, 9 Jun 2020 13:58:06 +0000
+Subject: [PATCH] diskpart: force kernel to reread partition table
+
+After writing a partition table to disk, the kernel should be informed
+(like the partconf tool does), else it is not possible to install images
+in the new created partitions.
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+---
+ handlers/diskpart_handler.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/handlers/diskpart_handler.c b/handlers/diskpart_handler.c
+index 16adc17..372412b 100644
+--- a/handlers/diskpart_handler.c
++++ b/handlers/diskpart_handler.c
+@@ -273,7 +273,8 @@ static int diskpart(struct img_type *img,
+ 	/*
+ 	 * Everything done, write into disk
+ 	 */
+-	ret = fdisk_write_disklabel(cxt);
++	ret = fdisk_write_disklabel(cxt) |
++		fdisk_reread_partition_table(cxt);
+ 
+ handler_exit:
+ 	if (fdisk_deassign_device(cxt, 0))
+-- 
+2.25.1
+
-- 
2.25.1
