From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 22 Jun 2018 12:09:33 +0200
Subject: [Buildroot] [RFC PATCH v5 4/6] llvm: add config to build
 backend for host arch
In-Reply-To: <20180622003340.10859-5-joseph.kogut@gmail.com>
References: <20180622003340.10859-1-joseph.kogut@gmail.com>
 <20180622003340.10859-5-joseph.kogut@gmail.com>
Message-ID: <f58a5fab-0b9d-bd0b-34b8-a2b6c9e4b8b3@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

On 22/06/2018 02:33, Joseph Kogut wrote:
> +config BR2_PACKAGE_HOST_LLVM
> +	bool "host llvm"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8
> +	help
> +	  The LLVM Project is a collection of modular and reusable
> +	  compiler and toolchain technologies.
> +
> +	  http://llvm.org
> +

I was asked to remove this option from my first patch series, I think
mainly because host-llvm was just a dependency of llvm. But in this case,
as we are using llvm as a compiler, I think we should have it but we should
also add "select BR2_PACKAGE_HOST_LLVM" in Config.in (same for Clang).

>   # Build backend for target architecture. This include backends like AMDGPU.
> +HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
>   LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)

Thomas's suggestion:

LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)

HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD)

>   ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
> +HOST_LLVM_TARGETS_TO_BUILD += AMDGPU
>   LLVM_TARGETS_TO_BUILD += AMDGPU
>   endif

Thomas's suggestion:

Delete HOST_LLVM_TARGETS_TO_BUILD += AMDGPU


Something I'm not sure of is the default backend for host.

We have HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)

But now that there is a backend for the host, I don't know if we
should select this one as default. I haven't tested with Clang yet
but I think that if the target triple is correctly specified there
shouldn't be any problem.

Best regards,

Valentin
