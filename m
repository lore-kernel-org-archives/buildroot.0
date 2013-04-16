From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 23:20:59 +0200
Subject: [Buildroot] [PATCH v5 3/7] arch: toolchain: Introduce target
 CPU revision.
In-Reply-To: <1365761909-15305-3-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-3-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130416232059.0a04d086@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 18:18:25 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>

> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 92183a4..27fd296 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -134,7 +134,11 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
>  endif
>  
>  CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
> +ifeq ($(BR2_GCC_TARGET_CPU_REVISION),)

I think this test should have a $(call qstrip) to be effective.

>  CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
> +else
> +CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
> +endif
>  CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
>  CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))

It should also be changed in toolchain/gcc/gcc-uclibc-4.x.mk in a
similar way. Code is currently:

ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
endif

It should be:

ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
else
GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
endif
endif

Once this is one, I think the patch is OK.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
