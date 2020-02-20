From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 20 Feb 2020 13:57:29 -0600
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: fixup libraries
 according to README
Message-ID: <20200220195730.5011-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a symlink for libglx.so and drop libnvidia-wfb.so (aka libwfb.so)
since all selectable xserver versions in Buildroot provide their own.

https://download.nvidia.com/XFree86/Linux-x86_64/390.67/README/installedcomponents.html

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Depends on http://patchwork.ozlabs.org/patch/1181847/

 package/nvidia-driver/nvidia-driver.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index baf2ba2be5..b0ff277640 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -94,8 +94,7 @@ endif
 # We refer to the destination path; the origin file has no directory component
 NVIDIA_DRIVER_X_MODS = \
 	drivers/nvidia_drv.so \
-	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
+	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION)
 
 endif # X drivers
 
@@ -195,4 +194,14 @@ define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	# libglx needs a symlink according to the driver README. It has no SONAME
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
+# Due to a conflict with xserver_xorg-server, this needs to be done as part of
+# finalizing the target filesystem, otherwise the wrong version is used.
+NVIDIA_DRIVER_TARGET_FINALIZE_HOOKS += NVIDIA_DRIVER_SYMLINK_LIBGLX
+
 $(eval $(generic-package))
-- 
2.25.1
