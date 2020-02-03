From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 11:26:02 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/kodi: add optional support
 for wayland
In-Reply-To: <20200202173333.305860-2-bernd.kuhls@t-online.de>
References: <20200202173333.305860-1-bernd.kuhls@t-online.de>
 <20200202173333.305860-2-bernd.kuhls@t-online.de>
Message-ID: <20200203112602.47e97cc6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Feb 2020 18:33:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> For details see upstream PR 12664.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied, with a few changes, see below.

> +config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
> +	bool
> +	default y

I've added a

	depends on BR2_PACKAGE_HAS_LIBGL

cause you then depend on "libgl".

> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
> +	depends on BR2_PACKAGE_WAYLAND # waylandpp
> +	select BR2_PACKAGE_WAYLANDPP

You should not add such selects to blind options that are "default y".
Indeed here, waylandpp is going to be selected as soon as all the
dependencies of this option are met, regardless of whether you really
enable Kodi's Wayland backend.

So I moved the select to BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL.

> +config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
> +	depends on BR2_PACKAGE_WAYLAND # waylandpp
> +	select BR2_PACKAGE_WAYLANDPP

Ditto here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
