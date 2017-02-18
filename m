From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Feb 2017 16:05:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/sunxi-mali: remove sunxi-mali
 r2p4 kernel module
In-Reply-To: <20170218145258.10213-2-romain.naour@gmail.com>
References: <20170218145258.10213-1-romain.naour@gmail.com>
 <20170218145258.10213-2-romain.naour@gmail.com>
Message-ID: <20170218150549.GF3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-02-18 15:52 +0100, Romain Naour spake thusly:
> sunxi-mali r2p4 kernel module are linked against libUMP.so.2 but libump
> package in Buildroot only provide libUMP.so.3, see [1].

OTOH, it looks like the versioning is just arbitrary:

    https://github.com/linux-sunxi/libump/commit/1c1f6337dffffe8f7aea98f710f681727ed45f4f

    We prefer version 3, as r2pX is pretty rare by now, but if needs be,
    this can be easily changed.

So maybe libump could add a legacy symlink libUMP.so.2 -> libUMP.so.3 ?

Regards,
Yann E. MORIN.

>  ./r2p4/armhf/x11/libGLESv2.so.2.0
>  ./r2p4/armhf/x11/libMali.so
> - 0x00000001 (NEEDED)                     Shared library: [libUMP.so]
> + 0x00000001 (NEEDED)                     Shared library: [libUMP.so.2]
>  ./r2p4/armhf/x11/libGLESv1_CM.so.1.1
>  ./r2p4/armhf/x11/libEGL.so.1.4
>   0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
>   0x00000001 (NEEDED)                     Shared library: [libdrm.so.2]
>   0x00000001 (NEEDED)                     Shared library: [libXfixes.so.3]
>   0x00000001 (NEEDED)                     Shared library: [libXext.so.6]
>  ./r2p4/armel/framebuffer/libGLESv2.so
>  ./r2p4/armel/framebuffer/libMali.so
> - 0x00000001 (NEEDED)                     Shared library: [libUMP.so]
> + 0x00000001 (NEEDED)                     Shared library: [libUMP.so.2]
>  ./r2p4/armel/framebuffer/libGLESv1_CM.so
>  ./r2p4/armel/framebuffer/libEGL.so
> 
> So any program or library trying to link with -lGLESv2 will fail with
> the following error:
> 
> arm-none-linux-gnueabi/bin/ld: warning: libUMP.so.2, needed by
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so,
> not found (try using -rpath or -rpath-link)
> 
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_close'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_mapped_pointer_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_secure_id_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_mapped_pointer_release'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
> undefined reference to `ump_reference_add'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
> undefined reference to `ump_size_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_reference_release'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_open'
> collect2: error: ld returned 1 exit status
> 
> Since nothing provide libUMP.so.2, remove BR2_PACKAGE_SUNXI_MALI_R2P4
> option and add BR2_ARM_EABIHF dependency directly to sunxi-mali
> package.
> 
> Also the defconfig olimex_a20_olinuxino_lime_mali_defconfig maintained
> by Francois Perrad, is an ARM EABIHF system.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8d0/8d0b78798abf0c4ca124952d0d0455da6f8fa14f/
> 
> [1] https://github.com/linux-sunxi/sunxi-mali-proprietary/commit/1c5063f43cdc9de341c0d63b2e3921cab86c7742
> [2] http://lists.busybox.net/pipermail/buildroot/2017-February/183500.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in.legacy                 |  8 ++++++++
>  package/sunxi-mali/Config.in     | 23 ++++++-----------------
>  package/sunxi-mali/sunxi-mali.mk |  3 ---
>  3 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 20445b8..f9319b4 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,14 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.02"
>  
> +config BR2_PACKAGE_SUNXI_MALI_R2P4
> +	bool "sunxi-mali r2p4 removed"
> +	select BR2_LEGACY
> +	help
> +	  sunxi-mali r2p4 has been removed since libump package only
> +	  provide libUMP.so.3 for r3p0 and r3p1 mali kernel module.
> +	  r2p4 for ARM EABI systems require libUMP.so.2.
> +
>  config BR2_PACKAGE_PERL_DB_FILE
>  	bool "perl-db-file removed"
>  	select BR2_LEGACY
> diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
> index c6754c2..951007a 100644
> --- a/package/sunxi-mali/Config.in
> +++ b/package/sunxi-mali/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_SUNXI_MALI
>  	bool "sunxi-mali"
>  	depends on BR2_arm
> +	# libump package only provide libUMP.so.3 for r3p0 and r3p1
> +	# mali kernel module. r2p4 for ARM EABI systems require
> +	# libUMP.so.2.
> +	depends on BR2_ARM_EABIHF # libUMP.so.3 only
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
> @@ -36,31 +40,16 @@ choice
>  	  appropriate version number is r3p0. For other kernels, use the maliver
>  	  application to determine the appropriate version.
>  
> -config BR2_PACKAGE_SUNXI_MALI_R2P4
> -	bool "r2p4"
> -	depends on BR2_ARM_EABI
> -
> -comment "r2p4 requires an EABI toolchain"
> -	depends on !BR2_ARM_EABI
> -
>  config BR2_PACKAGE_SUNXI_MALI_R3P0
>  	bool "r3p0"
> -	depends on BR2_ARM_EABIHF
> -
> -comment "r3p0 requires an EABIhf toolchain"
> -	depends on !BR2_ARM_EABIHF
>  
>  config BR2_PACKAGE_SUNXI_MALI_R3P1
> -	depends on BR2_ARM_EABIHF
>  	bool "r3p1"
>  
> -comment "r3p1 requires an EABIhf toolchain"
> -	depends on !BR2_ARM_EABIHF
> -
>  endchoice
>  
>  endif
>  
> -comment "sunxi-mali needs a glibc toolchain"
> +comment "sunxi-mali needs a glibc toolchain w/ armhf enabled"
>  	depends on BR2_arm
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
> diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
> index c808db6..c9ab18c 100644
> --- a/package/sunxi-mali/sunxi-mali.mk
> +++ b/package/sunxi-mali/sunxi-mali.mk
> @@ -36,9 +36,6 @@ endif
>  
>  SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
>  
> -ifeq ($(BR2_PACKAGE_SUNXI_MALI_R2P4),y)
> -SUNXI_MALI_MAKE_OPTS += VERSION=r2p4
> -endif
>  ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
>  SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
>  endif
> -- 
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
