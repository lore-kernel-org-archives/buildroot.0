From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 22:46:00 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/nodejs: use shared libuv
In-Reply-To: <1500378343-22978-3-git-send-email-martin@barkynet.com>
References: <1500378343-22978-1-git-send-email-martin@barkynet.com>
 <1500378343-22978-3-git-send-email-martin@barkynet.com>
Message-ID: <20170719224600.6edd899e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 12:45:43 +0100, Martin Bark wrote:

> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index f02b9a7..d3cb006 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -5,15 +5,17 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
>  	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
>  
> -comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
> +comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>  		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_NODEJS
>  	bool "nodejs"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv

BR2_TOOLCHAIN_HAS_SYNC_4 really is an architecture dependency (we don't
show a Config.in comment for it), so I've moved it under
BR2_PACKAGE_NODEJS_ARCH_SUPPORTS, so it doesn't have to be duplicated.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
