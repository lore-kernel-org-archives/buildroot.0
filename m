From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Mar 2016 17:51:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: disable on mips
References: <1457255845-20770-1-git-send-email-bernd.kuhls@t-online.de>
 <20160306134141.7fedbb85@free-electrons.com>
Message-ID: <XnsA5C3B5B74612FID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160306134141.7fedbb85 at free-electrons.com: 

> In fact, I think this is still not good. Why would Kodi have explicit
> support for MIPS, if in practice you couldn't build it for MIPS ?

good question, in January 2015 I could build Kodi for mips:
https://github.com/xbmc/xbmc/pull/5570#issuecomment-72334761

In June 2015 they added some atomic code:
https://github.com/xbmc/xbmc/commit/593f4aa0ba7e572394111a856ec9b54ed7a8351
b#diff-7e982ad80e27d748c5f7d697506c692f which breaks compilation today
with Kodi 16.0-Jarvis: 

LD      kodi.bin
xbmc/filesystem/filesystem.a(FileCache.o): In function
`std::__atomic_base<long long>::store(long long, std::memory_order)': 
/home/bernd/buildroot/br2_kodi16/output/host/usr/mipsel-buildroot-linux-gnu
/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to
`__atomic_store_8' 
/home/bernd/buildroot/br2_kodi16/output/host/usr/mipsel-buildroot-linux-gnu
/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to
`__atomic_store_8' xbmc/filesystem/filesystem.a(FileCache.o): In function
`std::__atomic_base<long long>::load(std::memory_order) const': 
/home/bernd/buildroot/br2_kodi16/output/host/usr/mipsel-buildroot-linux-gnu
/include/c++/4.9.3/bits/atomic_base.h:500: undefined reference to
`__atomic_load_8' collect2: error: ld returned 1 exit status
Makefile:437: recipe for target 'kodi.bin' failed
make[1]: *** [kodi.bin] Error 1

using this defconfig with the BR2_TOOLCHAIN_HAS_SYNC_8 patch reverted: 

BR2_mipsel=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_XORG7=y

Regards, Bernd
