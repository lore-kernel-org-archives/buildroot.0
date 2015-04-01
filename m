From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Wed,  1 Apr 2015 22:12:33 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
	compression in the kernel.
Message-ID: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selecting lz4 compression in the kernel configuration yields a
significant improvement in boot time. Therefore we need lz4 as
dependency for the kernel.
Note that LZ4 is only supported on ARM kernel >=3.11.x
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
V1->V2
	Only add the host-lz4 dependency when ARM is selected.
	Don't touch host-lz4 package.
---
 linux/linux.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 22fce35..c9b8fc5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -71,6 +71,13 @@ LINUX_MAKE_ENV = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+# lz4 kernel compression is only available on ARM and kernel >= 3.11
+# we always build host-lz4 when the target is ARM.
+# (how could i use LINUX_VERSION_PROBED to check for >=3.11 ?)
+ifeq ($(BR2_arm),y)
+LINUX_DEPENDENCIES += host-lz4
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 
 
-- 
2.3.3
