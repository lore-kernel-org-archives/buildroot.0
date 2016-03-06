From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Mar 2016 10:18:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: needs
	BR2_TOOLCHAIN_HAS_SYNC_8
References: <1456610655-7183-1-git-send-email-bernd.kuhls@t-online.de>
 <20160305152736.05cfcb80@free-electrons.com>
Message-ID: <XnsA5C368EEFC703ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Thomas,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160305152736.05cfcb80 at free-electrons.com: 

> And according to my tests, i586 is such an architecture. Can you
> attempt a build on i586 ?

a Kodi build for i586 using unpatched git master (c6e3511) finished
without errors using this defconfig: 

$ cat defconfig
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
$ grep i586 .config
BR2_ARCH="i586"
BR2_GCC_TARGET_ARCH="i586"
BR2_x86_i586=y

> Where is this list of ARM/MIPS/i386/x86-64 coming from? Why isn't the
> list of support architectures derived just from
> BR2_PACKAGE_BOOST_ARCH_SUPPORTS ? There is really some architecture
> specific code in Kodi ?

Yes:
https://github.com/xbmc/xbmc/blob/Jarvis/m4/xbmc_arch.m4
https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L554

>> +          && BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
>> +          && BR2_TOOLCHAIN_HAS_SYNC_8
> 
> Due to the addition of the BR2_TOOLCHAIN_HAS_SYNC_8 dependency, then
> there is no longer a need to have (BR2_mipsel &&
> BR2_TOOLCHAIN_USES_GLIBC), since MIPS doesn't provide the 8 byte
> __sync_*() intrinsics, and therefore BR2_TOOLCHAIN_HAS_SYNC_8 is false
> on MIPS. Can you send a follow-up patch to disable MIPS
> [...]

Done: http://patchwork.ozlabs.org/patch/592530/

Regards, Bernd
