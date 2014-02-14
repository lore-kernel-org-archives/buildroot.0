From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Fri, 14 Feb 2014 16:02:20 +0100
Subject: [Buildroot] [PATCH 1/1] Use libm.so when testing external
 compiler ABI
In-Reply-To: <20140214153634.1377738a@skate>
References: <1392385415-19367-1-git-send-email-syntheticpp@gmx.net>,
 <20140214153634.1377738a@skate>
Message-ID: <trinity-68fea3b6-8567-4e61-a9c3-922cbba7bfbe-1392390140321@3capp-gmx-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> This is more or less the same patch as proposed at
> https://bugs.busybox.net/show_bug.cgi?id=6842.

Yes, just more in the commit message.

> 
> Originally, the reason why I had chosen to check crt1.o instead of
> a .so file is because crt1.o exists even for purely static toolchains
> (i.e no support for shared libraries). Even though I admit that the
> likelihood of finding such toolchains for ARM is quite small, I'd like
> to understand why crt1.o doesn't have the Tag_ABI_VFP_args. Is this
> happening when using a Buildroot toolchain as an external toolchain? If

Yes, buildroot's GCC 4.8.2, relevant configs:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US de "

> so, maybe it's Buildroot who actually does something wrong when
> building the toolchain, because the Linaro toolchains do have
> Tag_ABI_VFP_args in crt1.o :
> 
> The multilib variant compiled EABIhf:
> 
> $ arm-linux-gnueabihf-readelf -A ./arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabihf/crt1.o | grep Tag_ABI_VFP_args
>   Tag_ABI_VFP_args: VFP registers
> $
> 
> The multilib variant compiled EABI:
> 
> $ arm-linux-gnueabihf-readelf -A ./arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabi/crt1.o | grep Tag_ABI_VFP_args
> $
> 
> So I'd prefer to have an understanding of why crt1.o is not EABIhf
> before applying this patch.

I agree, but don't know much about building/configuring gcc.

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
