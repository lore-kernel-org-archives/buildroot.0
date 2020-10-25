From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:03:24 +0100
Subject: [Buildroot] [git commit] package/rtl8821au: fix patch/compile for
 kernel < 5.6.x
Message-ID: <20201025091009.9D923832E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19f0800367554cac0e869689ca50f551266634b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing semicolon for linux kernel verson < 5.6.x compile introduced
by patch 0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch.

Fixes:

  os_dep/linux/rtw_proc.c:195:1: error: expected ???,??? or ???;??? before ???int???
  195 | int rtw_drv_proc_init(void)
      | ^~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...proc-convert-file_operations-to-proc_ops-for-5.6.patch | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch b/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
index 607d00d604..30595ec695 100644
--- a/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
+++ b/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
@@ -1,16 +1,18 @@
-From d3bd26812728c9ac2249ea29bda674dd31034ac6 Mon Sep 17 00:00:00 2001
+From e0ed05200e6e4b86e26e092dc1f16fc8fc1e2b67 Mon Sep 17 00:00:00 2001
 From: Christian Stewart <christian@paral.in>
 Date: Tue, 8 Sep 2020 23:08:39 -0700
 Subject: [PATCH] rtw_proc: convert file_operations to proc_ops for 5.6.x
  compat
 
 Signed-off-by: Christian Stewart <christian@paral.in>
+[Fix < 5.6.x compile - missing semicolon]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  os_dep/linux/rtw_proc.c | 40 ++++++++++++++++++++++++++++++++++++++--
  1 file changed, 38 insertions(+), 2 deletions(-)
 
 diff --git a/os_dep/linux/rtw_proc.c b/os_dep/linux/rtw_proc.c
-index 048080a..d944649 100644
+index 048080a..6295f66 100644
 --- a/os_dep/linux/rtw_proc.c
 +++ b/os_dep/linux/rtw_proc.c
 @@ -65,9 +65,15 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
@@ -39,11 +41,10 @@ index 048080a..d944649 100644
  static const struct file_operations rtw_drv_proc_fops = {
  	.owner = THIS_MODULE,
  	.open = rtw_drv_proc_open,
-@@ -174,7 +181,16 @@ static const struct file_operations rtw_drv_proc_fops = {
- 	.llseek = seq_lseek,
+@@ -175,6 +182,15 @@ static const struct file_operations rtw_drv_proc_fops = {
  	.release = single_release,
  	.write = rtw_drv_proc_write,
-+}
+ };
 +#else
 +static const struct proc_ops rtw_drv_proc_fops = {
 +	.proc_open = rtw_drv_proc_open,
@@ -51,7 +52,7 @@ index 048080a..d944649 100644
 +	.proc_lseek = seq_lseek,
 +	.proc_release = seq_release,
 +	.proc_write = rtw_drv_proc_write,
- };
++};
 +#endif
  
  int rtw_drv_proc_init(void)
@@ -105,5 +106,5 @@ index 048080a..d944649 100644
  struct proc_dir_entry *rtw_odm_proc_init(struct net_device *dev)
  {
 -- 
-2.28.0
+2.29.0
 
