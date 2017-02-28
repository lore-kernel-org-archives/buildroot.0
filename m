From: Michael Walle <michael@walle.cc>
Date: Tue, 28 Feb 2017 06:41:22 +0100
Subject: [Buildroot] [PATCH for-rc] openocd: fix build on older hosts
Message-ID: <1488260482-30511-1-git-send-email-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenOCD fails to generate the documentation because older host systems may
have an old texinfo.

This patch is taken from upstream commit 79fdeb37f486f74658f1 which is
included in version 0.10.0. Therefore, it can be dropped when the version
is bumped.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Please include this patch in the 2017.02 release. Without the patch,
openocd won't build on older build hosts. There is no functional change.

 ...-it-compatible-with-ancient-texinfo-versi.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/openocd/0003-manual-make-it-compatible-with-ancient-texinfo-versi.patch

diff --git a/package/openocd/0003-manual-make-it-compatible-with-ancient-texinfo-versi.patch b/package/openocd/0003-manual-make-it-compatible-with-ancient-texinfo-versi.patch
new file mode 100644
index 0000000..01eddd2
--- /dev/null
+++ b/package/openocd/0003-manual-make-it-compatible-with-ancient-texinfo-versi.patch
@@ -0,0 +1,47 @@
+From 79fdeb37f486f74658f1eaf658abac8efb3eba6a Mon Sep 17 00:00:00 2001
+From: Paul Fertser <fercerpav@gmail.com>
+Date: Mon, 25 May 2015 11:59:25 +0300
+Subject: [PATCH] manual: make it compatible with ancient texinfo versions that
+ lack @raggedright
+
+This is needed to unbreak build on systems that ship texinfo version
+4.x.
+
+Change-Id: Ie665d29b02bb65da7e8ed0d48d17fa56e231bd0d
+Signed-off-by: Paul Fertser <fercerpav@gmail.com>
+Reviewed-on: http://openocd.zylin.com/2781
+Tested-by: jenkins
+Reviewed-by: David Ung <davidu@nvidia.com>
+Reviewed-by: Spencer Oliver <spen@spen-soft.co.uk>
+Reviewed-by: Oleksij Rempel
+---
+ doc/openocd.texi | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/doc/openocd.texi b/doc/openocd.texi
+index 511bc6c..0208fcf 100644
+--- a/doc/openocd.texi
++++ b/doc/openocd.texi
+@@ -8460,11 +8460,17 @@ Cyg_Thread::thread_list, Cyg_Scheduler_Base::current_thread.
+ @item ThreadX symbols
+ _tx_thread_current_ptr, _tx_thread_created_ptr, _tx_thread_created_count.
+ @item FreeRTOS symbols
+- at raggedright
++ at c The following is taken from recent texinfo to provide compatibility
++ at c with ancient versions that do not support @raggedright
++ at tex
++\begingroup
++\rightskip0pt plus2em \spaceskip.3333em \xspaceskip.5em\relax
+ pxCurrentTCB, pxReadyTasksLists, xDelayedTaskList1, xDelayedTaskList2,
+ pxDelayedTaskList, pxOverflowDelayedTaskList, xPendingReadyList,
+ uxCurrentNumberOfTasks, uxTopUsedPriority.
+- at end raggedright
++\par
++\endgroup
++ at end tex
+ @item linux symbols
+ init_task.
+ @item ChibiOS symbols
+-- 
+2.1.4
+
-- 
2.1.4
