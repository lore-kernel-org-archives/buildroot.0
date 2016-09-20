From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:15:25 +0200
Subject: [Buildroot] [git commit] package/nvidia-driver: update version
Message-ID: <20160920191734.2AFD481841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c464f960047c549141c2f0c2178b9bea4b142133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version brings in support for egl-wayland, the EGL extensions
aimed at making it possible to implement Wayland servers and clients. As
such, nvidia-driver becomes the second EGL implementation in Buildroot
that can act as a libegl provider with egl-wayland extensions.

In this version, it becomes possible to use our kernel-module infra,
with just a little few minor tricks: we need just specify the Linux
source and build trees (they are the same for us) and the list of
modules to build. We still need a little patch against the Kbuild files.

We also get rid of the LIBS_NO_VERSION trick and always use complete
filenames, as more libs are now packaged with different version in their
filenames, and even some with no version at all.

When installing libs, we switch from a shell loop to a make foreach
loop, which is easier to handle. It has the side-effect (and advantage)
of displaying the install commands for each library, rather than a
single biggish one, so it is easier to see what goes wrong. This also
means that an error in each phase of the install (the copy of the files
then each symlink) can be caught more easily (it was not previously):
each sequence is now its own make command; we need not use "|| exit 1"
after each command, even in a if block, because the if blocks returns
with the exit code of the last command in it; e.g. if an ln fails, the
if-block in which it is enclosed will return the exit code of ln, and
make will catch it.

Similarly for the X driver modules and each of the programs installed:
we now can catch any failure in the isntall of those.

All of this somewhat simplifies the .mk. It is a little bit longer, but
the structure is saner and more explicit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/0001-use-LDFLAGS.patch |  48 +++++++
 package/nvidia-driver/Config.in              |   6 +-
 package/nvidia-driver/nvidia-driver.hash     |   4 +-
 package/nvidia-driver/nvidia-driver.mk       | 204 ++++++++++++++-------------
 4 files changed, 161 insertions(+), 101 deletions(-)

diff --git a/package/nvidia-driver/0001-use-LDFLAGS.patch b/package/nvidia-driver/0001-use-LDFLAGS.patch
new file mode 100644
index 0000000..7b7df80
--- /dev/null
+++ b/package/nvidia-driver/0001-use-LDFLAGS.patch
@@ -0,0 +1,48 @@
+kernel: use LDFLAGS when linking modules
+
+Currently, linking module objects is simply using $(LD), assuming that
+the default emulation is correct for the current architecture.
+
+However, that might not be the case when the toolchain default is not
+the same as the current arch. For example, if the toolchain defaults to
+i386 and is capable of x86_64, and we're targetting x86_64 (or the
+opposite), the link would fail because the ld emulation is incorrect:
+
+    .../i686-pc-linux-gnu-ld: Relocatable linking with relocations from
+    format elf64-x86-64 (.../nvidia-driver-370.23/kernel/nvidia/nv-frontend.o)
+    to format elf32-i386 (.../nvidia-driver-370.23/kernel/nvidia/nv-interface.o)
+    is not supported
+
+Add use of $(LDFLAGS) when doing the link, as the kernel provides the
+proper emulation in those.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Issue reported upstream:
+    https://devtalk.nvidia.com/default/topic/958653/
+
+diff -durN nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild
+--- nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild	2016-08-09 01:57:50.000000000 +0200
++++ nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild	2016-08-20 12:25:02.780233423 +0200
+@@ -87,7 +87,7 @@
+ always += $(NVIDIA_INTERFACE)
+ 
+ $(obj)/$(NVIDIA_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_OBJECTS))
+-	$(LD) -r -o $@ $^
++	$(LD) $(LDFLAGS) -r -o $@ $^
+ 
+ 
+ #
+diff -durN nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild
+--- nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-09 01:43:19.000000000 +0200
++++ nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-20 12:25:39.596772662 +0200
+@@ -70,7 +70,7 @@
+ always += $(NVIDIA_MODESET_INTERFACE)
+ 
+ $(obj)/$(NVIDIA_MODESET_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_MODESET_OBJECTS))
+-	$(LD) -r -o $@ $^
++	$(LD) $(LDFLAGS) -r -o $@ $^
+ 
+ #
+ # Register the conftests needed by nvidia-modeset.ko
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 04499f6..1105ec6 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -22,10 +22,11 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
 	default y
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_MESA3D_HEADERS
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBX11 # runtime
+	select BR2_PACKAGE_XLIB_LIBXEXT # runtime
 	select BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_HAS_LIBGLES
 
 if BR2_PACKAGE_NVIDIA_DRIVER_XORG
@@ -62,7 +63,6 @@ config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 
 config BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS
 	bool "CUDA MPS server and control"
-	depends on BR2_x86_64
 	help
 	  Say 'y' here if you need to run more than one program
 	  doing CUDA at the same time. The MPS server will be
diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index ba2f555..9427ffb 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	d3a2842cbfb1163e20c658fbfaf5a235d5c9f035cd2d657f15df8a14b3fe80b1	NVIDIA-Linux-x86-358.16.run
-sha256	a942cdb29ed715ff1ce25beb06b6c2490126b98ef8bee5d9973967b557596bf2	NVIDIA-Linux-x86_64-358.16.run
+sha256  38cb22fa85ef74ea960d3e5d644838cd961984ffc32bb0d052414cc7fa32e315  NVIDIA-Linux-x86-367.35.run
+sha256  d2df3fcb1a145984b9de4f2f38a90e353469e9d12279cf5e2c67c553b112d075  NVIDIA-Linux-x86_64-367.35.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7e67020..c1fc986 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 358.16
+NVIDIA_DRIVER_VERSION = 367.35
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
@@ -20,25 +20,56 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
 # are build dependencies of packages that depend on nvidia-driver, so
 # they should be built prior to those packages, and the only simple
 # way to do so is to make nvidia-driver depend on them.
-NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers xlib_libX11 xlib_libXext
+NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers
 NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
 
-# We have two variables that contains a list of libraries to install:
-#   NVIDIA_DRIVER_LIBS
-#       contains the libraries whose filename end up in .so.$(VERSION); rather
-#       than duplicate the version string for all of them, we just store their
-#       basename, and append the version string below.
-#   NVIDIA_DRIVER_LIBS_NO_VERSION
-#       contains all libraries the do not use the NVidia version; since there
-#       is currently only one such library, we store its full name.
+# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
+# has been replaced with libGL.so.1.0.0. Installing both is technically
+# possible, but great care must be taken to ensure they do not conflict,
+# so that EGL still works. The legacy library exposes an NVidia-specific
+# API, so it should not be needed, except for legacy, binary-only
+# applications (in other words: we don't care).
+#
+# libGL.so.1.0.0 is the new vendor-neutral library, aimed at replacing
+# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The latter contains
+# NVidia extensions (which is deemed bad now), while the former follows
+# the newly-introduced vendor-neutral "dispatching" API/ABI:
+#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
+# However, this is not very usefull to us, as we don't support multiple
+# GL providers at the same time on the system, which this proposal is
+# aimed at supporting.
+#
+# So we only install the legacy library for now.
+NVIDIA_DRIVER_LIBS_GL = \
+	libGLX.so.0 \
+	libGL.so.$(NVIDIA_DRIVER_VERSION) \
+	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+
+NVIDIA_DRIVER_LIBS_EGL = \
+	libEGL.so.1 \
+	libGLdispatch.so.0 \
+	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+
+NVIDIA_DRIVER_LIBS_GLES = \
+	libGLESv1_CM.so.1 \
+	libGLESv2.so.2 \
+	libGLESv1_CM_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+
+NVIDIA_DRIVER_LIBS_MISC = \
+	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-egl-wayland.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
+	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
+	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
 
-# Each line corresponds to a specific set of libraries
 NVIDIA_DRIVER_LIBS = \
-	libEGL libGLESv1_CM libGLESv2 libGL \
-	libnvidia-glcore libnvidia-eglcore libnvidia-glsi \
-	tls/libnvidia-tls \
-	libvdpau libvdpau_nvidia \
-	libnvidia-ml
+	$(NVIDIA_DRIVER_LIBS_GL) \
+	$(NVIDIA_DRIVER_LIBS_EGL) \
+	$(NVIDIA_DRIVER_LIBS_GLES) \
+	$(NVIDIA_DRIVER_LIBS_MISC) \
 
 # Install the gl.pc file
 define NVIDIA_DRIVER_INSTALL_GL_DEV
@@ -54,110 +85,91 @@ endef
 # on using those libraries (e.g. if the user has such an agreement, or
 # wants to run a third-party program developped under such an agreement).
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
-NVIDIA_DRIVER_LIBS += libnvidia-ifr libnvidia-fbc
+NVIDIA_DRIVER_LIBS += \
+	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
 endif
 
 # We refer to the destination path; the origin file has no directory component
-NVIDIA_DRIVER_X_MODS = drivers/nvidia_drv.so \
+NVIDIA_DRIVER_X_MODS = \
+	drivers/nvidia_drv.so \
 	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
 
 endif # X drivers
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
-NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
+NVIDIA_DRIVER_LIBS += \
+	libcuda.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
 NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
-NVIDIA_DRIVER_LIBS_NO_VERSION += libOpenCL.so.1.0.0
-NVIDIA_DRIVER_LIBS += libnvidia-opencl
+NVIDIA_DRIVER_LIBS += \
+	libOpenCL.so.1.0.0 \
+	libnvidia-opencl.so.$(NVIDIA_DRIVER_VERSION)
+endif
+
+# Build and install the kernel modules if needed
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
+
+NVIDIA_DRIVER_MODULES = nvidia nvidia-modeset nvidia-drm
+ifeq ($(BR2_x86_64),y)
+NVIDIA_DRIVER_MODULES += nvidia-uvm
 endif
 
+# They can't do everything like everyone. They need those variables,
+# because they don't recognise the usual variables set by the kernel
+# build system. We also need to tell them what modules to build.
+NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
+	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
+	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
+	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
+
+NVIDIA_DRIVER_MODULE_SUBDIRS = kernel
+
+$(eval $(kernel-module))
+
+endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
+
 # The downloaded archive is in fact an auto-extract script. So, it can run
 # virtually everywhere, and it is fine enough to provide useful options.
 # Except it can't extract into an existing (even empty) directory.
 define NVIDIA_DRIVER_EXTRACT_CMDS
 	$(SHELL) $(DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target \
 		$(@D)/tmp-extract
+	chmod u+w -R $(@D)
 	mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
 	rm -rf $(@D)/tmp-extract
 endef
 
-# Build and install the kernel modules if needed
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
-
-NVIDIA_DRIVER_DEPENDENCIES += linux
-
-# NVidia uses the legacy naming scheme for the x86 architecture, when i386
-# and x86_64 were still considered two separate architectures in the Linux
-# kernel.
-NVIDIA_DRIVER_ARCH = $(if $(BR2_i386),i386,$(BR2_ARCH))
-
-NVIDIA_DRIVER_MOD_DIRS = kernel
-NVIDIA_DRIVER_MOD_FILES = kernel/nvidia.ko
-# nvidia-uvm.ko only available for x86_64
-ifeq ($(BR2_x86_64)$(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),yy)
-NVIDIA_DRIVER_MOD_DIRS += kernel/uvm
-NVIDIA_DRIVER_MOD_FILES += kernel/uvm/nvidia-uvm.ko
-endif
-
-# We can not use '$(MAKE) -C $(@D)/$${dir}' because NVidia's uses its own
-# Makefile to build a kernel module, which includes a lot of assumptions
-# on where to find its own sub-Makefile fragments, and fails if make is
-# not run from the directory where the module's source files are. Hence
-# our little trick to cd in there first.
-# That's also the reason why we do not use LINUX_MAKE_FLAGS or the other
-# linux-specific variables, since NVidia's Makefile does not understand
-# them.
-define NVIDIA_DRIVER_BUILD_CMDS
-	for dir in $(NVIDIA_DRIVER_MOD_DIRS); do \
-		(cd $(@D)/$${dir} && \
-		  $(MAKE) SYSSRC="$(LINUX_DIR)" SYSOUT="$(LINUX_DIR)" \
-				CC="$(TARGET_CC)" LD="$(TARGET_LD)" HOSTCC="$(HOSTCC)" \
-				ARCH=$(NVIDIA_DRIVER_ARCH) module) || exit 1; \
-	done
-endef
-
-# We do not use module-install because NVidia's Makefile requires root.
-# Also, we do not install it in the expected location (in nvidia/ rather
-# than in kernel/drivers/video/)
-define NVIDIA_DRIVER_INSTALL_KERNEL_MODULE
-	for mod in $(NVIDIA_DRIVER_MOD_FILES); do \
-		$(INSTALL) -D -m 0644 $(@D)/$${mod} \
-			$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/nvidia/$${mod##*/} \
-		|| exit 1; \
-	done
-	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
-endef
-
-endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
-
 # Helper to install libraries
 # $1: destination directory (target or staging)
 #
-# For all libraries that need it, we append the NVidia version string.
-# Then for all libraries, we install them and create a symlink using
-# their SONAME, so we can link to them at runtime; we also create the
-# no-version symlink, so we can link to them at build time.
+# For all libraries, we install them and create a symlink using
+# their SONAME, so we can link to them at runtime; we also create
+# the no-version symlink, so we can link to them at build time.
 define NVIDIA_DRIVER_INSTALL_LIBS
-	for libpath in $(addsuffix .so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
-		$(NVIDIA_DRIVER_LIBS_NO_VERSION); \
-	do \
-		libname="$${libpath##*/}"; \
-		$(INSTALL) -D -m 0644 $(@D)/$${libpath} $(1)/usr/lib/$${libname}; \
-		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$${libpath}" \
+	$(foreach lib,$(NVIDIA_DRIVER_LIBS),\
+		$(INSTALL) -D -m 0644 $(@D)/$(lib) $(1)/usr/lib/$(notdir $(lib))
+		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(lib)" \
 		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
-		if [ -n "$${libsoname}" -a "$${libsoname}" != "$${libname}" ]; then \
-			ln -sf $${libname} $(1)/usr/lib/$${libsoname}; \
-		fi; \
-		baseso="$${libname/.so*}.so"; \
-		if [ -n "$${baseso}" -a "$${baseso}" != "$${libname}" ]; then \
-			ln -sf $${libname} $(1)/usr/lib/$${baseso}; \
-		fi; \
-	done
+		if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(lib))" ]; then \
+			ln -sf $(notdir $(lib)) \
+				$(1)/usr/lib/$${libsoname}; \
+		fi
+		baseso=$(firstword $(subst .,$(space),$(notdir $(lib)))).so; \
+		if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(lib))" ]; then \
+			ln -sf $(notdir $(lib)) $(1)/usr/lib/$${baseso}; \
+		fi
+	)
 endef
 
 # For staging, install libraries and development files
@@ -169,14 +181,14 @@ endef
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
-	for m in $(NVIDIA_DRIVER_X_MODS); do \
-		$(INSTALL) -D -m 0644 $(@D)/$${m##*/} \
-			$(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
-	done
-	for p in $(NVIDIA_DRIVER_PROGS); do \
-		$(INSTALL) -D -m 0755 $(@D)/$${p} \
-			$(TARGET_DIR)/usr/bin/$${p}; \
-	done
+	$(foreach m,$(NVIDIA_DRIVER_X_MODS), \
+		$(INSTALL) -D -m 0644 $(@D)/$(notdir $(m)) \
+			$(TARGET_DIR)/usr/lib/xorg/modules/$(m)
+	)
+	$(foreach p,$(NVIDIA_DRIVER_PROGS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(p) \
+			$(TARGET_DIR)/usr/bin/$(p)
+	)
 	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
