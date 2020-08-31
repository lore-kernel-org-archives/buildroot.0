From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 15:18:01 +0200
Subject: [Buildroot] [git commit] package/am33x-cm3: fix build with gcc 10
Message-ID: <20200831131327.53486875CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d95890292392459682d385fbadfec6bf743614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a991e6efa012df518ff1bb35017ad2c96c8feedc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../am33x-cm3/0004-Makefile-add-fno-builtin.patch  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch b/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch
new file mode 100644
index 0000000000..7478bd45f3
--- /dev/null
+++ b/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch
@@ -0,0 +1,41 @@
+From 25fc567ba8a0cd199e48bfa82863247d953784ea Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 30 Aug 2020 20:59:29 +0200
+Subject: [PATCH] Makefile: add -fno-builtin
+
+Build with gcc 10 fails on:
+
+/srv/storage/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/foundation/startup.o: in function `reset_handler':
+/srv/storage/autobuild/run/instance-2/output-1/build/am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365/src/foundation/startup.c:177: undefined reference to `memcpy'
+
+This is due to the fact that gcc 10 replaces the following statement by
+a memcpy call:
+
+*puldest++ = *pulsrc++;
+
+To fix this build failure, add -fno-builtin
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a991e6efa012df518ff1bb35017ad2c96c8feedc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fe3d844..fa24d4b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ 	-Wempty-body -fno-strict-overflow -fno-stack-protector \
+-	-fno-pie -g -I$(INCLUDES) -O2
++	-fno-pie -fno-builtin -g -I$(INCLUDES) -O2
+ LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
+ 
+ EXECUTABLE=am335x-pm-firmware.elf
+-- 
+2.28.0
+
