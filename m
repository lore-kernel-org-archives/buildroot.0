From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 18:59:14 +0200
Subject: [Buildroot] [PATCH 2/3 v2] package/nvidia-driver: add NVidia's
 OpenGL binary blob
In-Reply-To: <07a540e8ae21ae3aa8082c0031c2a204343e891b.1411334346.git.yann.morin.1998@free.fr>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
 <07a540e8ae21ae3aa8082c0031c2a204343e891b.1411334346.git.yann.morin.1998@free.fr>
Message-ID: <20141005185914.661f0c3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Sep 2014 23:22:55 +0200, Yann E. MORIN wrote:

> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> new file mode 100644
> index 0000000..becb1ae
> --- /dev/null
> +++ b/package/nvidia-driver/Config.in
> @@ -0,0 +1,64 @@
> +# Note: we only require 'threads', although that might well be NPTL.
> +# But we require (e)glibc, which nowadays only has NPTL anyway.
> +comment "nvidia-driver needs an (e)glibc toolchain w/ threads"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_PACKAGE_NVIDIA_DRIVER_arm_OK
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS

Is it possible to have a glibc toolchain without thread support?

> +
> +# Nividia has an ARM driver, but it's only little-endian,
> +# armv7 and gnueabihf
> +config BR2_PACKAGE_NVIDIA_DRIVER_arm_OK

Capital letters for the entire option.

> +	bool
> +	default y
> +	depends on BR2_arm
> +	depends on BR2_ARM_EABIHF
> +	depends on BR2_cortex_a5 || BR2_cortex_a7 || BR2_cortex_a8 \
> +		|| BR2_cortex_a9 || BR2_cortex_a12 || BR2_cortex_a15 \
> +		|| BR2_pj4

However, I'm wondering if we should use the more traditional
BR2_PACKAGE_NVIDIA_DRIVER_ARCH_SUPPORTS logic. Something like:

config BR2_PACKAGE_NVIDIA_DRIVER_ARCH_SUPPORTS
	bool
	default y if BR2_i386
	default y if BR2_x86_64
	default y if (BR2_arm && BR2_ARM_EABIHF && \
		(BR2_cortex_a5 || BR2_cortex_a7 || ...)

Maybe it's time to introduce some kconfig booleans such as
BR2_ARM_ARMV5, BR2_ARM_ARMV6, BR2_ARM_ARMV7, because we're duplicating
this BR2_cortexa<foo> logic in  multiple places. Not related to this
patch, though.

> +
> +config BR2_PACKAGE_NVIDIA_DRIVER
> +	bool "nvidia-driver"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_PACKAGE_NVIDIA_DRIVER_arm_OK

Would become depends on BR2_PACKAGE_NVIDIA_DRIVER_ARCH_SUPPORTS.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR

Should we have a comment about this? We generally depend on just
BR2_PACKAGE_XORG7. But agree it's a bit hard to "select" the modular
server.

> +	select BR2_PACKAGE_OPENGL_REGISTRY
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	help
> +	  The binary-only driver blob for NVidia cards.
> +	  This is the userland part only.
> +
> +	  http://www.nvidia.com/
> +
> +if BR2_PACKAGE_NVIDIA_DRIVER
> +
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "nvidia-driver"
> +
> +config BR2_PACKAGE_PROVIDES_LIBEGL
> +	default "nvidia-driver"
> +
> +config BR2_PACKAGE_PROVIDES_LIBGLES
> +	default "nvidia-driver"
> +
> +config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
> +	bool "CUDA support"
> +
> +config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
> +	bool "OpenCL support"
> +	depends on BR2_PACKAGE_NVIDIA_DRIVER_CUDA
> +
> +config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
> +	bool "Install private libraries"
> +	help
> +	  Two libraries require special agreement with NVidia to develop code
> +	  linking to those libraries: libnvidia-ifr.so and libnvidia-fbc.so
> +	  (to grab and encode an OpenGL buffer or an X framebuffer.)
> +
> +	  Say 'y' here if you plan on running a program that uses those
> +	  private libraries.
> +
> +endif # BR2_PACKAGE_NVIDIA_DRIVER
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> new file mode 100644
> index 0000000..efe3fa0
> --- /dev/null
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -0,0 +1,92 @@
> +################################################################################
> +#
> +# nvidia-driver
> +#
> +################################################################################
> +
> +NVIDIA_DRIVER_VERSION = 340.32
> +NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> +NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run

Hum, and this works for ARM ? the 'x86' part of the filename would
indicate not, but I haven't checked.

> +NVIDIA_DRIVER_LICENSE = NVIDIA Software License
> +NVIDIA_DRIVER_LICENSE_FILES = LICENSE
> +NVIDIA_DRIVER_REDISTRIBUTE = NO
> +NVIDIA_DRIVER_INSTALL_STAGING = YES
> +
> +NVIDIA_DRIVER_DEPENDENCIES = opengl-registry xlib_libX11 xlib_libXext
> +NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
> +
> +NVIDIA_DRIVER_LIBS_NO_VERSION =

Not really needed, variables are empty by default.

> +NVIDIA_DRIVER_LIBS = libEGL libGLESv1_CM libGLESv2 libGL \
> +		       libnvidia-glcore libnvidia-eglcore libnvidia-glsi \
> +		       tls/libnvidia-tls \
> +		       libvdpau libvdpau_nvidia \
> +		       libnvidia-ml

Only one tab for the indentation on continuation lines.

> +
> +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
> +NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
> +NVIDIA_DRIVER_LIBS_NO_VERSION += libOpenCL.so.1.0.0

What is special about this one to be marked "NO_VERSION" ?

> +NVIDIA_DRIVER_LIBS += libnvidia-opencl
> +endif
> +
> +# Those libraries are 'private' libraries requiring an agreement with
> +# NVidia to develop code for those libs. There seems to be no restriction
> +# on using those libraries (e.g. if the user has such an agreement, or
> +# wants to run a third-party program developped under such an agreement).
> +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
> +NVIDIA_DRIVER_LIBS += libnvidia-ifr libnvidia-fbc
> +endif
> +
> +# We refer to the destination path; the origin file has no directory component
> +NVIDIA_DRIVER_X_MODS = drivers/nvidia_drv.so \
> +			 extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
> +			 libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)

Ditto.

> +
> +# The downloaded archive is in fact an auto-extract script. So, it can run
> +# virtually everywhere, and it is fine enough to provide useful options.
> +# Except it can't extract into an existing (even empty) directory.
> +define NVIDIA_DRIVER_EXTRACT_CMDS
> +	$(SHELL) $(DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target $(@D)/foo
> +	mv $(@D)/foo/* $(@D)/foo/.manifest $(@D)
> +	rm -rf $(@D)/foo

Is 'foo' the right temporary name ? :-)

> +endef
> +
> +# Helper to install libraries
> +# $1: destination directory (target or staging)
> +define NVIDIA_DRIVER_INSTALL_LIBS
> +	for lib in $(patsubst %,%.so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
> +	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
> +	do \
> +		$(INSTALL) -v -D -m 0644 $(@D)/$${lib} $(1)/usr/lib/$${lib##*/}; \
> +		n="$$( $(TARGET_READELF) -d "$(@D)/$${lib}" \
> +		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
> +		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
> +			ln -sfv $${lib##*/} $(1)/usr/lib/$${n}; \
> +		fi; \
> +		n="$${lib##*/}"; n="$${n/.so*}.so"; \
> +		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
> +			ln -sfv $${lib##*/} $(1)/usr/lib/$${n}; \
> +		fi; \
> +	done

Wow. This is a *lot* of $ and # signs. Do we really need to do all that
stuff, looking at the SONAME and so on?

At the very least, some comments would be good to have. But a simpler
solution would be even better :-)

> +endef
> +
> +# For staging, install libraries and development files
> +define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
> +	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
> +	$(INSTALL) -v -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la

Why -v ?

> +	$(SED) 's/-L[^[:space:]]\+//' $(STAGING_DIR)/usr/lib/libGL.la

Do we really need to install the .la file here?

> +endef
> +
> +# For target, install libraries and X.org modules
> +define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
> +	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
> +	for m in $(NVIDIA_DRIVER_X_MODS); do \
> +		 $(INSTALL) -v -D -m 0644 $(@D)/$${m##*/} \
> +					  $(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \

Less indentation for the continuation line, and no -v option for
$(INSTALL).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
