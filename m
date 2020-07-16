From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:20:07 +0200
Subject: [Buildroot] [git commit] package/swupdate: backport fixes
Message-ID: <20200716201655.1824A87168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=091daf545526573dd112ab0a4f900b4cecbe72c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings to the swupdate package two fixes [2][3] that have also
been backported in the meta-swupdate Yocto layer, see [1].

[1]: https://github.com/sbabic/meta-swupdate/commit/3fccf23e2816b176075588309e3e4702a318dfc7
[2]: https://github.com/sbabic/swupdate/commit/1078af97a5ac5c3091c8e601b836cd69a7aab7fc
[3]: https://github.com/sbabic/swupdate/commit/e3a6b120ff88f6dc34570002de97754b607966ec

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rt-force-kernel-to-reread-partition-table.patch | 32 +++++++++++++
 .../0002-Shellscript-stops-before-completing.patch | 52 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
new file mode 100644
index 0000000000..5964d1b96f
--- /dev/null
+++ b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
@@ -0,0 +1,32 @@
+From 305a7a5a74a612801d9df2b2efc86dd952b8c4e7 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Tue, 9 Jun 2020 13:58:06 +0000
+Subject: [PATCH] diskpart: force kernel to reread partition table
+
+After writing a partition table to disk, the kernel should be informed
+(like the partconf tool does), else it is not possible to install images
+in the new created partitions.
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+Signed-off-by: Joris Offouga <offougajoris@gmail.com>
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
diff --git a/package/swupdate/0002-Shellscript-stops-before-completing.patch b/package/swupdate/0002-Shellscript-stops-before-completing.patch
new file mode 100644
index 0000000000..d91438893b
--- /dev/null
+++ b/package/swupdate/0002-Shellscript-stops-before-completing.patch
@@ -0,0 +1,52 @@
+From bd08e45d7b25f06da2fc6dc824146b471db5f1f4 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Joris Offouga <offougajoris@gmail.com>
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
