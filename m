From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 18:31:14 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: add NVidia's OpenGL
	binary blob
Message-ID: <20150302222721.B4158807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb69015f1f52213839cc5d594e5b17758eed8ef9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch only adds the userland part. Unless other such other
packages (which we named like: rpi-userland), we do not replicate this
naming scheme with this package, as a future patch will also enable
building the kernel part of the driver. So, it is better to just name
that package with -driver, rather than with -userland and renaming it
afterwards.

[Thomas:
 - Rewrap Config.in help text.
 - Add a comment to explain why mesa3d-headers, xlib_libX11 and
   xlib_libXext are part of the dependencies.
 - Fix typo in comment about library installation: s/The/Then/
 - Use 'addsuffix' instead of 'patsubst' to calculate the final
   filename of libraries to install.
 - Use more temporary variables to make the library installation loop
   clearer: 'libpath' is the relative path of the library in
   nvidia-driver sources, 'libname' the base name of the library,
   'libsoname' the soname of the library, and 'baseso' the base .so
   symlink name.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/nvidia-driver/Config.in          |   52 +++++++++++++
 package/nvidia-driver/nvidia-driver.hash |    3 +
 package/nvidia-driver/nvidia-driver.mk   |  116 ++++++++++++++++++++++++++++++
 4 files changed, 172 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d333311..3b07ab5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -349,6 +349,7 @@ endif
 	source "package/minicom/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
+	source "package/nvidia-driver/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
new file mode 100644
index 0000000..18453ab
--- /dev/null
+++ b/package/nvidia-driver/Config.in
@@ -0,0 +1,52 @@
+comment "nvidia-driver needs an (e)glibc toolchain and a modular Xorg server"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+
+config BR2_PACKAGE_NVIDIA_DRIVER
+	bool "nvidia-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	select BR2_PACKAGE_MESA3D_HEADERS
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
+	  Two libraries require special agreement with NVidia to
+	  develop code linking to those libraries: libnvidia-ifr.so
+	  and libnvidia-fbc.so (to grab and encode an OpenGL buffer or
+	  an X framebuffer.)
+
+	  Say 'y' here if you plan on running a program that uses
+	  those private libraries.
+
+endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
new file mode 100644
index 0000000..137590f
--- /dev/null
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bba63c30c730ad7b8500a77c81cae58562b9f9b57cd576b61f37a2d8bc45df25  NVIDIA-Linux-x86-346.35.run
+sha256  8625acbbc7a2abdda436a5cb9d06f2a7f5913b16e0a35ac4f9f106853a94d086  NVIDIA-Linux-x86_64-346.35.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
new file mode 100644
index 0000000..f703fab
--- /dev/null
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# nvidia-driver
+#
+################################################################################
+
+NVIDIA_DRIVER_VERSION = 346.35
+NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
+NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
+NVIDIA_DRIVER_LICENSE = NVIDIA Software License
+NVIDIA_DRIVER_LICENSE_FILES = LICENSE
+NVIDIA_DRIVER_REDISTRIBUTE = NO
+NVIDIA_DRIVER_INSTALL_STAGING = YES
+
+# Since nvidia-driver are binary blobs, the below dependencies are not
+# strictly speaking build dependencies of nvidia-driver. However, they
+# are build dependencies of packages that depend on nvidia-driver, so
+# they should be built prior to those packages, and the only simple
+# way to do so is to make nvidia-driver depend on them.
+NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers xlib_libX11 xlib_libXext
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
+# Then for all libraries, we install them and create a symlink using
+# their SONAME, so we can link to them at runtime; we also create the
+# no-version symlink, so we can link to them at build time.
+define NVIDIA_DRIVER_INSTALL_LIBS
+	for libpath in $(addsuffix .so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
+	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
+	do \
+		libname="$${libpath##*/}"; \
+		$(INSTALL) -D -m 0644 $(@D)/$${libpath} $(1)/usr/lib/$${libname}; \
+		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$${libpath}" \
+		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
+		if [ -n "$${libsoname}" -a "$${libsoname}" != "$${libname}" ]; then \
+			ln -sf $${libname} $(1)/usr/lib/$${libsoname}; \
+		fi; \
+		baseso="$${libname/.so*}.so"; \
+		if [ -n "$${baseso}" -a "$${baseso}" != "$${libname}" ]; then \
+			ln -sf $${libname} $(1)/usr/lib/$${baseso}; \
+		fi; \
+	done
+endef
+
+# For staging, install libraries and development files
+define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
+	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
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
