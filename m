From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:56:15 +0200
Subject: [Buildroot] [PATCH 3/5] webkitgtk: enable package for aarch64
In-Reply-To: <20180922235333.85642-4-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-4-aperez@igalia.com>
Message-ID: <20180925225615.509026b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Sun, 23 Sep 2018 02:53:31 +0300, Adrian Perez de Castro wrote:
> 64-bit ARM is well supported, particularly in little-endian
> configurations, where JIT can be enabled as well.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in    | 1 +
>  package/webkitgtk/webkitgtk.mk | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 96a7ab0c94..ac6f57e2ad 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	bool
>  	# ARM needs BLX, so v5t+, BE completely untested so disabled
>  	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
> +	default y if BR2_aarch64 || BR2_aarch64_be
>  	default y if BR2_i386 || BR2_x86_64
>  	# Disabled on MIPS big endian due to sigbus
>  	default y if BR2_mipsel || BR2_mips64el
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index f28417ac73..f0293fc225 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -27,9 +27,10 @@ WEBKITGTK_CONF_OPTS = \
>  	-DUSE_LIBNOTIFY=OFF \
>  	-DUSE_LIBHYPHEN=OFF
>  
> -# ARM needs NEON for JIT
> +# 32-bit ARM needs NEON for JIT, AArch64 is supported but not well tested
> +# on big endian hence the missing $(BR2_aarch64_be).
>  # i386 & x86_64 don't seem to have any special requirements
> -ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
> +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64)$(BR2_aarch64),y)

For the JIT enabling, I think it would be better, for this patch and
the next PATCH 4/5 to do the following things:

 - A first patch that introduces BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT

config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
	bool
	default y if BR2_ARM_CPU_HAS_NEON
	default y if BR2_i386
	default y if BR2_x86_64

   and change webkitgtk.mk to use
   BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT to decide whether JIT should
   be enabled or not.

 - A second patch that adds AArch64 support, and adds a "default y if
   BR2_aarch64" to BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT

 - A third patch that enables JIT support on MIPS, extending again the
   BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT option.

Could you rework PATCH 3/5 and 4/5 accordingly ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
