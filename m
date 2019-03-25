From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 13:22:15 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sunxi-tools: fix
 build meminfo with musl
Message-ID: <20190325122042.9244A80539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=119abfcdddd8be716d0736d0ed39993fc0405007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

musl does not provide inx/outx API for ARM arch, so use
io memory access via pointers which is actually done this
way in glibc/ulibc.

Fixes:
    http://autobuild.buildroot.net/results/bf10cbe40c0f672c34db72e4eea4c168d5932bd4/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d12d3969d1d7501a1ebd8e642aa0f0a1098715de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-meminfo-Access-to-io-memory-via-pointers.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
new file mode 100644
index 0000000000..997c413f23
--- /dev/null
+++ b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
@@ -0,0 +1,59 @@
+From 5c0a443ba336f10a8db6a99c769aa84ad37ed4d2 Mon Sep 17 00:00:00 2001
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
+index 0b0ff23..7d9f10f 100644
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
++	sunxi_io_write(base, offset, tmp);
+ }
+ 
+ 
+-- 
+2.14.1
+
