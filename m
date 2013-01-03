From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Thu, 3 Jan 2013 13:20:39 +0530
Subject: [Buildroot] [PATCH 2/3] Add Perf tools support
Message-ID: <CAPDLWs-otw90dvsw7oVra=-+oNJZ0-SeiXE1CoXh1WUxNhq2vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
---
 linux/linux.mk |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e852f62..056a745 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -31,6 +31,27 @@ LINUX_SITE := $(LINUX_SITE)testing/
 endif # -rc
 endif

+#--- Perf: validate: perf minimally requires kernel ver >= 2.6.31
+ifeq ($(BR2_LINUX_KERNEL_USERMODE_TOOLS_PERF), y)
+ ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
+  LINUXVER_SPCS = $(subst ., ,$(LINUX_VERSION))
+  REL = $(word 3, $(LINUXVER_SPCS))
+  res = $(shell [ ${REL} -lt 31 ] && echo n || echo y )
+  ifeq ($(res), n)
+   $(error Perf minimally requires a kernel ver >= 2.6.31 ! Aborting...)
+  endif
+ endif
+ # FIXME: Where should we place the perf kernel patch? Online?
+ # Temporarily, at least, it's under linux/
+ BR2_LINUX_KERNEL_PATCH += "$(HOST_DIR)/../../linux/perf.patch"
+
+all:
+	$(info Building Perf...)
+	$(TARGET_MAKE_ENV) $(MAKE) ARCH=$(ARCH)
CROSS_COMPILE=$(TARGET_CROSS) NO_LIBELF=1 -C $(LINUX_DIR)/tools/perf
+	# Perf: Copy the perf binary executable to the target rootfs
+	cp -f $(LINUX_DIR)/tools/perf/perf $(TARGET_DIR)/usr/sbin
+endif
+
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))

 LINUX_INSTALL_IMAGES = YES
-- 
1.7.10.4
