From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:07:40 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: use += where
 appropriate
Message-ID: <20181203220540.EC7BC8A62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45004ac59a7051df0961f036ec05cc4963636436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Within the BR2_PACKAGE_NVIDIA_DRIVER_XORG condition, some "="
assignements are used for various variables, which are also appended
in other conditions below in nvidia-driver.mk.

It works fine because those assignements appear earlier in the .mk,
but it is a bit error-prone, so let's use += when adding values to
those variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvidia-driver/nvidia-driver.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index a595aed4f7..0d051fcaa4 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -20,8 +20,8 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
 # are build dependencies of packages that depend on nvidia-driver, so
 # they should be built prior to those packages, and the only simple
 # way to do so is to make nvidia-driver depend on them.
-NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers xlib_libX11 xlib_libXext
-NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
+NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext
+NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
 
 # libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
 # has been replaced with libGL.so.1.0.0. Installing both is technically
@@ -65,7 +65,7 @@ NVIDIA_DRIVER_LIBS_MISC = \
 	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
 
-NVIDIA_DRIVER_LIBS = \
+NVIDIA_DRIVER_LIBS += \
 	$(NVIDIA_DRIVER_LIBS_GL) \
 	$(NVIDIA_DRIVER_LIBS_EGL) \
 	$(NVIDIA_DRIVER_LIBS_GLES) \
