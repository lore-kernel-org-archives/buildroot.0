From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:45:00 +0100
Subject: [Buildroot] [PATCH] arc/riscv: get rid of immediate-assignment
In-Reply-To: <20191027112306.346-1-yann.morin.1998@free.fr>
References: <20191027112306.346-1-yann.morin.1998@free.fr>
Message-ID: <20191027124500.24ac2790@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

arc -> arch in the commit title.

On Sun, 27 Oct 2019 12:23:06 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>  ifeq ($(BR2_riscv),y)
>  
> -ifeq ($(BR2_RISCV_64),y)
> -GCC_TARGET_ARCH := rv64i
> -else
> -GCC_TARGET_ARCH := rv32i
> -endif
> -
> -ifeq ($(BR2_RISCV_ISA_RVM),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)m
> -endif
> -ifeq ($(BR2_RISCV_ISA_RVA),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)a
> -endif
> -ifeq ($(BR2_RISCV_ISA_RVF),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)f
> -endif
> -ifeq ($(BR2_RISCV_ISA_RVD),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)d
> -endif
> -ifeq ($(BR2_RISCV_ISA_RVC),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
> -endif
> +GCC_TARGET_ARCH = \
> +	$(subst $(space),, \
> +		rv \
> +		$(if $(BR2_RISCV_64),64,32) \
> +		i \
> +		$(if $(BR2_RISCV_ISA_RVM),m) \
> +		$(if $(BR2_RISCV_ISA_RVA),a) \
> +		$(if $(BR2_RISCV_ISA_RVF),f) \
> +		$(if $(BR2_RISCV_ISA_RVD),d) \
> +		$(if $(BR2_RISCV_ISA_RVC),c) \
> +	)

I really don't find this to be an improvement.

The existing code is completely obvious, you don't even have to turn on
your brain to understand what it does. With your change, it becomes a
lot less obvious.

Do we have a justification/motivation for this change ? I.e, what is
the problem with immediate assignment in general ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
