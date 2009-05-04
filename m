From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon,  4 May 2009 16:21:16 +0200
Subject: [Buildroot] [PATCH 1/3] busybox: 1.14.0 mdev / des fixes
Message-ID: <1241446878-32056-1-git-send-email-jacmet@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.0-des.patch  |   14 ++++++++++++++
 package/busybox/busybox-1.14.0-mdev.patch |   24 ++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.0-des.patch
 create mode 100644 package/busybox/busybox-1.14.0-mdev.patch

diff --git a/package/busybox/busybox-1.14.0-des.patch b/package/busybox/busybox-1.14.0-des.patch
new file mode 100644
index 0000000..efb1d7c
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-des.patch
@@ -0,0 +1,14 @@
+--- busybox-1.14.0/libbb/pw_encrypt_des.c	Tue Apr 14 01:43:00 2009
++++ busybox-1.14.0-des/libbb/pw_encrypt_des.c	Fri May  1 03:40:16 2009
+@@ -778,8 +778,10 @@
+ 	to64_msb_first(output + 2, (r0 >> 8));
+ 	/* bits 7..0 of r0 and 31..16 of r1 */
+ 	to64_msb_first(output + 6, (r0 << 16) | (r1 >> 16));
+-	/* (bits 15..0 of r1 + 00) and NUL byte */
++	/* bits 15..0 of r1 and two zero bits (plus extra zero byte) */
+ 	to64_msb_first(output + 10, (r1 << 8));
++	/* extra zero byte is encoded as '.', fixing it */
++	output[13] = '\0';
+ #endif
+ 
+ 	return output;
diff --git a/package/busybox/busybox-1.14.0-mdev.patch b/package/busybox/busybox-1.14.0-mdev.patch
new file mode 100644
index 0000000..4cefd0d
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-mdev.patch
@@ -0,0 +1,24 @@
+--- busybox-1.14.0/util-linux/mdev.c	Tue Apr 14 23:23:04 2009
++++ busybox-1.14.0-mdev/util-linux/mdev.c	Sat May  2 16:31:34 2009
+@@ -181,7 +181,8 @@
+ 		 * the rest of fields unless keep_matching == 1 */
+ 
+ 		/* 2nd field: uid:gid - device ownership */
+-		parse_chown_usergroup_or_die(&ugid, tokens[1]);
++		if (get_uidgid(&ugid, tokens[1], 1) == 0)
++			bb_error_msg("unknown user/group %s", tokens[1]);
+ 
+ 		/* 3rd field: mode - device permissions */
+ 		mode = strtoul(tokens[2], NULL, 8);
+@@ -524,7 +525,10 @@
+ 				make_device(temp, 1);
+ 		}
+ 		else if (strcmp(action, "add") == 0) {
+-			make_device(temp, 0);
++			/* N.B. make_device() mangles the device path, so save it */
++			char *s = xstrdup(temp);
++			make_device(s, 0);
++			free(s);
+ 			if (ENABLE_FEATURE_MDEV_LOAD_FIRMWARE) {
+ 				if (fw)
+ 					load_firmware(fw, temp);
-- 
1.6.2
