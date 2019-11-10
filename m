From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Nov 2019 22:09:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/am33x-cm3: disable SSP
Message-ID: <20191110210920.5625-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/3a3a21f3c35ea025e9b93e09c2454aed0ad31034

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Makefile-unconditionally-disable-SSP.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch

diff --git a/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch b/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch
new file mode 100644
index 0000000000..ed333bfe05
--- /dev/null
+++ b/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch
@@ -0,0 +1,35 @@
+From 6c3b05b74ccd49d8ba246bfef0c2e549b9f2bf7b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 29 Oct 2019 16:14:18 +0100
+Subject: [PATCH] Makefile: unconditionally disable SSP
+
+Though -nostdlib is passed in $(CFLAGS), -fno-stack-protector must also be
+passed to avoid linking errors related to undefined references to
+'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
+-fstack-protector.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/3a3a21f3c35ea025e9b93e09c2454aed0ad31034
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c3ec071..5226006 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,7 +16,8 @@ INCLUDES = $(SRCDIR)/include
+ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+-	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2
++	-Wempty-body -fno-strict-overflow -fno-stack-protector \
++	-g -I$(INCLUDES) -O2
+ LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
+ 
+ EXECUTABLE=am335x-pm-firmware.elf
+-- 
+2.23.0
+
-- 
2.23.0
