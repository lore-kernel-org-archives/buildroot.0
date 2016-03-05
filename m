From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:27:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: needs
 BR2_TOOLCHAIN_HAS_SYNC_8
In-Reply-To: <1456610655-7183-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456610655-7183-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305152736.05cfcb80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 27 Feb 2016 23:04:15 +0100, Bernd Kuhls wrote:
> Fixes a build error on arm detected by autobuilders:
> http://autobuild.buildroot.net/results/439/43939f65e4516adddc4385c6e0a2193abcab0446/
> http://autobuild.buildroot.net/results/322/322e3cd3b444106c9b624675c2265d4fdfefe458/
> http://autobuild.buildroot.net/results/3c1/3c1a0e35325828c554f49ab9dbeb4b9b16f9b1e5/
> http://autobuild.buildroot.net/results/222/222e8f3392a794b693ff0a9617453bdffbce8aef/
> http://autobuild.buildroot.net/results/d91/d91efe30996ddbb4706885b48ff6d5d3fa974df8/
> 
> and this build error on BR2_x86_i486
> 
> xbmc/filesystem/filesystem.a(FileCache.o): In function `std::__atomic_base<long long>::store(long long, std::memory_order)':
> /home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to `__atomic_store_8'
> /home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to `__atomic_store_8'
> xbmc/filesystem/filesystem.a(FileCache.o): In function `std::__atomic_base<long long>::load(std::memory_order) const':
> /home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:500: undefined reference to `__atomic_load_8'

It is not completely true that it will fix this last problem. It will
*avoid* it for i486, but by accident. Because i486 doesn't implement
the 8-byte variant of __sync_*(), and because you're adding a
dependency on BR2_TOOLCHAIN_HAS_SYNC_8, Kodi will no longer be built
on i486. Which indeed avoids the second problem, but does not really
fix it.

In particular, if there is any architecture that provides the 8-byte
__sync_*() atomic intrinsic, but requires linking with libatomic to get
access to  the 8-byte __atomic_*() intrinsic, then you will again get a
compilation failure.

And according to my tests, i586 is such an architecture. Can you
attempt a build on i586 ?

> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 7d28882..1450b6e 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	bool
> -	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \

Where is this list of ARM/MIPS/i386/x86-64 coming from? Why isn't the
list of support architectures derived just from
BR2_PACKAGE_BOOST_ARCH_SUPPORTS ? There is really some architecture
specific code in Kodi ?

> +		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
> +		&& BR2_TOOLCHAIN_HAS_SYNC_8

Due to the addition of the BR2_TOOLCHAIN_HAS_SYNC_8 dependency, then
there is no longer a need to have (BR2_mipsel &&
BR2_TOOLCHAIN_USES_GLIBC), since MIPS doesn't provide the 8 byte
__sync_*() intrinsics, and therefore BR2_TOOLCHAIN_HAS_SYNC_8 is false
on MIPS. Can you send a follow-up patch to disable MIPS, or
alternatively remove the list of architectures completely if
appropriate.

I've anyway applied your patch, as the BR2_TOOLCHAIN_HAS_SYNC_8 does
make sense.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
