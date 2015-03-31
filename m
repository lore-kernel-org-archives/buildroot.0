From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2015 19:45:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: CUDA support does
	not require X.org
In-Reply-To: <cover.1427823846.git.yann.morin.1998@free.fr>
References: <cover.1427823846.git.yann.morin.1998@free.fr>
Message-ID: <2e16677d7914c96eee67d84ad5d5192deeb9f733.1427823846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, nvidia-driver always installs the X.org driver, assuming this
is a requirement for all functionalities provided by nvidia-driver, thus
pulling in quite a bunch of X.org packages.

However, it is perfectly legit to be doing CUDA (and OpenCL) work
without the full X.org stack, and indeed the NVidia CUDA and OpenCL
libraries do not require the X.org stack.

Split the configuration so that it is posible to install the different
parts independently from each others, so that CUDA can be installed all
on its own.

Reported-by: Al West <al.west@v-nova.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Al West <al.west@v-nova.com>
---
 package/nvidia-driver/Config.in        | 42 +++++++++++++++++++++-------------
 package/nvidia-driver/nvidia-driver.mk | 22 ++++++++++--------
 2 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index cd7fc95..a63576c 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -1,12 +1,25 @@
-comment "nvidia-driver needs an (e)glibc toolchain and a modular Xorg server"
+comment "nvidia-driver needs an (e)glibc toolchain"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_NVIDIA_DRIVER
 	bool "nvidia-driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The binary-only driver blob for NVidia cards.
+	  This is the userland part only.
+
+	  http://www.nvidia.com/
+
+if BR2_PACKAGE_NVIDIA_DRIVER
+
+comment "nvidia-driver X.org drivers needs a modular Xorg server"
+	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+
+config BR2_PACKAGE_NVIDIA_DRIVER_XORG
+	bool "X.org drivers"
+	default y
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_MESA3D_HEADERS
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -14,13 +27,8 @@ config BR2_PACKAGE_NVIDIA_DRIVER
 	select BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
-	help
-	  The binary-only driver blob for NVidia cards.
-	  This is the userland part only.
 
-	  http://www.nvidia.com/
-
-if BR2_PACKAGE_NVIDIA_DRIVER
+if BR2_PACKAGE_NVIDIA_DRIVER_XORG
 
 config BR2_PACKAGE_PROVIDES_LIBGL
 	default "nvidia-driver"
@@ -31,13 +39,6 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "nvidia-driver"
 
-config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
-	bool "CUDA support"
-
-config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
-	bool "OpenCL support"
-	depends on BR2_PACKAGE_NVIDIA_DRIVER_CUDA
-
 config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
 	bool "Install private libraries"
 	help
@@ -49,6 +50,15 @@ config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
 	  Say 'y' here if you plan on running a program that uses
 	  those private libraries.
 
+endif # BR2_PACKAGE_NVIDIA_DRIVER_XORG
+
+config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+	bool "CUDA support"
+
+config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
+	bool "OpenCL support"
+	depends on BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+
 comment "nvidia kernel module needs a kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 4605d02..454209a 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -13,6 +13,8 @@ NVIDIA_DRIVER_LICENSE_FILES = LICENSE
 NVIDIA_DRIVER_REDISTRIBUTE = NO
 NVIDIA_DRIVER_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
+
 # Since nvidia-driver are binary blobs, the below dependencies are not
 # strictly speaking build dependencies of nvidia-driver. However, they
 # are build dependencies of packages that depend on nvidia-driver, so
@@ -38,15 +40,6 @@ NVIDIA_DRIVER_LIBS = \
 	libvdpau libvdpau_nvidia \
 	libnvidia-ml
 
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
-NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
-endif
-
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
-NVIDIA_DRIVER_LIBS_NO_VERSION += libOpenCL.so.1.0.0
-NVIDIA_DRIVER_LIBS += libnvidia-opencl
-endif
-
 # Those libraries are 'private' libraries requiring an agreement with
 # NVidia to develop code for those libs. There seems to be no restriction
 # on using those libraries (e.g. if the user has such an agreement, or
@@ -60,6 +53,17 @@ NVIDIA_DRIVER_X_MODS = drivers/nvidia_drv.so \
 	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
 
+endif # X drivers
+
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
+NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
+NVIDIA_DRIVER_LIBS_NO_VERSION += libOpenCL.so.1.0.0
+NVIDIA_DRIVER_LIBS += libnvidia-opencl
+endif
+
 # The downloaded archive is in fact an auto-extract script. So, it can run
 # virtually everywhere, and it is fine enough to provide useful options.
 # Except it can't extract into an existing (even empty) directory.
-- 
1.9.1
