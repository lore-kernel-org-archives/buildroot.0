From: Simon Maes <simonn.maes@gmail.com>
Date: Wed,  4 May 2016 09:47:57 +0200
Subject: [Buildroot] [PATCH 4/6] qemu: add qemu-system-run make target
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <1462348079-7631-4-git-send-email-simonn.maes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additional configuration for qemu package:
- Save qemu commandline arguments to run qemu directly using
 'make qemu-system-run'.

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
---
 package/qemu/Config.in.host | 7 +++++++
 package/qemu/qemu.mk        | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c86768f..8c07e71 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -88,4 +88,11 @@ config BR2_PACKAGE_HOST_QEMU_STRIP_BINARY
 
 endif # BR2_PACKAGE_HOST_QEMU_HAS_EMULS
 
+config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS
+	string "qemu-system command arguments"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
+	help
+	  Arguments to be used for your target host-qemu-system to run
+	  via "make qemu-system-run".
+
 endif # BR2_PACKAGE_HOST_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1910dbd..4de32b9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -151,6 +151,15 @@ $(eval $(host-generic-package))
 # variable used by other packages
 QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
+QEMU_SYSTEM = $(HOST_DIR)/usr/bin/qemu-system-$(HOST_QEMU_ARCH)
+
+.PHONY: qemu-system-run
+qemu-system-run:
+	$(QEMU_SYSTEM) $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS))
+endif
+
+
 #-------------------------------------------------------------
 # Target-qemu
 
-- 
2.6.2
