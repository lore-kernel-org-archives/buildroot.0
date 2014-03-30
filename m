From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 15:11:09 +0200
Subject: [Buildroot] [PATCH 1/1 v2] xdriver_xf86-video-intel: Bump
 version to 2.99.911
In-Reply-To: <1396178545-12912-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396178545-12912-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140330151109.658eb835@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 30 Mar 2014 13:22:25 +0200, Bernd Kuhls wrote:

> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.911
>  XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
>  XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
> -XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
> +
> +# this fixes a getline-related compilation in src/sna/kgem.c
> +XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
>  XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
> -	--enable-dri \
> -	--enable-kms-only \
>  	--disable-xvmc \
> -	--disable-ums-only \

Do we want KMS vs. UMS to be a configurable option?

> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965),y)
> +XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += \
> +	--enable-dri
> +XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES += mesa3d

Then in the Config.in file, if BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is
enabled, you want to select MESA3D.

Also, in the Config.in file, you select select
BR2_PACKAGE_XPROTO_XF86DRIPROTO, but this package isn't listed in
XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES as far as I can see.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
