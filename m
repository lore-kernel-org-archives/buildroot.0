From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 18 Mar 2019 17:36:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: Fix loop positional
 declaration build error
Message-ID: <1552923418-22447-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

Move 'i' variable outside of the 'for' loop to separate declaration
in lib/crc16.c

Fixes:
	http://autobuild.buildroot.net/results/332c9d2232c03440bf71794ee7850b1f6fd51d11/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...04-lib-crc16-Fix-loop-initial-declaration.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/uboot-tools/0004-lib-crc16-Fix-loop-initial-declaration.patch

diff --git a/package/uboot-tools/0004-lib-crc16-Fix-loop-initial-declaration.patch b/package/uboot-tools/0004-lib-crc16-Fix-loop-initial-declaration.patch
new file mode 100644
index 0000000..65b4c2f
--- /dev/null
+++ b/package/uboot-tools/0004-lib-crc16-Fix-loop-initial-declaration.patch
@@ -0,0 +1,38 @@
+From 1f6e30d11d7f58b028e42291e112cd44fbdcdbe9 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Mon, 18 Mar 2019 17:26:36 +0200
+Subject: [PATCH] lib/crc16: Fix loop initial declaration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix build error:
+
+    ./tools/../lib/crc16.c:70:2: error: ?for? loop initial declarations are
+        only allowed in C99 or C11 mode
+
+by moving 'i' variable from 'for' loop to separate declaration.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ lib/crc16.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/crc16.c b/lib/crc16.c
+index f46ba72..89d2cff 100644
+--- a/lib/crc16.c
++++ b/lib/crc16.c
+@@ -67,7 +67,9 @@ static const uint16_t crc16_tab[] = {
+ 
+ uint16_t crc16_ccitt(uint16_t cksum, const unsigned char *buf, int len)
+ {
+-	for (int i = 0;  i < len;  i++)
++	int i;
++
++	for (i = 0;  i < len;  i++)
+ 		cksum = crc16_tab[((cksum>>8) ^ *buf++) & 0xff] ^ (cksum << 8);
+ 
+ 	return cksum;
+-- 
+2.7.4
+
-- 
2.7.4
