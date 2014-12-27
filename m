From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:43:25 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
 package
In-Reply-To: <1418132813-32642-8-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-8-git-send-email-jezz@sysmic.org>
Message-ID: <20141227214325.2135108d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:45 +0100, J?r?me Pouiller wrote:

> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> new file mode 100644
> index 0000000..d91ba79
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> @@ -0,0 +1,31 @@
> +

Unneeded empty line.

> +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
> +	bool "xf86-video-imx-viv"
> +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> +	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER

The world of OpenGL stuff will always surprise me. Why on earth does a
X.org driver that uses a proprietary OpenGL implementation needs
Mesa3D ?!?

> +	  Notice EGL and GLes2 APIs are correctly supported. This driver should
> +	  also be able to provide Desktop OpenGL implementation but, this 
> +	  feature seems broken for a while.

"for a while" -> "since quite some time".

> +	  Don't forget to load galcore.ko and create /dev/galcore before to
> +	  use this driver (else, Xorg will exit with an obscur message

"to use" -> using.

obscur -> obscure.

> +	  like "Segmentation fault at address 0xc").
> +
> +comment "xf86-video-imx-viv depends on gpu-viv-bin-mx6q with X11 output"
> +	depends on BR2_arm
> +	depends on (!BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11)

Unneeded parenthesis.

> +XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
> +XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/EXA/src -f makefile.linux
> +
> +define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
> +	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
> +		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
> +		CFLAGS+="$(TARGET_CFLAGS) -I$(@D)/DRI_1.10.4/src"

Why += here? I don't think it has any effect.

Also, can you add _LICENSE and _LICENSE_FILES information?

Care to fixup those minor issues and resend?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
