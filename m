From: Yann Droneaud <ydroneaud@opteya.com>
Date: Mon, 09 Sep 2019 22:11:01 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: copy libssp.so if
 SSP is enabled
In-Reply-To: <7a178308-1946-de53-0f68-b1191b91fcf8@smile.fr>
References: <20190902063728.31203-1-ydroneaud@opteya.com>
 <7a178308-1946-de53-0f68-b1191b91fcf8@smile.fr>
Message-ID: <08fb91d5b066e8a2bcf937ee92c59efb63696feb.camel@opteya.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le samedi 07 septembre 2019 ? 15:18 +0200, Romain Naour a ?crit :

> 

> Thanks for your patch.
> 
> Le 02/09/2019 ? 08:37, Yann Droneaud a ?crit :
> > Unlike libgcc_s.so, libssp.so is not copied on the target file
> > system. As it's available at link time, allowing packages such
> > as sox to be linked against the library.
> > 
> > As it's not copied, running programs linked against libssp.so
> > lead to failure such as the following:
> > 
> >   $ sox
> >   sox: error while loading shared libraries: libssp.so.0: cannot
> > open shared object file: No such file or directory
> > 
> >   $ rec
> >   rec: error while loading shared libraries: libssp.so.0: cannot
> > open shared object file: No such file or directory
> > 
> > If BR2_SSP_REGULAR, BR2_SSP_STRONG, or BR2_SSP_ALL is set, as
> > libssp.so provides __stack_chk_fail, and *_chk symbols, the
> > library must be copied to the target filesystem, like libgcc_s.so.
> > 
> > If BR2_SSP_NONE is set, there should be no need to copy it.
> 
> I'm unable to reproduce the issue with the following defconfig:
> 
> BR2_aarch64=y
> BR2_SSP_ALL=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_SYSTEM_DHCP="eth0"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-
> virt/linux.config"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_PACKAGE_SOX=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> This defconfig use the external toolchain from ARM that provide SSP
> support.
> But there is no libssp.so in this toolchain.
> 
> Also, libssp from gcc is disabled in Buildroot for internal toolchain
> since a while:
> https://git.buildroot.net/buildroot/commit/?id=3b712a3d891bf23055a587fc518f7cd2139a6a09
> 
> In Buildroot, we are using libssp provided by the C library (glibc,
> musl, uClibc-ng) when available. We are not using libssp from gcc.
> 
> Can you describe your issue ? Are you using a custom external
> toolchain ?
> 

I'm sorry I wasn't specific enough. I had the issue with linaro aarch64
external toolchain. (For some reason I don't recall, I thought this
issue happen with other toolchain, but it's doesn't happen with ARM one
as you demonstrated, nor with Codesourcery one).

Regards.

-- 
Yann Droneaud
OPTEYA
