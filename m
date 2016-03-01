From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 10:38:28 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <46j9qcxf4f.ln2@ID-313208.user.individual.net>
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
 <46j9qcxf4f.ln2@ID-313208.user.individual.net>
Message-ID: <20160301103828.4e129eff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

Please try to Cc: me whenever you are replying to an e-mail that
specifically needs my attention. I have 3000+ unread e-mails in my
Buildroot folder, so I can easily miss some replies to previous threads.

On Sat, 27 Feb 2016 23:05:24 +0100, Bernd Kuhls wrote:

> Hi Thomas,
> 
> tbh I do not think that I fully understood the atomics stuff[1],

To be honest, I am not sure if I still fully groked the entire problem
space either.

> but I 
> could reproduce the build error ;) Kodi checks unconditionally for
> 	__sync_add_and_fetch
> 	__sync_sub_and_fetch
> 	__sync_val_compare_and_swap
> in configure.ac, the only file using the resulting defines is xbmc/
> threads/Atomics.cpp which is used in several parts of Kodi, I do not 
> think all of these features are optional.
> The build error also occurs with Kodi 16.0-Jarvis, btw, and should be 
> fixes by this patch: http://patchwork.ozlabs.org/patch/589456/

There are multiple issues here, which are independent from each other.

The first issue is the one that you can see at
http://autobuild.buildroot.net/results/439/43939f65e4516adddc4385c6e0a2193abcab0446/,
i.e:

/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/libgcc.a(linux-atomic-64bit.o): In function `__check_for_sync8_kernelhelper':
/opt/toolchain-build/build/host-gcc-final-4.7.4/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/linux-atomic-64bit.c:59: undefined reference to `__write'

This issue is due to the fact that a __sync_*() intrinsic is used on a
8 byte type, but this is unfortunately broken on ARM < v7 with
libraries other than glibc.

The configure script is indeed doing some checks for __sync_*()
intrinsics, but it does so on a "long" type, which on ARM is 4 bytes.
So in fact, it seems like Kodi is testing for the availability of 4
bytes intrinsics, but also uses 8 bytes intrinsics.

To solve this problem, your addition of the BR2_TOOLCHAIN_HAS_SYNC_8
dependency is correct.

The second issue is the one your report in the commit log itself, and
is an *unrelated* issue:

xbmc/filesystem/filesystem.a(FileCache.o): In function `std::__atomic_base<long long>::store(long long, std::memory_order)':
/home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to `__atomic_store_8'

Here, we are not talking about the __sync_*() intrinsics, but the
__atomic_*() ones, which are different. To solve this specific problem,
you need to:

 1/ Depend on BR2_TOOLCHAIN_HAS_ATOMIC.
 2/ Link against -latomic if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 is defined.

By chance, adding the BR2_TOOLCHAIN_HAS_SYNC_8 dependency solves both
the first and the second issue, because the __sync_*() 8-bytes
built-ins are not available on i486, so Kodi is no longer selectable on
i486, and therefore you no longer see the second problem. However, I
believe you should still be seeing the second problem on i586 and later
i386 chips, since all the __atomic_*() intrinsics are all implemented
in libatomic on i386.

Note that my fix (2) is currently the recommended fix, but it is not
completely correct yet since I have discovered that libatomic is
apparently not build for toolchains that have thread support disabled.
I still need to think about it and figure out the proper way of
handling this situation. In the mean time, doing (1) and (2) is good
enough and should fix most problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
