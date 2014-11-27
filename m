From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:38:42 +0100
Subject: [Buildroot] [PATCH 2/4] gpu-amd-bin-mx51: new package
In-Reply-To: <1415375874-17331-3-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
 <1415375874-17331-3-git-send-email-jezz@sysmic.org>
Message-ID: <20141127223842.03d65875@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  7 Nov 2014 16:57:52 +0100, J?r?me Pouiller wrote:

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 71b7f0b..6ed99fe 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -47,6 +47,7 @@ source "package/freescale-imx/imx-vpu/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
>  if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
>  source "package/freescale-imx/libz160/Config.in"
> +source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"

So despite the name "mx51", this package also applies to i.MX53 ? If
so, then it would be good to mention it somewhere (at least in the
commit log).

>  endif
>  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
> diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
> new file mode 100644
> index 0000000..86038b8
> --- /dev/null
> +++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
> @@ -0,0 +1,54 @@
> +comment "gpu-amd-bin-mx51 needs an (e)glibc toolchain w/ C++"
> +	depends on BR2_arm
> +	depends on (!BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP)
> +
> +config BR2_PACKAGE_GPU_AMD_BIN_MX51
> +	bool "gpu-amd-bin-mx51"
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HAS_LIBOPENVG
> +	depends on BR2_arm # Only relevant for i.MX5

Why do we need an ARM dependency if this can already only be selected
on i.MX51 or i.MX53 ?

> diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> new file mode 100644
> index 0000000..b4f0da4
> --- /dev/null
> +++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> @@ -0,0 +1,66 @@
> +#############################################################
> +#
> +# gpu-amd-bin-mx51
> +#
> +#############################################################

Incorrect length of comment header: we want 80 # signs. And also, you
should have an empty new line between the header and the first variable
definition.

> +GPU_AMD_BIN_MX51_VERSION = 11.09.01
> +GPU_AMD_BIN_MX51_SITE = $(FREESCALE_IMX_SITE)
> +ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),y)
> +GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
> +else
> +GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
> +GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
> +	xlib_libXrender xlib_libXau xlib_libXdmcp
> +endif
> +GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
> +GPU_AMD_BIN_MX51_LICENSE = Freescale Semiconductor Software License Agreement
> +GPU_AMD_BIN_MX51_INSTALL_STAGING = YES
> +
> +# No license file is included in the archive; we could extract it from
> +# the self-extractor, but that's just too much effort.
> +# This is a legal minefield: the EULA specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
> +
> +# The archive is a shell-self-extractor of a bzipped tar. Output directory 
> +# depends of version of source.
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info.
> +define GPU_AMD_BIN_MX51_EXTRACT_CMDS
> +	(cd $(@D); \
> +		sh $(DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE) --force --auto-accept)
> +	mv $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)/* $(@D)
> +	rmdir $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)
> +endef
> +
> +define GPU_AMD_BIN_MX51_BUILD_CMDS
> +	$(SED) 's/_LINUX/__linux__/g' $(@D)/usr/include/*/*.h
> +endef

This should probably be a post-patch hook. And a comment should be
added above this to explain why it is needed. Essentially a good rule
of thumb is that anything non-obvious should have a comment explaining
why we're doing this non-obvious thing.

> +
> +# eglplatform_1.4.h contains X11 compatible headers
> +ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),)

So, what about using instead:

ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11),y)

> +define GPU_AMD_BIN_MX51_FIXUP_EGL_HEADERS
> +	rm $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> +	mv $(STAGING_DIR)/usr/include/EGL/eglplatform_1.4.h $(STAGING_DIR)/usr/include/EGL/eglplatform.h

Why rm + mv, and not such mv ?

> +endef
> +endif
> +
> +define GPU_AMD_BIN_MX51_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d $(STAGING_DIR)/usr/lib/pkgconfig
> +	$(INSTALL) -m 644 package/freescale-imx/gpu-amd-bin-mx51/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
> +	$(INSTALL) -m 644 $(@D)/usr/lib/lib* $(STAGING_DIR)/usr/lib/
> +	cp -r $(@D)/usr/include/* $(STAGING_DIR)/usr/include
> +	$(GPU_AMD_BIN_MX51_FIXUP_EGL_HEADERS)
> +endef
> +
> +define GPU_AMD_BIN_MX51_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 $(@D)/usr/lib/lib*so* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +define GPU_AMD_BIN_MX51_DEVICES
> +	/dev/gsl_kmod c 640 0 0 249 0 1 4
> +endef
> +
> +$(eval $(generic-package))

The rest looks OK to me, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
