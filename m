From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 4 Aug 2015 01:10:16 +0200
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <CAAMcf8BWy-NzBFHKsbyx3SRz9RC98_KUiCoq-7C5C-nRS+jmGQ@mail.gmail.com>
References: <CAAMcf8BWy-NzBFHKsbyx3SRz9RC98_KUiCoq-7C5C-nRS+jmGQ@mail.gmail.com>
Message-ID: <55BFF4D8.6090204@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 03/08/2015 20:55, vj a ?crit :
> Hello Romain
> 
> I've tested your patch series successfully!

That's great, thanks for testing :)

> 
> Just a few notes:
> 
> 1)
> It's been tested with the musl c library. To do so, I had to remove the libc
> restriction you added.
> When using musl, there are some packages (at least pulseaudio) that can not be
> build, so the BR2_PACKAGE_EFL_RECOMMENDED_CONFIG had to be disabled.
> So, as it build and worked fine, could you remove the glibc requirement or add
> musl to the restricted list of supported libcs ?

Yes, you're right. efl can be build with a musl libc.

I've mainly tested this series with a glibc toolchain and I had a link issue
with a uClibc-ng toolchain due to missing mkstemps/mkostemps().

Before sending the series, I tried to build with a musl toochain and I had the
same issue with pulsaudio and give up. (hence this patches series [1])

Also, I've sent this patch [2] to the uclibc-ng mailing list to add missing
mkstemps/mkostemps().

Since then, I've successfully built enlightenment with a musl toolchain (not
runtime tested though).

But I'm wonder if I should remove BR2_PACKAGE_EFL_RECOMMENDED_CONFIG and make
sure that all recommended dependencies are mandatory. Because it's mainly
untested or even not built at all by efl maintainers.

So, ok I'll enable musl for the next respin.

[1] http://patchwork.ozlabs.org/patch/502724/
[2] http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000432.html
> 
> 2)
> When BR2_PACKAGE_EFL_RECOMMENDED_CONFIG is disabled the efl dependency on
> BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is lost but it is still a requirement, so this
> patch (or a variation of it) is needed:
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_EFL
>      select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency
>      select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
>      select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
> +    select BR2_PACKAGE_UTIL_LINUX
> +    select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>      help
>        Enlightenment Foundation Libraries

Thanks will fix, but I haven't really tested without recommended config.

>  
> 3)
> To test it I've added the terminology package which depends on efl and
> configured buildroot like:
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_ARM_FPU_NEON=y
> BR2_OPTIMIZE_3=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_BINUTILS_VERSION_2_25_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_GCC_ENABLE_LTO=y
> BR2_GCC_ENABLE_GRAPHITE=y
> BR2_TARGET_OPTIMIZATION="-march=armv7-a -mtune=cortex-a8 -mcpu=cortex-a8
> -mfpu=neon -mfloat-abi=hard"
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_TERMINOLOGY=y
> # BR2_PACKAGE_EFL_RECOMMENDED_CONFIG is not set
> BR2_PACKAGE_EFL_FB=y
> BR2_PACKAGE_EFL_PNG=y
> BR2_PACKAGE_EFL_JPEG=y
> BR2_PACKAGE_LUA_5_3=y
> BR2_TARGET_ROOTFS_CPIO=y
> # BR2_TARGET_ROOTFS_TAR is not set

I haven't sent the complete series yet, just the bump of current efl related
packages.
I have pushed my working branch here, if you want to look at it:

https://github.com/RomainNaour/buildroot/tree/efl-1.14.2-v4

There is already a terminology package and more ;-)

> 
> 4)
> Unrelated to efl: to make it work with an external toolchain when the
> arhitecture is "armhf" instead of "arm" this patch is also required:
> --- a/toolchain/toolchain-external/toolchain-external.mk
> <http://toolchain-external.mk>
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> <http://toolchain-external.mk>
> @@ -496,6 +496,8 @@ endef
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
>  ifeq ($(BR2_i386),y)
>  MUSL_ARCH = i386
> +else ifeq ($(BR2_ARM_EABIHF),y)
> +MUSL_ARCH = armhf
>  else
>  MUSL_ARCH = $(ARCH)
>  endif

Can you send a proper patch for this please ?

See the manual if needed:
http://buildroot.uclibc.org/downloads/manual/manual.html#submitting-patches

> 
> Thanks for updating efl!

You're welcome.

I hope you'll send a Tested-by and/or Reviewed-by tag for the next respin ;-)

Best regards,
Romain

> 
> Regards,
>   Vicente.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
