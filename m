From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 25 Mar 2020 15:31:08 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on arm32 arch
 not armv7
Message-ID: <20200325143108.11935-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS assumes that every arm32 build is an armv7, but this is not, so
let's add a patch to remove -march=armv7 flag.

Fixes:
http://autobuild.buildroot.net/results/464/464044fda2850123339de6c8071374e380636ee0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...w-build-gcm-arm32-neon-on-march-armv.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libnss/0002-Bug-1624864-Allow-build-gcm-arm32-neon-on-march-armv.patch

diff --git a/package/libnss/0002-Bug-1624864-Allow-build-gcm-arm32-neon-on-march-armv.patch b/package/libnss/0002-Bug-1624864-Allow-build-gcm-arm32-neon-on-march-armv.patch
new file mode 100644
index 0000000000..f23a067833
--- /dev/null
+++ b/package/libnss/0002-Bug-1624864-Allow-build-gcm-arm32-neon-on-march-armv.patch
@@ -0,0 +1,28 @@
+From 345503215135466a0008ef1b7546b65e5705d0df Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 25 Mar 2020 15:02:20 +0100
+Subject: [PATCH] Bug 1624864 - Allow build gcm-arm32-neon on -march != armv7
+
+Don't assume every arm32 support armv7 instruction set.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index dc502f309..c7eb9c205 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -781,7 +781,7 @@ ifeq ($(CPU_ARCH),arm)
+ USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
+ $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ ifndef NSS_DISABLE_GCM_ARM32_NEON
+-$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
++$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ endif
+ endif
+ ifeq ($(CPU_ARCH),aarch64)
+-- 
+2.20.1
+
-- 
2.20.1
