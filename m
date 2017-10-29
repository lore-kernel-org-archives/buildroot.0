From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 20:57:07 +0100
Subject: [Buildroot] [PATCH] lvm2: make basic package available under
 musl
In-Reply-To: <20171027114716.29198-1-peter@korsgaard.com>
References: <20171027114716.29198-1-peter@korsgaard.com>
Message-ID: <20171029205707.4f82a902@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Oct 2017 13:47:16 +0200, Peter Korsgaard wrote:

>  config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>  	bool "standard install instead of only dmsetup"
> +	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
>  	help
>  	  Install the standard suite of lvm2 programs. When this option
> @@ -34,10 +34,15 @@ config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>  
>  config BR2_PACKAGE_LVM2_APP_LIBRARY
>  	bool "install application library"
> +	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
>  	help
>  	  Install application library (liblvm2app).
>  
> +comment "lvm2 standard install needs a glibc or uClibc toolchain"
> +	depends on BR2_TOOLCHAIN_USES_MUSL

For consistency, I've moved this comment below the "standard install"
option, and added another comment for the "application library" option.

> +
>  endif
>  
>  comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"

You had forgotten to update this comment: lvm2 no longer needs glibc or
uClibc, and you also had forgotten to drop the BR2_TOOLCHAIN_USES_MUSL
part of this comment dependencies.

Applied with those nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
