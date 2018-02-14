From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:50:51 +0100
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
Message-ID: <20180214225051.1a942a26@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

On Fri,  2 Feb 2018 17:55:26 +0300, Evgeniy Didin wrote:


> diff --git a/package/x11r7/xdriver_xf86-video-armada/Config.in b/package/x11r7/xdriver_xf86-video-armada/Config.in
> new file mode 100644
> index 0000000000..ade8a75643
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-armada/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARMADA
> +	bool "xf86-video-armada"
> +	depends on BR2_PACKAGE_MESA3D

It would be nice to add a comment about this dependency here, because
your package doesn't itself depend on mesa3d. I assume it's because you
need GLX support in the X.org server, but it would be nice to make this
explicit.


> +XDRIVER_XF86_VIDEO_ARMADA_VERSION = 04748ff4fb30370086cc97b9487a32951c5600ba
> +XDRIVER_XF86_VIDEO_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/xf86-video-armada.git
> +XDRIVER_XF86_VIDEO_ARMADA_SITE_METHOD = git
> +XDRIVER_XF86_VIDEO_ARMADA_AUTORECONF = YES
> +XDRIVER_XF86_VIDEO_ARMADA_DEPENDENCIES = \
> +	libdrm-armada \
> +	xserver_xorg-server
> +
> +XDRIVER_XF86_VIDEO_ARMADA_LICENSE_FILES= README etna_viv/LICENSE

Space before =, and please put the LICENSE_FILES variable after the
LICENSE variable.

> +XDRIVER_XF86_VIDEO_ARMADA_LICENSE = BSD

BSD is not a license. See https://spdx.org/licenses/ for a list of
license codes.

> +#Need etna_viv source files for driver
> +define XDRIVER_XF86_VIDEO_ARMADA_ETNASRC
> +	git clone https://github.com/laanwj/etna_viv.git $(@D)/etna_viv

This is not acceptable, as it completely works around the Buildroot
download infrastructure, preventing offline builds. Why do we need
this ? Why isn't the upstream version of etnaviv sufficient ?

If it's really needed, a separate package will have to be created.

> +        mkdir $(@D)/m4
> +endef
> +
> +XDRIVER_XF86_VIDEO_ARMADA_POST_PATCH_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_ETNASRC
> +
> +define XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE
> +        $(INSTALL) -m 0644 -D $(@D)/conf/xorg-sample.conf $(TARGET_DIR)/etc/X11/xorg.conf
> +endef
> +
> +XDRIVER_XF86_VIDEO_ARMADA_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE
> +
> +
> +XDRIVER_XF86_VIDEO_ARMADA_CONF_OPTS = \
> +  --prefix=/usr --disable-vivante --disable-etnaviv \

--prefix=/usr is already passed by the autotools-package
infrastructure. Why do you disable vivante and etnaviv ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
