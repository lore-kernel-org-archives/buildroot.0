From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 7 Sep 2019 15:18:06 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: copy libssp.so if
 SSP is enabled
In-Reply-To: <20190902063728.31203-1-ydroneaud@opteya.com>
References: <20190902063728.31203-1-ydroneaud@opteya.com>
Message-ID: <7a178308-1946-de53-0f68-b1191b91fcf8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for your patch.

Le 02/09/2019 ? 08:37, Yann Droneaud a ?crit?:
> Unlike libgcc_s.so, libssp.so is not copied on the target file
> system. As it's available at link time, allowing packages such
> as sox to be linked against the library.
> 
> As it's not copied, running programs linked against libssp.so
> lead to failure such as the following:
> 
>   $ sox
>   sox: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory
> 
>   $ rec
>   rec: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory
> 
> If BR2_SSP_REGULAR, BR2_SSP_STRONG, or BR2_SSP_ALL is set, as
> libssp.so provides __stack_chk_fail, and *_chk symbols, the
> library must be copied to the target filesystem, like libgcc_s.so.
> 
> If BR2_SSP_NONE is set, there should be no need to copy it.

I'm unable to reproduce the issue with the following defconfig:

BR2_aarch64=y
BR2_SSP_ALL=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_SOX=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set

This defconfig use the external toolchain from ARM that provide SSP support.
But there is no libssp.so in this toolchain.

Also, libssp from gcc is disabled in Buildroot for internal toolchain since a while:
https://git.buildroot.net/buildroot/commit/?id=3b712a3d891bf23055a587fc518f7cd2139a6a09

In Buildroot, we are using libssp provided by the C library (glibc,
musl, uClibc-ng) when available. We are not using libssp from gcc.

Can you describe your issue ? Are you using a custom external toolchain ?

Best regards,
Romain

> 
> Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c3ddff263fe9..175a87756437 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -114,6 +114,10 @@ endif
>  
>  TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
>  
> +ifneq ($(BR2_SSP_NONE),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> 
