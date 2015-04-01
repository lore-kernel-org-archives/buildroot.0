From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:25:03 +0200
Subject: [Buildroot] [git commit] package/nvidia-driver: add option to
	install CUDA MPS server
Message-ID: <20150401212855.E740A7FA28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d3e97e033e4cdff17913914dffb6fee033411c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using CUDA with NVidia requires those two programs if one wants to use
more than one program doing CUDA at the same time.

This is only available on x86_64.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Al West <al.west@v-nova.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/Config.in        |   13 ++++++++++++-
 package/nvidia-driver/nvidia-driver.mk |    7 +++++++
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index a63576c..b50e2c3 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -55,9 +55,20 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_XORG
 config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 	bool "CUDA support"
 
+if BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+
 config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 	bool "OpenCL support"
-	depends on BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+
+config BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS
+	bool "CUDA MPS server and control"
+	depends on BR2_x86_64
+	help
+	  Say 'y' here if you need to run more than one program
+	  doing CUDA at the same time. The MPS server will be
+	  launched automatically when needed.
+
+endif # BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 
 comment "nvidia kernel module needs a kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 454209a..a85cc1c 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -57,6 +57,9 @@ endif # X drivers
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
 NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
+NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
@@ -165,6 +168,10 @@ define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 0644 $(@D)/$${m##*/} \
 			$(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
 	done
+	for p in $(NVIDIA_DRIVER_PROGS); do \
+		$(INSTALL) -D -m 0755 $(@D)/$${p} \
+			$(TARGET_DIR)/usr/bin/$${p}; \
+	done
 	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
