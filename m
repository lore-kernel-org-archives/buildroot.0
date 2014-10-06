From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:26:13 +0200
Subject: [Buildroot] [PATCH 3/4 v3] package/nvidia-driver: add NVidia's
	OpenGL binary blob
In-Reply-To: <cover.1412633983.git.yann.morin.1998@free.fr>
References: <cover.1412633983.git.yann.morin.1998@free.fr>
Message-ID: <4413bbb7a045f3d21bf82332cbc2b55ab97dcf9b.1412633983.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch only adds the userland part. Unless other such other packages
(which we named like: rpi-userland), we do not replicate this naming
scheme with this package, as a future patch will also enable building
the kernel part of the driver. So, it is better to just name that
package with -driver, rather than with -userland and renaming it
afterwards.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                      |   1 +
 package/nvidia-driver/Config.in        |  53 ++++++++++++++++
 package/nvidia-driver/nvidia-driver.mk | 108 +++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 package/nvidia-driver/Config.in
 create mode 100644 package/nvidia-driver/nvidia-driver.mk

diff --git a/package/Config.in b/package/Config.in
index ba865e5..e912856 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -204,6 +204,7 @@ endif
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
+	source "package/nvidia-driver/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sawman/Config.in"
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
new file mode 100644
index 0000000..47fe796
--- /dev/null
+++ b/package/nvidia-driver/Config.in
@@ -0,0 +1,53 @@
+# Note: we only require threads, although that might well be NPTL.
+# But we require (e)glibc, which nowadays only has NPTL anyway.
+comment "nvidia-driver needs an (e)glibc toolchain w/ threads, and a modular Xorg server"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		&& !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+
+config BR2_PACKAGE_NVIDIA_DRIVER
+	bool "nvidia-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	select BR2_PACKAGE_OPENGL_REGISTRY
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  The binary-only driver blob for NVidia cards.
+	  This is the userland part only.
+
+	  http://www.nvidia.com/
+
+if BR2_PACKAGE_NVIDIA_DRIVER
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "nvidia-driver"
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "nvidia-driver"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "nvidia-driver"
+
+config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+	bool "CUDA support"
+
+config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
+	bool "OpenCL support"
+	depends on BR2_PACKAGE_NVIDIA_DRIVER_CUDA
+
+config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
+	bool "Install private libraries"
+	help
+	  Two libraries require special agreement with NVidia to develop code
+	  linking to those libraries: libnvidia-ifr.so and libnvidia-fbc.so
+	  (to grab and encode an OpenGL buffer or an X framebuffer.)
+
+	  Say 'y' here if you plan on running a program that uses those
+	  private libraries.
+
+endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
new file mode 100644
index 0000000..e88d8cc
--- /dev/null
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -0,0 +1,108 @@
+################################################################################
+#
+# nvidia-driver
+#
+################################################################################
+
+NVIDIA_DRIVER_VERSION = 340.46
+NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
+NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
+NVIDIA_DRIVER_LICENSE = NVIDIA Software License
+NVIDIA_DRIVER_LICENSE_FILES = LICENSE
+NVIDIA_DRIVER_REDISTRIBUTE = NO
+NVIDIA_DRIVER_INSTALL_STAGING = YES
+
+NVIDIA_DRIVER_DEPENDENCIES = opengl-registry xlib_libX11 xlib_libXext
+NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
+
+# We have two variables that contains a list of libraries to install:
+#   NVIDIA_DRIVER_LIBS
+#       contains the libraries whose filename end up in .so.$(VERSION); rather
+#       than duplicate the version string for all of them, we just store their
+#       basename, and append the version string below.
+#   NVIDIA_DRIVER_LIBS_NO_VERSION
+#       contains all libraries the do not use the NVidia version; since there
+#       is currently only one such library, we store its full name.
+
+# Each line corresponds to a specific set of libraries
+NVIDIA_DRIVER_LIBS = \
+	libEGL libGLESv1_CM libGLESv2 libGL \
+	libnvidia-glcore libnvidia-eglcore libnvidia-glsi \
+	tls/libnvidia-tls \
+	libvdpau libvdpau_nvidia \
+	libnvidia-ml
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
+# Those libraries are 'private' libraries requiring an agreement with
+# NVidia to develop code for those libs. There seems to be no restriction
+# on using those libraries (e.g. if the user has such an agreement, or
+# wants to run a third-party program developped under such an agreement).
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
+NVIDIA_DRIVER_LIBS += libnvidia-ifr libnvidia-fbc
+endif
+
+# We refer to the destination path; the origin file has no directory component
+NVIDIA_DRIVER_X_MODS = drivers/nvidia_drv.so \
+	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
+
+# The downloaded archive is in fact an auto-extract script. So, it can run
+# virtually everywhere, and it is fine enough to provide useful options.
+# Except it can't extract into an existing (even empty) directory.
+define NVIDIA_DRIVER_EXTRACT_CMDS
+	$(SHELL) $(DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target \
+		$(@D)/tmp-extract
+	mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
+	rm -rf $(@D)/tmp-extract
+endef
+
+# Helper to install libraries
+# $1: destination directory (target or staging)
+#
+# For all libraries that need it, we append the NVidia version string.
+# The for all libraries, we install them and create a symlink using their
+# SONAME, so we can link to them at runtime; we also create the no-version
+# symlink, so we can link to them at build time.
+define NVIDIA_DRIVER_INSTALL_LIBS
+	for lib in $(patsubst %,%.so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
+	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
+	do \
+		$(INSTALL) -D -m 0644 $(@D)/$${lib} $(1)/usr/lib/$${lib##*/}; \
+		n="$$( $(TARGET_READELF) -d "$(@D)/$${lib}" \
+		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
+		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
+			ln -sf $${lib##*/} $(1)/usr/lib/$${n}; \
+		fi; \
+		n="$${lib##*/}"; n="$${n/.so*}.so"; \
+		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
+			ln -sf $${lib##*/} $(1)/usr/lib/$${n}; \
+		fi; \
+	done
+endef
+
+# For staging, install libraries and development files
+define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
+	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's/-L[^[:space:]]\+//' $(STAGING_DIR)/usr/lib/libGL.la
+endef
+
+# For target, install libraries and X.org modules
+define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
+	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
+	for m in $(NVIDIA_DRIVER_X_MODS); do \
+		$(INSTALL) -D -m 0644 $(@D)/$${m##*/} \
+			$(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
