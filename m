From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 11:02:41 +0200
Subject: [Buildroot] [PATCH v4 03/11] package/llvm: enable AMDGPU
In-Reply-To: <20180329113346.10367-4-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-4-valentin.korenblit@smile.fr>
Message-ID: <20180330110241.792a6607@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

On Thu, 29 Mar 2018 13:33:38 +0200, Valentin Korenblit wrote:

> +config BR2_PACKAGE_LLVM_AMDGPU
> +	bool "AMDGPU backend"
> +	depends on BR2_PACKAGE_LLVM
> +	help
> +	  Build AMDGPU target. Select this option if you are going
> +	  to install mesa3d with llvm and use Gallium Radeon driver.
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 4e58c96e0f..c819487bdf 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -226,9 +226,15 @@ LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
>  # Get target architecture
>  HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
>  
> +# Build AMDGPU backend
> +ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
> +HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH);AMDGPU"
> +LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH);AMDGPU"

It feels non-natural that a target Config.in option
(BR2_PACKAGE_LLVM_AMDGPU) affect the build of the host variant of the
LLVM package. Is this really intended and necessary ? I.e do you need
AMDGPU support in the host LLVM variant for it to work in the target
LLVM ?

> +else
>  # Build backend for target architecture
>  HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
>  LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
> +endif

This doesn't look like a very extensible solution.

What about instead:

LLVM_TARGETS_TO_BUILD = $(HOST_LLVM_TARGET_ARCH)

ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
LLVM_TARGETS_TO_BUILD := $(LLVM_TARGETS_TO_BUILD);AMDGPU
endif

and then use LLVM_TARGETS_TO_BUILD to pass -DLLVM_TARGETS_TO_BUILD.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
