From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 14:17:42 +0100
Subject: [Buildroot] [PATCH v3 3/3] dpdk: new package
In-Reply-To: <20160325133240.38684e8b@jvn>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1458642986-32365-4-git-send-email-viktorin@rehivetech.com>
 <20160322211232.374d47a2@free-electrons.com>
 <20160325133240.38684e8b@jvn>
Message-ID: <20160325141742.2961edf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Fri, 25 Mar 2016 13:32:40 +0100, Jan Viktorin wrote:

> > config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> > 	bool
> > 	default y if ...
> 
> So, should I move here also the HAS_SYNC checks?

Yes, correct. Even though the HAS_SYNC dependencies are not
completely/only architecture related, we handle them as such, so it
makes sense to have them in the foo_ARCH_SUPPORTS variable.

> > comment "dpdk needs a toolchain w/ glibc"
> > 	depends on !BR2_TOOLCHAIN_USES_GLIBC
> > 	depends on BR2_TOOLCHAIN_HAS_SYNC_...
> 
> The conditiion must be "if all dependencies but BR2_TOOLCHAIN_USES_GLIBC
> are met", is it right? So, should I put here the HAS_SYNC_*,
> ARCH_SUPPORTS, BR2_LINUX_KERNEL and BR2_LINUX_NEEDS_MODULES?

I think you could do like the on2-8170-libs package, and have a single
comment:

comment "dpdk needs a glibc toolchain and a Linux kernel to be built"
	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC

The idea is that the comment should not be visible if we are on an
architecture that anyway does not support DPDK. Otherwise someone say
on MIPS will see the comment, enable glibc and Linux kernel, and then
will see the comment disappear but not the option to enable dpdk
appearing. Which would be confusing, to say the least.

> My current state is:
> 
> config BR2_PACKAGE_DPDK
> 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS                               
> 	depends on BR2_TOOLCHAIN_USES_GLIBC

	depends on BR2_LINUX_KERNEL

> 	depends on BR2_LINUX_NEEDS_MODULES

This should be a select

>         depends on BR2_TOOLCHAIN_HAS_SYNC_1 &&\
>                  BR2_TOOLCHAIN_HAS_SYNC_2 &&\
>                  BR2_TOOLCHAIN_HAS_SYNC_4 &&\
>                  BR2_TOOLCHAIN_HAS_SYNC_8

This should go in the BR2_PACKAGE_DPDK_ARCH_SUPPORTS

> config BR2_PACKAGE_DPDK_ARCH_SUPPORTS                                           
>         bool                                                                    
>         default y if (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \              
>                          && !BR2_x86_i586 && !BR2_x86_x1000) \                   
>                 || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be

This can be written in a much more readable way as:

	default y if BR2_i386 && !BR2_x86... && !BR2_...
	default y if BR2_ARM_CPU_ARMV7A
	default y if BR2_aarch64
	...

> comment "dpdk needs a toolchain w/ glibc"
> 	depends on !BR2_TOOLCHAIN_USES_GLIBC
> 	depends on ??
> 
> comment "dpdk needs the Linux kernel to be built"
> 	depends on !BR2_LINUX_KERNEL
> 	depends on ??

As said above, only one comment is needed. So here is a proposal:

config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
	bool
	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && \
		BR2_TOOLCHAIN_HAS_SYNC_2 && \
		BR2_TOOLCHAIN_HAS_SYNC_4 && \
		BR2_TOOLCHAIN_HAS_SYNC_8
	default y if BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \              
			&& !BR2_x86_i586 && !BR2_x86_x1000
	default y if BR2_ARM_CPU_ARMV7A
	default y if BR2_aarch64 || BR2_aarch64_be

config BR2_PACKAGE_DPDK
	bool "dpdk"
	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
	depends on BR2_TOOLCHAIN_USES_GLIBC
	depends on BR2_LINUX_KERNEL
	select BR2_LINUX_KERNEL_NEEDS_MODULES
	help
	  Blabla

comment "dpdk needs a glibc toolchain and a Linux kernel to be built"
	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_LINUX_KERNEL


Hope this helps,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
