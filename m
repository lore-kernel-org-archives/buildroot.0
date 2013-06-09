From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Jun 2013 12:57:38 +0200
Subject: [Buildroot] [PATCH] am33x-cm3: Enforce correct -march option
Message-ID: <1370775458-31863-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot uses a normal ARM compiler to build the AM33X CM3 firmware
(which runs on a Cortex-M3 processor), but Buildroot will have a
default -march value that doesn't necessarily match the one needed for
Cortex-M3, leading to build failures (gcc complains that the
-mcpu=cortex-m3 option being passed is not compatible with the
selected -march).

Fix this by explicitly indicating -march=armv7-m.

Fixes:

   http://autobuild.buildroot.net/results/db1/db13623b1701bfe678c302e8f88c7473cb2345f9/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../am33x-cm3/am33x-cm3-0001-fix-makefile.patch    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch

diff --git a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
new file mode 100644
index 0000000..77ba11c
--- /dev/null
+++ b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
@@ -0,0 +1,26 @@
+Enforce correct -march option
+
+Buildroot uses a normal ARM compiler to build the AM33X CM3 firmware
+(which runs on a Cortex-M3 processor), but Buildroot will have a
+default -march value that doesn't necessarily match the one needed for
+Cortex-M3, leading to build failures (gcc complains that the
+-mcpu=cortex-m3 option being passed is not compatible with the
+selected -march).
+
+Fix this by explicitly indicating -march=armv7-m.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -13,7 +13,7 @@
+ BINDIR = bin
+ 
+ INCLUDES = $(SRCDIR)/include
+-CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -Wall -g -I$(INCLUDES)
++CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -g -I$(INCLUDES)
+ LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
+ 
+ EXECUTABLE=am335x-pm-firmware.elf
-- 
1.8.1.2
