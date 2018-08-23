From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 12:11:52 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: vulkan with x11 needs dri3
In-Reply-To: <20180823090827.4003-1-yann.morin.1998@free.fr>
References: <20180823090827.4003-1-yann.morin.1998@free.fr>
Message-ID: <20180823121152.30d51975@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thu, 23 Aug 2018 11:08:27 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/356/35653fc6f57dc169a8aae6baedb1acd1049b50ec/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Romain Naour <romain.naour@gmail.com>

I was about to apply, but something caught my eye.


> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	--without-dri-drivers --disable-dri3

This change makes sure that when BR2_PACKAGE_MESA3D_VULKAN_DRIVER=y, we
no longer pass --disable-dri3, because we indeed what DRI3 to be
enabled for the Intel Vulkan driver to build.

However, as a side-effect, it is also going to cause
--without-dri-drivers to no longer be passed, even though we are
possibly not building any DRI driver (ie BR2_PACKAGE_MESA3D_DRI_DRIVER
may be disabled).

Doesn't this requires a bit more rework to be clean ?

Perhaps we need to separate the handling of enable-dri3/disable-dri3
from the with-dri-drivers/without-dri-drivers ?

Side question: the error message "ANV Vulkan driver requires DRI3 when
built with X11" implies that the Intel Vulkan driver can be built
without X11, while in Buildroot we require X11 to build the Intel
Vulkan driver. Note: this is unrelated to the build failure, and could
be improved as a separate patch, but is definitely not mandatory to
fix. It's just something I noticed while looking at this issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
