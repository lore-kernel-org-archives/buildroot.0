From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:46:36 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150221234636.50616706@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Nicolas,

On Tue, 10 Feb 2015 21:01:15 +0100, Yann E. MORIN wrote:

> diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
> new file mode 100644
> index 0000000..950f2f8
> --- /dev/null
> +++ b/package/nvidia-tegra23/Config.in
> @@ -0,0 +1,36 @@
> +menuconfig BR2_PACKAGE_NVIDIA_TEGRA23
> +	bool "nvidia-tegra23"
> +	depends on BR2_cortex_a9
> +	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_XORG7

Why is X.org required? Those NVidia drivers provide an EGL
implementation, so I would expect them to be usable without X.org, for
example if you want to do Qt5 over eglfs. Isn't it the case?

> +choice
> +	prompt "X11 ABI version"
> +	default BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
> +	help
> +	  Select Tegra X11 ABI version.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5
> +	bool "X11 ABI 5"
> +	help
> +	  Tegra X11 ABI 5.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6
> +	bool "X11 ABI 6"
> +	help
> +	  Tegra X11 ABI 6.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7
> +	bool "X11 ABI 7"
> +	help
> +	  Tegra X11 ABI 7.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8
> +	bool "X11 ABI 8"
> +	help
> +	  Tegra X11 ABI 8.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10
> +	bool "X11 ABI 10"
> +	help
> +	  Tegra X11 ABI 10.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
> +	bool "X11 ABI 11"
> +	help
> +	  Tegra X11 ABI 11.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12
> +	bool "X11 ABI 12"
> +	help
> +	  Tegra X11 ABI 12.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13
> +	bool "X11 ABI 13"
> +	help
> +	  Tegra X11 ABI 13.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14
> +	bool "X11 ABI 14"
> +	help
> +	  Tegra X11 ABI 14.

Is this choice really useful? In Buildroot, we only support one version
of the X.org server at a time, so only one ABI version.

And currently, we have X.org server 1.17.1, which implementation the
video driver ABI version 19. How can this work with the Tegra drivers
if they only support up to ABI version 14 ?

> +NVIDIA_TEGRA23_BINARIES_VERSION	= $(NVIDIA_TEGRA23_VERSION)

Spacing issue here.

> +NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
> +NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
> +
> +NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
> +NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
> +
> +NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
> +NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES

Last line not needed, it's the default.

> +NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
> +	xlib_libX11 xlib_libXext xlib_libXv

A comment above this explaining why even though those are not build
dependencies of nvidia-tegra23-binaries they should still be listed in
the DEPENDENCIES would be useful.

> +define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
> +	$(foreach lib,$(NVIDIA_TEGRA23_BINARIES_LIBRARIES),
> +		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/usr/lib/$(lib) \
> +			$(1)/usr/lib/$(lib); \
> +	)
> +	(cd $(1)/usr/lib; \
> +		ln -sf libGLESv2.so.2 libGLESv2.so; \
> +		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
> +		ln -sf libEGL.so.1 libEGL.so \
> +	)
> +endef
> +
> +define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
> +	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
> +	$(foreach pkgconfig,$(NVIDIA_TEGRA23_BINARIES_PKGCONFIG),
> +		$(INSTALL) -D -m 0644 package/nvidia-tegra23/nvidia-tegra23-binaries/$(pkgconfig) \
> +			$(STAGING_DIR)/usr/lib/pkgconfig/$(pkgconfig); \
> +	)

Don't we need a $(sep) here in the foreach loop?

> +endef
> +
> +define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
> +	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(TARGET_DIR))
> +	$(foreach firmware,$(NVIDIA_TEGRA23_BINARIES_FIRMWARE),
> +		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/lib/firmware/$(firmware) \
> +			$(TARGET_DIR)/lib/firmware/$(firmware); \
> +	)

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
