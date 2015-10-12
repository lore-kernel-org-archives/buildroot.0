From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:43:46 +0200
Subject: [Buildroot] [PATCH] imx-gpu-viv: add G2D libs and GPU tools
 selection
In-Reply-To: <1442843116-28521-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1442843116-28521-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20151012234346.4314675c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

I've applied your patch, but did a few changes before (see below for
details).

On Mon, 21 Sep 2015 15:45:16 +0200, Gary Bisson wrote:

> +config BR2_PACKAGE_IMX_GPU_VIV_APITRACE
> +	bool "install apitrace tools"
> +	# runtime dependency

Indicating "runtime dependency" here is useless. This is only useful if
you depend on another package that you "select" from a Config.in point
of view, but that you don't need to have in the <pkg>_DEPENDENCIES.

Here, you're selecting a Config.in symbol from the same package, so
indicating "runtime dependency" is not needed.


> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index aa1e3b6..57d61f2 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -62,9 +62,16 @@ define IMX_GPU_VIV_FIXUP_FB_HEADERS
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_G2D),y)
> +define IMX_GPU_VIV_INSTALL_G2D_STAGING
> +	cp -r $(@D)/g2d/usr/* $(STAGING_DIR)/usr

I didn't really like these installation logic that installs "all"
directories, and I've replaced with the more explicit:

+       cp -dpfr $(@D)/g2d/usr/include/* $(STAGING_DIR)/usr/include/
+       cp -dpfr $(@D)/g2d/usr/lib/* $(STAGING_DIR)/usr/lib/

Note that I have also changed the 'cp -r' and 'cp -a' to 'cp -dpfr'
which is the idiomatic way in Buildroot of doing a recursive copy that
preserve symlinks and al.

See
http://git.buildroot.net/buildroot/commit/?id=f640a6659f6c5f9c99684a98de006bbccfded128
for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
