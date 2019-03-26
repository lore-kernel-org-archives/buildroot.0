From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 22:26:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/brickd: new package
In-Reply-To: <20190223010454.7335-1-david@lechnology.com>
References: <20190223010454.7335-1-david@lechnology.com>
Message-ID: <20190326222647.3f33146a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Feb 2019 19:04:53 -0600
David Lechner <david@lechnology.com> wrote:

> This adds a new package for brickd. Brickd is system management daemon
> for the LEGO MINDSTORMS EV3 programmable brick.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

I've applied, after fixing one dependency issue, see below.

> diff --git a/package/brickd/Config.in b/package/brickd/Config.in
> new file mode 100644
> index 0000000000..bd62e15122
> --- /dev/null
> +++ b/package/brickd/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_BRICKD
> +	bool "brickd"
> +	depends on BR2_PACKAGE_HAS_UDEV # gudev
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGUDEV

Both libglib2 and libgudev have a depends on BR2_USE_MMU, so it should
have been replicated here.

> +	help
> +	  Brick daemon for LEGO MINDSTORMS EV3 (and other LEGO-
> +	  compatible devices). This performs tasks like battery
> +	  management and controls device-specific hardware.
> +
> +	  https://github.com/ev3dev/brickd
> +
> +comment "brickd needs udev /dev management, a toolchain w/ threads, wchar"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR

And here.

I said, I fixed that up when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
