From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 14:24:02 +0200
Subject: [Buildroot] [PATCH 3/3] package/mesa3d: add support for Intel
 Vulkan driver
In-Reply-To: <1468145355-11597-3-git-send-email-bernd.kuhls@t-online.de>
References: <1468145355-11597-1-git-send-email-bernd.kuhls@t-online.de>
 <1468145355-11597-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160716142402.1920be05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch, it looks mostly good, with one exception, see
below.

On Sun, 10 Jul 2016 12:09:15 +0200, Bernd Kuhls wrote:

> +comment "Vulkan drivers"
> +
> +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> +	bool "Vulkan Intel driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> +	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> +	select BR2_PACKAGE_XPROTO_DRI3PROTO

You are selecting BR2_PACKAGE_XPROTO_DRI3PROTO, but you have no
guarantee that BR2_PACKAGE_XORG7 is enabled. So either dri3proto is
only needed if Xorg is used and you should have a "if
BR2_PACKAGE_XORG7", or dri3proto is mandatory, and you need a "depends
on BR2_PACKAGE_XORG7" for this option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
