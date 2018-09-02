From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 22:51:52 +0200
Subject: [Buildroot] [for-next: 2/2] dependencies: host-make version
 check
In-Reply-To: <20180830203054.7373-2-romain.naour@gmail.com>
References: <20180830203054.7373-1-romain.naour@gmail.com>
 <20180830203054.7373-2-romain.naour@gmail.com>
Message-ID: <20180902225152.3e9a6c1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 22:30:54 +0200, Romain Naour wrote:

> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 399cf395ce..fd9e394f92 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -28,7 +28,8 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
>  # Before glibc is configured, we must have the first stage
>  # cross-compiler and the kernel headers
> -GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk
> +GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
> +	$(BR2_MAKE_HOST_DEPENDENCY)

As discussed on IRC, this is not sufficient, because you need to set
GLIBC_MAKE to the correct value, otherwise package/pkg-autotools.mk
uses $(MAKE), which points to /usr/bin/make.

Due to this, the make built by Buildroot is in fact not used.

Also, perhaps you could split this patch into to: one patch adding the
support/dependencies/ logic, and another tweaking the glibc package.

Could you look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
