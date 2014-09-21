From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 23:22:56 +0200
Subject: [Buildroot] [PATCH 3/3 v2] package/nvidia-driver: build the kernel
	module
In-Reply-To: <cover.1411334346.git.yann.morin.1998@free.fr>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
Message-ID: <1aff79ec2bb8dc545496e965aa1fae0756be29ce.1411334346.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option to build the nvidia.ko module. If CUDA is enabled, also build
the nvidia-uvm.ko kernel module (for Unified Memory access), which is
required by the CUDA user-land library.

Substancially inspired by the corresponding Gentoo ebuild:
    http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-drivers/nvidia-drivers/nvidia-drivers-340.32.ebuild?revision=1.2&view=markup

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nvidia-driver/Config.in        | 13 +++++++++
 package/nvidia-driver/nvidia-driver.mk | 49 ++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index becb1ae..fd5dfeb 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -61,4 +61,17 @@ config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
 	  Say 'y' here if you plan on running a program that uses those
 	  private libraries.
 
+comment "nvidia kernel module needs a kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
+	bool "nvidia kernel module"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Build the nvidia.ko kernel module.
+
+	  If CUDA support (above) is set, then this will also build
+	  the nvidia-uvm.ko kernel module, which provides Unified
+	  Memory access to the GPU and CPU memories for CUDA programs.
+
 endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index efe3fa0..4f0f718 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -54,6 +54,54 @@ define NVIDIA_DRIVER_EXTRACT_CMDS
 	rm -rf $(@D)/foo
 endef
 
+# Build and install the kernel modules if needed
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
+
+NVIDIA_DRIVER_DEPENDENCIES += linux
+
+# NVidia uses the legacy naming scheme for the x86 architecture, when i386
+# and x86_64 were still considered two separate architectures in the Linux
+# kernel.
+NVIDIA_DRIVER_ARCH = $(if $(BR2_i386),i386,$(BR2_ARCH))
+
+NVIDIA_DRIVER_MOD_DIRS = kernel
+NVIDIA_DRIVER_MOD_FILES = kernel/nvidia.ko
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
+NVIDIA_DRIVER_MOD_DIRS += kernel/uvm
+NVIDIA_DRIVER_MOD_FILES += kernel/uvm/nvidia-uvm.ko
+endif
+
+# We can not use '$(MAKE) -C $(@D)/$${dir}' because NVidia's uses its own
+# Makefile to build a kernel module, which includes a lot of assumptions
+# on where to find its own sub-Makefile fragments, and fails if make is
+# not run from the directory where the module's source files are. Hence
+# our little trick to cd in there first.
+# That's also the reason why we do not use LINUX_MAKE_FLAGS or the other
+# linux-specific variables, since NVidia's Makefile does not understand
+# them.
+define NVIDIA_DRIVER_BUILD_CMDS
+	for dir in $(NVIDIA_DRIVER_MOD_DIRS); do \
+		cd $(@D)/$${dir}; \
+		$(MAKE) SYSSRC=$(LINUX_DIR) SYSOUT=$(LINUX_DIR) \
+			CC=$(TARGET_CC) LD=$(TARGET_LD) HOSTCC=$(HOSTCC) \
+			ARCH=$(NVIDIA_DRIVER_ARCH) module || exit 1; \
+	done
+endef
+
+# We do not use module-install because NVidia's Makefile requires root.
+# Also, we do not install it in the expected location (in nvidia/ rather
+# than in kernel/drivers/video/ )
+define NVIDIA_DRIVER_INSTALL_KERNEL_MODULE
+	for mod in $(NVIDIA_DRIVER_MOD_FILES); do \
+		$(INSTALL) -D -m 0644 $(@D)/$${mod} \
+			$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/nvidia/$${mod##*/} \
+		|| exit 1; \
+	done
+	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
+endef
+
+endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
+
 # Helper to install libraries
 # $1: destination directory (target or staging)
 define NVIDIA_DRIVER_INSTALL_LIBS
@@ -87,6 +135,7 @@ define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 		 $(INSTALL) -v -D -m 0644 $(@D)/$${m##*/} \
 					  $(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
 	done
+	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
