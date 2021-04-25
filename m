From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 08:52:47 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/i2c-tools: add
 upstream post-4.2 i2ctransfer fix
Message-ID: <20210425065503.EABCA81539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fa2da0382029545c0d0098058028f2e6b835800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

i2c-tools 4.2 contained an invalid check, leading to verbose false-positive
warning messages when the variable length ({r,w}?) option is used:

https://www.spinics.net/lists/linux-i2c/msg50032.html
https://www.spinics.net/lists/linux-i2c/msg50253.html

Unfortunately upstream does not make bugfix releases, instead opting to list
such bugfixes on the wiki:

https://i2c.wiki.kernel.org/index.php/I2C_Tools

So add the patch here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 535c65594c852132ad9f0d48ef4ed0d81389c5d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s-i2ctransfer-add-check-for-returned-leng.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch b/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch
new file mode 100644
index 0000000000..7173efe219
--- /dev/null
+++ b/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch
@@ -0,0 +1,41 @@
+From 06a1909ae1e8ae1edc70dc48dd22a32ba5eceecb Mon Sep 17 00:00:00 2001
+From: Wolfram Sang <wsa+renesas@sang-engineering.com>
+Date: Tue, 9 Feb 2021 12:05:56 +0100
+Subject: [PATCH] Revert "tools: i2ctransfer: add check for returned length
+ from driver"
+
+This reverts commit 34806fc4e7090b34e32fa1110d546ab5ce01a6a0. It was
+developed against an experimental kernel. The regular kernel does not
+update the new message length to userspace, so the check is always false
+positive. We can't change the kernel behaviour because it would break
+the ABI. So revert this commit.
+
+Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
+Signed-off-by: Wolfram Sang <wsa@kernel.org>
+[Peter: drop CHANGES update]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ tools/i2ctransfer.c | 7 +------
+ 1 file changed, 1 insertions(+), 6 deletions(-)
+
+diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
+index f2a4df8..b0e8d43 100644
+--- a/tools/i2ctransfer.c
++++ b/tools/i2ctransfer.c
+@@ -88,12 +88,7 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
+ 		int recv_len = msgs[i].flags & I2C_M_RECV_LEN;
+ 		int print_buf = (read && (flags & PRINT_READ_BUF)) ||
+ 				(!read && (flags & PRINT_WRITE_BUF));
+-		__u16 len = msgs[i].len;
+-
+-		if (recv_len && print_buf && len != msgs[i].buf[0] + 1) {
+-			fprintf(stderr, "Correcting wrong msg length after recv_len! Please fix the I2C driver and/or report.\n");
+-			len = msgs[i].buf[0] + 1;
+-		}
++		__u16 len = recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
+ 
+ 		if (flags & PRINT_HEADER) {
+ 			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
+-- 
+2.20.1
+
