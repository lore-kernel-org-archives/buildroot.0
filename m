From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 16:33:52 -0800
Subject: [Buildroot] [git commit] linux-fusion: fix build
Message-ID: <20121130070800.B7AAD993D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba66de55ffc6a331a69ceac42a065da2200f905e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../linux-fusion/linux-fusion-fix-include.patch    |   52 ++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/linux-fusion/linux-fusion-fix-include.patch b/package/linux-fusion/linux-fusion-fix-include.patch
new file mode 100644
index 0000000..fe91488
--- /dev/null
+++ b/package/linux-fusion/linux-fusion-fix-include.patch
@@ -0,0 +1,52 @@
+Fix directfb-fusion kernel module build.
+
+This patch avoids the following error occurs:
+
+/usr/bin/make -f scripts/Makefile.build obj=/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion /opt/br/output/host/usr/bin/ccache 
+  /opt/br/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -Wp,-MD,/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion/single/.fusioncore_impl.o.d
+  -nostdinc -isystem /opt/br/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/include -I/opt/br/output/build/linux-3.6/arch/arm/include 
+  -Iarch/arm/include/generated -Iinclude  -include /opt/br/output/build/linux-3.6/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-versatile/include
+  -Iarch/arm/plat-versatile/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/opt/br/output/build/linux-fusion-8.8.1/linux/include -Wall -Wundef 
+  -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm 
+  -fno-dwarf2-cfi-asm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -Uarm -Wframe-larger-than=1024
+  -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack  -DMODULE
+  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(fusioncore_impl)"  -D"KBUILD_MODNAME=KBUILD_STR(fusion)" -c -o 
+/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.o /opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.c
+/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.c:25:19: fatal error: debug.h: No such file or directory
+compilation terminated.
+make[3]: *** [/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.o] Error 1
+make[2]: *** [_module_/opt/br/output/build/linux-fusion-8.8.1/linux/drivers/char/fusion] Error 2
+make[2]: Leaving directory `/opt/br/output/build/linux-3.6'
+make[1]: *** [modules] Error 2
+make[1]: Leaving directory `/opt/br/output/build/linux-fusion-8.8.1'
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff -purN linux-fusion-8.8.1.orig/linux/drivers/char/fusion/fusioncore.h linux-fusion-8.8.1/linux/drivers/char/fusion/fusioncore.h
+--- linux-fusion-8.8.1.orig/linux/drivers/char/fusion/fusioncore.h	2012-10-15 21:47:53.881834496 +0200
++++ linux-fusion-8.8.1/linux/drivers/char/fusion/fusioncore.h	2012-10-15 22:05:27.232401023 +0200
+@@ -17,7 +17,7 @@
+ 
+ #include <linux/stddef.h>
+ 
+-#include "fusioncore_impl.h"
++#include "single/fusioncore_impl.h"
+ 
+ typedef enum {
+      FC_OK,
+diff -purN linux-fusion-8.8.1.orig/linux/drivers/char/fusion/single/fusioncore_impl.c linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.c
+--- linux-fusion-8.8.1.orig/linux/drivers/char/fusion/single/fusioncore_impl.c	2012-10-15 21:47:53.878501243 +0200
++++ linux-fusion-8.8.1/linux/drivers/char/fusion/single/fusioncore_impl.c	2012-10-15 22:05:38.585511304 +0200
+@@ -22,9 +22,9 @@
+ #include <linux/slab.h>
+ #include <linux/sched.h>
+ 
+-#include "debug.h"
++#include "../debug.h"
+ 
+-#include "fusioncore.h"
++#include "../fusioncore.h"
+ 
+ 
+ 
