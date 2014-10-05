From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 20:43:38 +0200
Subject: [Buildroot] [PATCH v2] libbsd: Add missing arch
In-Reply-To: <1412533881-14025-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412533881-14025-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141005204338.28e5d9d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 20:31:21 +0200, Maxime Hadjinlian wrote:
> Match the list of architecture to the comments above.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

The commit title should maybe become "libbsd: enable on the ARM
architecture".

> ---
> v1 -> v2:
>     - Remove m68k as it is currently marked broken in BR
> ---
>  package/libbsd/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> index e22226a..b1ca6d1 100644
> --- a/package/libbsd/Config.in
> +++ b/package/libbsd/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_LIBBSD
>  	bool "libbsd"
>  	# libbsd requires a.out.h, which is only available for those
> -	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
> -	depends on ( BR2_i386 || BR2_x86_64 )
> +	# architectures: arm, x86 (and alpha, but we don't care.)
> +	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm)

I would keep the m68k in the comment for now, maybe something like:
"arm, x86 (and alpha, not supported in Buildroot, and m68k, currently
not enabled, so cannot be tested)".

Also, alphabetic ordering of architectures please.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	help
> @@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBBSD
>  	  http://libbsd.freedesktop.org/
>  
>  comment "libbsd needs an (e)glibc toolchain w/ threads"
> -	depends on ( BR2_i386 || BR2_x86_64 )
> +	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm)
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC

Since you will need to inherit the arch dependency in netcat-openbsd,
I'd suggest you use the following construction:

config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
	bool
	default y if BR2_arm || BR2_i386 || BR2_x86_64

config BR2_PACKAGE_LIBBSD
	bool "libbsd"
	...
	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS

comment "libbsd needs ..."
	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS

And then you can reuse BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS in
netcat-openbsd as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
