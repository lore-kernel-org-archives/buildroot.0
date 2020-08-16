From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:27:33 +0200
Subject: [Buildroot] [git commit] package/bandwidthd: fix build with gcc 10
Message-ID: <20200816092111.63498865C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1396b06a1ee9a86055488de593be93ae2585ceb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6308c8ee38b6017215038d47c009b238113bd36f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-src-bandwidthd.h-fix-build-with-gcc-10.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..e7d0dec8d6
--- /dev/null
+++ b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,60 @@
+From dde68ed77114d7b19bfed3068edefc9dc0644445 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 16 Aug 2020 10:21:46 +0200
+Subject: [PATCH] src/bandwidthd.h: fix build with gcc 10
+
+Remove SubnetTable[SUBNET_NUM] and IpTable[IP_NUM] from bandwidthd.h as
+they are already in bandwidthd.c otherwise the build with gcc 10 will
+fail on:
+
+/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o bandwidthd bandwidthd.o graph.o extensions.o sqlight.o parser.o lexer.o pgsql.o  -lpcap -lgd -lm -lresolv  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lpng16 -lz  -L/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-gnueabihf/sysroot/usr/lib/.libs -lnl-genl-3 -lnl-3
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: graph.o:(.bss+0x4b0): multiple definition of `IpTable'; bandwidthd.o:(.bss+0x3e0): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: graph.o:(.bss+0x18c): multiple definition of `SubnetTable'; bandwidthd.o:(.bss+0x88): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6308c8ee38b6017215038d47c009b238113bd36f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nroach44/bandwidthd/pull/1]
+---
+ src/bandwidthd.h | 4 ++--
+ src/graph.c      | 1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/bandwidthd.h b/src/bandwidthd.h
+index 870fdf7..eb4c830 100644
+--- a/src/bandwidthd.h
++++ b/src/bandwidthd.h
+@@ -134,7 +134,7 @@ struct SubnetData
+ {
+   uint32_t ip;
+   uint32_t mask;
+-} SubnetTable[SUBNET_NUM];
++};
+ 
+ struct Statistics
+ {
+@@ -157,7 +157,7 @@ struct IPData
+   uint32_t ip;			// Host byte order
+   struct Statistics Send;
+   struct Statistics Receive;
+-} IpTable[IP_NUM];
++};
+ 
+ struct SummaryData
+ {
+diff --git a/src/graph.c b/src/graph.c
+index b4b68f0..058e8c7 100644
+--- a/src/graph.c
++++ b/src/graph.c
+@@ -18,6 +18,7 @@
+ #include <resolv.h>
+ #endif
+ 
++extern struct SubnetData SubnetTable[SUBNET_NUM];
+ extern unsigned int SubnetCount;
+ extern struct config config;
+ 
+-- 
+2.27.0
+
