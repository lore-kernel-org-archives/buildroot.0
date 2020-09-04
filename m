From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 14:52:37 +0200
Subject: [Buildroot] [PATCH 1/3] package/libcamera: Prevent builds on
 m68k
In-Reply-To: <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
Message-ID: <20200904145237.0b1acf0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Sep 2020 10:51:45 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:

> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 960d78b82e95..1ea747d1c57e 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -5,6 +5,8 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
> +	# Invalid packing size of ControlValue struct on m68k
> +	depends on !BR2_m68k

Another comment: this dependency should be replicated in the Config.in
comment for libcamera, so that the comment that says "libcamera needs a
toolchain w/ ..." doesn't appear on m68k... which would be meaningless
as libcamera is not available at all for this architecture.

In general, we like to have:

config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
	config
	default y
	depends on !BR2_m68k

and then use that in BR2_PACKAGE_LIBCAMERA and the Config.in comment.
This way, if other packages select libcamera, they can also re-use this
"depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
