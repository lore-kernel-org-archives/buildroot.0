From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:28:51 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: build the kernel
	module
Message-ID: <20150302222721.C694681764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b9285a8748cb4bd6f301603ef688eb6be025a39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option to build the nvidia.ko module. If CUDA is enabled on x86_64,
also build the nvidia-uvm.ko kernel module (for Unified Memory access),
which is required by the CUDA user-land library.

Substancially inspired by the corresponding Gentoo ebuild:
    http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-drivers/nvidia-drivers/nvidia-drivers-340.32.ebuild?revision=1.2&view=markup

[Thomas:
  - add quotes when using $(TARGET_CC) and other variables, since they
    can have spaces in their values
  - remove space after opening parenthesis and before closing parenthesis.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/Config.in        |   14 +++++++++
 package/nvidia-driver/nvidia-driver.mk |   50 ++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 18453ab..cd7fc95 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -49,4 +49,18 @@ config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
 	  Say 'y' here if you plan on running a program that uses
 	  those private libraries.
 
+comment "nvidia kernel module needs a kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
+	bool "nvidia kernel module"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Build the nvidia.ko kernel module.
+
+	  If CUDA support (above) is set, and the target is x86_64, then
+	  this will also build the nvidia-uvm.ko kernel module, which
+	  provides Unified Memory access to the GPU and CPU memories for
+	  CUDA programs.
+
 endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 2a35f9b..4605d02 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -70,6 +70,55 @@ define NVIDIA_DRIVER_EXTRACT_CMDS
 	rm -rf $(@D)/tmp-extract
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
+# nvidia-uvm.ko only available for x86_64
+ifeq ($(BR2_x86_64)$(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),yy)
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
+		(cd $(@D)/$${dir} && \
+		  $(MAKE) SYSSRC="$(LINUX_DIR)" SYSOUT="$(LINUX_DIR)" \
+				CC="$(TARGET_CC)" LD="$(TARGET_LD)" HOSTCC="$(HOSTCC)" \
+				ARCH=$(NVIDIA_DRIVER_ARCH) module) || exit 1; \
+	done
+endef
+
+# We do not use module-install because NVidia's Makefile requires root.
+# Also, we do not install it in the expected location (in nvidia/ rather
+# than in kernel/drivers/video/)
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
 #
@@ -112,6 +161,7 @@ define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 0644 $(@D)/$${m##*/} \
 			$(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
 	done
+	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
 $(eval $(generic-package))
