From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:14:36 +0200
Subject: [Buildroot] [PATCH 5/6] package/nvidia-driver: become an OpenCL
 provider
In-Reply-To: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181020221437.12687-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to install the mesa3d-headers, because the CL headers are not
provided by nvidia-driver (just like it didn't provide the OpenGL
headers).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvidia-driver/Config.in        | 5 +++++
 package/nvidia-driver/nvidia-driver.mk | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 732d9255c7..9631b3e70c 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -60,6 +60,11 @@ if BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 
 config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 	bool "OpenCL support"
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_HAS_LIBOPENCL
+
+config BR2_PACKAGE_PROVIDES_LIBOPENCL
+	default "nvidia-driver" if BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 
 config BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS
 	bool "CUDA MPS server and control"
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 0d051fcaa4..baf2ba2be5 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -116,6 +116,8 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
 NVIDIA_DRIVER_LIBS += \
 	libOpenCL.so.1.0.0 \
 	libnvidia-opencl.so.$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers
+NVIDIA_DRIVER_PROVIDES += libopencl
 endif
 
 # Build and install the kernel modules if needed
-- 
2.14.4
