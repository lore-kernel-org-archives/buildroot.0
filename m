From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 3 Jul 2017 14:56:00 +0200
Subject: [Buildroot] [PATCH/RFC 1/1] package/mesa3d: disable libunwind
 for Gallium drivers on arm
In-Reply-To: <20170617165428.27676-1-bernd.kuhls@t-online.de>
References: <20170617165428.27676-1-bernd.kuhls@t-online.de>
Message-ID: <d78e9f9b-63ac-2a4b-b5f8-380c31b31f79@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 17/06/2017 ? 18:54, Bernd Kuhls a ?crit :
> Building a Gallium driver on ARM is broken if optional libunwind
> support is enabled. The build fails here:
> https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/auxiliary/util/u_debug_stack.c?h=17.1#n114
> 
> util/u_debug_stack.c:114:4: error: 'unw_base' undeclared (first use in this function)
>     unw_getcontext(&context);
> 
> unw_base is declared in the libunwind package in
> include/libunwind-arm.h:
> https://github.com/libunwind/libunwind/blob/7c079200d024d5868073246c4ec8f80446b0a4c0/include/libunwind-arm.h#L262
> 
> which contains a comment:
> 
> /* There is no getcontext() on ARM.  Use a stub version which only
>    saves GP registers.  FIXME: Not ideal, may not be sufficient for
>    all libunwind use cases.  Stores pc+8, which is only approximately
>    correct, really.  */
> 
> To fix the build error we just disable libunwind support on ARM when a
> Gallium driver is enabled until upstream comes up with a working
> solution. Tested using this defconfig with test_pkg
> 
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_LIBUNWIND=y
> 
> without this patch:
> 
>                 armv5-ctng-linux-gnueabi [ 1/49]: FAILED
>               armv7-ctng-linux-gnueabihf [ 2/49]: FAILED
>                   br-arm-cortex-a9-glibc [ 6/49]: FAILED
> 
> and with this patch:
> 
>                 armv5-ctng-linux-gnueabi [ 1/49]: OK
>               armv7-ctng-linux-gnueabihf [ 2/49]: OK
>                   br-arm-cortex-a9-glibc [ 6/49]: OK
> 
> Fixes
> http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53/

Can you test with http://patchwork.ozlabs.org/patch/783462/
I believe it's a problem with asm().

Thanks for the initial investigation.

Best regards,
Romain

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> I have no idea whether the problem can be fixed by patching the code,
> disabling libunwind in the gallium at arm case at least fixes the build
> error.
> 
>  package/mesa3d/mesa3d.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 04a7d13b9..bc01a37d6 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -193,11 +193,15 @@ MESA3D_CONF_OPTS += --disable-xvmc
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> +ifneq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),yy)
>  MESA3D_CONF_OPTS += --enable-libunwind
>  MESA3D_DEPENDENCIES += libunwind
>  else
>  MESA3D_CONF_OPTS += --disable-libunwind
>  endif
> +else
> +MESA3D_CONF_OPTS += --disable-libunwind
> +endif
>  
>  ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
>  MESA3D_DEPENDENCIES += libvdpau
> 
