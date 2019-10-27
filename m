From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:56:24 +0100
Subject: [Buildroot] [PATCH 8/9] arc/riscv: get rid of
 immediate-assignment
In-Reply-To: <8c8a8e347af178efed41f86218b07936f12e42bf.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
 <8c8a8e347af178efed41f86218b07936f12e42bf.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <e51f2418-c771-a965-465c-e5656f707dbb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/10/2019 10:46, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  arch/arch.mk.riscv | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
> index f3bf2b3467..da2188706c 100644
> --- a/arch/arch.mk.riscv
> +++ b/arch/arch.mk.riscv
> @@ -5,26 +5,26 @@
>  
>  ifeq ($(BR2_riscv),y)
>  
> -ifeq ($(BR2_RISCV_64),y)
> -GCC_TARGET_ARCH := rv64i
> -else
> -GCC_TARGET_ARCH := rv32i
> -endif
> -
>  ifeq ($(BR2_RISCV_ISA_RVM),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)m
> +GCC_TARGET_ARCH_SUFFIX += m
>  endif
>  ifeq ($(BR2_RISCV_ISA_RVA),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)a
> +GCC_TARGET_ARCH_SUFFIX += a
>  endif
>  ifeq ($(BR2_RISCV_ISA_RVF),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)f
> +GCC_TARGET_ARCH_SUFFIX += f
>  endif
>  ifeq ($(BR2_RISCV_ISA_RVD),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)d
> +GCC_TARGET_ARCH_SUFFIX += d
>  endif
>  ifeq ($(BR2_RISCV_ISA_RVC),y)
> -GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
> +GCC_TARGET_ARCH_SUFFIX += c
> +endif
> +
> +ifeq ($(BR2_RISCV_64),y)
> +GCC_TARGET_ARCH = rv64i$(subst $(space),,$(GCC_TARGET_ARCH_SUFFIX))
> +else
> +GCC_TARGET_ARCH = rv32i$(subst $(space),,$(GCC_TARGET_ARCH_SUFFIX))
>  endif

 I think we're loosing a bit of symmetry with this approach. How about this?

GCC_TARGET_ARCH_COMPONENTS = \
	rv \
	$(if $(BR2_RISCV_64),64,32) \
	i \
	$(if $(BR2_RISCV_ISA_RVM),m) \
	...

?

Of course, we could just immediately do

GCC_TARGET_ARCH_COMPONENTS = rv$(if $(BR2_RISCV_64),64,32)i$(if
$(BR2_RISCV_ISA_RVM),m)..

but that's majorly ugly...


 Anyway, this is a bit of bikeshedding, so I haven't marked as Changes
Requested, but I didn't apply yet either.

 BTW, note that check-package does NOT fail on the concatenations that are still
left in this file, because it's inside a conditional. So maybe that should be
fixed as well.


 Regards,
 Arnout

>  
>  endif
> 
