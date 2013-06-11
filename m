From: =?iso-8859-1?Q?Ra=FAl_S=E1nchez?= Siles <rasasi78@gmail.com>
Date: Tue, 11 Jun 2013 18:24:12 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: Add upstream patch to avoid
 occasional mdev SIGSEGV.
Message-ID: <20130611162412.GE18264@trismegisto.universo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This implies rename of previous patch for a correct patch ordering.

Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
---
 ...21.0-mdev.patch => busybox-1.21.0-mdev_1.patch} |    0
 .../busybox-1.21.0-mdev_2_check_ACTION.patch       |   32 ++++++++++++++++++++
 2 files changed, 32 insertions(+)
 rename package/busybox/1.21.0/{busybox-1.21.0-mdev.patch => busybox-1.21.0-mdev_1.patch} (100%)
 create mode 100644 package/busybox/1.21.0/busybox-1.21.0-mdev_2_check_ACTION.patch

diff --git a/package/busybox/1.21.0/busybox-1.21.0-mdev.patch b/package/busybox/1.21.0/busybox-1.21.0-mdev_1.patch
similarity index 100%
rename from package/busybox/1.21.0/busybox-1.21.0-mdev.patch
rename to package/busybox/1.21.0/busybox-1.21.0-mdev_1.patch
diff --git a/package/busybox/1.21.0/busybox-1.21.0-mdev_2_check_ACTION.patch b/package/busybox/1.21.0/busybox-1.21.0-mdev_2_check_ACTION.patch
new file mode 100644
index 0000000..f731cc0
--- /dev/null
+++ b/package/busybox/1.21.0/busybox-1.21.0-mdev_2_check_ACTION.patch
@@ -0,0 +1,32 @@
+From d35cbad0efaa57bf7c5280e62825966f7757906a Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 02 Apr 2013 12:37:06 +0000
+Subject: mdev: call index_in_strings on $ACTION only after we checked it for NULL
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+diff --git a/util-linux/mdev.c b/util-linux/mdev.c
+index 5fe6bbb..1d74136 100644
+--- a/util-linux/mdev.c
++++ b/util-linux/mdev.c
+@@ -1060,15 +1060,15 @@ int mdev_main(int argc UNUSED_PARAM, char **argv)
+ 		 * ACTION can be "add", "remove", "change"
+ 		 * DEVPATH is like "/block/sda" or "/class/input/mice"
+ 		 */
+-		action = getenv("ACTION");
+-		op = index_in_strings(keywords, action);
+ 		env_devname = getenv("DEVNAME"); /* can be NULL */
+-		env_devpath = getenv("DEVPATH");
+ 		G.subsystem = getenv("SUBSYSTEM");
++		action = getenv("ACTION");
++		env_devpath = getenv("DEVPATH");
+ 		if (!action || !env_devpath /*|| !G.subsystem*/)
+ 			bb_show_usage();
+ 		fw = getenv("FIRMWARE");
+ 		seq = getenv("SEQNUM");
++		op = index_in_strings(keywords, action);
+ 
+ 		my_pid = getpid();
+ 		open_mdev_log(seq, my_pid);
+--
+cgit v0.9.1
-- 
1.7.10.4
