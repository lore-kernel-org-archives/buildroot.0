From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 20 Feb 2019 03:27:37 +0200
Subject: [Buildroot] [RFT 1/1] package/sunxi-tools: Fix build meminfo with
 musl
Message-ID: <20190220012737.19571-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl does not provide inx/outx API for ARM arch, so use
io memory access via pointers which is actually done this
way in glibc/ulibc.

Fixes:
    http://autobuild.buildroot.net/results/bf10cbe40c0f672c34db72e4eea4c168d5932bd4/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

Actually the changes are simple and might be taken w/o testing,
but it would be great if someone can test it as I need some time
to obtain board with Allwinner's SoC, so I mark this patch with
RFT (Request For Testing).

 ...-meminfo-Access-to-io-memory-via-pointers.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch

diff --git a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
new file mode 100644
index 0000000000..1d158e7309
--- /dev/null
+++ b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
@@ -0,0 +1,59 @@
+From b29c34772db38ce1386d316a7a08093fa0913447 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Wed, 20 Feb 2019 02:48:43 +0200
+Subject: [PATCH] meminfo: Access to io memory via pointers
+
+The main reason for this is to be able compile with musl library,
+because there is no support of inx/outx functions for ARM platform.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ meminfo.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/meminfo.c b/meminfo.c
+index 0b0ff23..d1c619a 100644
+--- a/meminfo.c
++++ b/meminfo.c
+@@ -22,7 +22,6 @@
+ #include <sys/mman.h>
+ #include <stdint.h>
+ #include <errno.h>
+-#include <sys/io.h>
+ #include <stdbool.h>
+ 
+ #include "common.h"
+@@ -74,24 +73,26 @@ static enum sunxi_soc_version soc_version;
+ unsigned int
+ sunxi_io_read(void *base, int offset)
+ {
+-	return inl((unsigned long) (base + offset));
++	unsigned long port = (unsigned long) (base + offset);
++	return *((volatile unsigned long *) port);
+ }
+ 
+ void
+ sunxi_io_write(void *base, int offset, unsigned int value)
+ {
+-	outl(value, (unsigned long) (base + offset));
++	unsigned long port = (unsigned long) (base + offset);
++	*((volatile unsigned long *) port) = value;
+ }
+ 
+ void
+ sunxi_io_mask(void *base, int offset, unsigned int value, unsigned int mask)
+ {
+-	unsigned int tmp = inl((unsigned long) (base + offset));
++	unsigned int tmp = sunxi_io_read(base, offset);
+ 
+ 	tmp &= ~mask;
+ 	tmp |= value & mask;
+ 
+-	outl(tmp, (unsigned long) (base + offset));
++	sunxi_io_write(tmp, base, offset);
+ }
+ 
+ 
+-- 
+2.14.1
+
-- 
2.14.1
