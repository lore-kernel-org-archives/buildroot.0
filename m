From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 00:02:22 +0100
Subject: [Buildroot] [PATCH v2 2/7] package/freescale-imx/imx-dpu-g2d:
 new package imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series
 instead of imx-vpu or imx-vpu-hantro.With this commit,
 imx-dpu-g2d is added and is enabled for i.MX 8X.
In-Reply-To: <20200203193155.12657-2-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-2-tuzakli.refik@gmail.com>
Message-ID: <20200204000222.69809107@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Refik,

I was about to apply after fixing a few things, but there is one issue
that I can't really resolve by myself without asking some questions. So
while at it, I'll do the various comments.

First, the commit log is not good, you should have an empty line after
the commit title (package/freescale-imx/imx-dpu-g2d: new package),
otherwise everything goes into the commit title.

On Mon,  3 Feb 2020 22:31:50 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> ---
>  package/freescale-imx/Config.in               |  7 ++++
>  package/freescale-imx/imx-dpu-g2d/Config.in   | 23 ++++++++++++
>  .../imx-dpu-g2d/imx-dpu-g2d.hash              |  5 +++
>  .../freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk  | 37 +++++++++++++++++++
>  4 files changed, 72 insertions(+)

Please add an entry in the DEVELOPERS file.

>  if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
> diff --git a/package/freescale-imx/imx-dpu-g2d/Config.in b/package/freescale-imx/imx-dpu-g2d/Config.in
> new file mode 100644
> index 0000000000..2675840093
> --- /dev/null
> +++ b/package/freescale-imx/imx-dpu-g2d/Config.in
> @@ -0,0 +1,23 @@
> +comment "imx-dpu-g2d needs a glibc toolchain"
> +	depends on BR2_aarch64
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_IMX_DPU_G2D
> +	bool "imx-dpu-g2d"
> +	# Library binaries are linked against libc.so.6
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_IMX_GPU_VIV

So this is the problem. What makes you think this needs imx-gpu-viv ?
When I run readelf -d on the only library installed by this package, I
see this:

$ readelf -d libg2d-dpu.so 

Dynamic section at offset 0xadc8 contains 26 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000000e (SONAME)             Library soname: [libg2d.so.1.1]

So it means that it needs libc.so.6 (so we need glibc) and libdrm.so.2.
And libdrm.so.2 is not installed by imx-gpu-viv. So it seems like it
doesn't need imx-gpu-viv, but instead another package that provides
libdrm.so.2 (probably libdrm, but please check).

> +IMX_DPU_G2D_VERSION = 1.8.2
> +IMX_DPU_G2D_SITE = $(FREESCALE_IMX_SITE)
> +IMX_DPU_G2D_SOURCE = imx-dpu-g2d-$(IMX_DPU_G2D_VERSION).bin
> +IMX_DPU_G2D_DEPENDENCIES = imx-gpu-viv

So that would have to be changed.

> +IMX_DPU_G2D_INSTALL_STAGING = YES
> +
> +IMX_DPU_G2D_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_DPU_G2D_LICENSE_FILES = EULA COPYING
> +IMX_DPU_G2D_REDISTRIBUTE = NO
> +
> +define IMX_DPU_G2D_EXTRACT_CMDS
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_DPU_G2D_DL_DIR)/$(IMX_DPU_G2D_SOURCE))
> +endef
> +
> +define IMX_DPU_G2D_INSTALL_STAGING_CMDS
> +	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr

We normally use

	cp -dpfr

instead of cp -a.

> +endef
> +
> +ifeq ($(BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES),y)
> +define IMX_DPU_G2D_INSTALL_EXAMPLES
> +	mkdir -p $(TARGET_DIR)/usr/share/examples/
> +	cp -a $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
> +endef
> +endif
> +
> +define IMX_DPU_G2D_INSTALL_TARGET_CMDS
> +	$(IMX_DPU_G2D_INSTALL_EXAMPLES)
> +	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr

Please use:

	cp -dpfr $(@D)/g2d/usr/lib/* $(TARGET_DIR)/usr/lib/

instead.

Could you fix the above issues, and resend ? The
imx-gpu-viv/libdrm.so.2 issue is the most important one.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
