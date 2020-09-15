From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:15:36 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/memtester: fix
 build with gcc 10
Message-ID: <20200915185503.EA741868C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=346ec83700f29ce4ccaa4a9b8838e33aa99fc1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/e1c276603475a952847fd53724e56101cdccbbcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a68350f039682fbbced9a499f053d22210f5e853)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memtester/0002-fix-build-with-gcc-10.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/memtester/0002-fix-build-with-gcc-10.patch b/package/memtester/0002-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..8c9b3945bb
--- /dev/null
+++ b/package/memtester/0002-fix-build-with-gcc-10.patch
@@ -0,0 +1,65 @@
+From acd226cd4073b77abce8783e19c5ef3bbf8074ef Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Sep 2020 21:39:03 +0200
+Subject: [PATCH] fix build with gcc 10
+
+Move mword8 and mword16 from types.h to tests.c to avoid the following
+build failure with gcc 10 (which defaults to -fno-common):
+
+/srv/storage/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: tests.o: in function `.LANCHOR1':
+tests.c:(.bss+0x4): multiple definition of `mword16'; memtester.o:memtester.c:(.bss+0xc): first defined here
+/srv/storage/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: tests.o: in function `.LANCHOR1':
+tests.c:(.bss+0x0): multiple definition of `mword8'; memtester.o:memtester.c:(.bss+0x10): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e1c276603475a952847fd53724e56101cdccbbcb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to charlesc at pyropus.ca]
+---
+ tests.c | 10 ++++++++++
+ types.h | 10 ----------
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/tests.c b/tests.c
+index be1b350..d3d25c7 100644
+--- a/tests.c
++++ b/tests.c
+@@ -22,6 +22,16 @@
+ #include "sizes.h"
+ #include "memtester.h"
+ 
++union {
++    unsigned char bytes[UL_LEN/8];
++    ul val;
++} mword8;
++
++union {
++    unsigned short u16s[UL_LEN/16];
++    ul val;
++} mword16;
++
+ char progress[] = "-\\|/";
+ #define PROGRESSLEN 4
+ #define PROGRESSOFTEN 2500
+diff --git a/types.h b/types.h
+index ad7ce73..dca7fc0 100644
+--- a/types.h
++++ b/types.h
+@@ -24,13 +24,3 @@ struct test {
+     char *name;
+     int (*fp)();
+ };
+-
+-union {
+-    unsigned char bytes[UL_LEN/8];
+-    ul val;
+-} mword8;
+-
+-union {
+-    unsigned short u16s[UL_LEN/16];
+-    ul val;
+-} mword16;
+-- 
+2.28.0
+
