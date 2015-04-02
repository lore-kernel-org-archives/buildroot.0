From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Fri,  3 Apr 2015 00:04:45 +0200
Subject: [Buildroot] [PATCH 1/1 v3] always build host-lz4
Message-ID: <1428012285-5967-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selecting lz4 compression in the kernel configuration yields a
significant improvement in boot time. Therefore we need lz4 as
dependency for the kernel.
Note that LZ4 is only supported on kernels >=3.11.x
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
V2->V3
	Unconditionally build lz4.
	The building overhead is negligible.
V1->V2
	Only add the host-lz4 dependency when ARM is selected.
	Don't touch host-lz4 package.
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 22fce35..14a5dab 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -71,6 +71,10 @@ LINUX_MAKE_ENV = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+# lz4 kernel compression is only available on kernels >= 3.11
+# we always build host-lz4
+LINUX_DEPENDENCIES += host-lz4
+
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-- 
2.3.3
