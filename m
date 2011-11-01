From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 1 Nov 2011 11:51:35 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Add the possibility to have
	a mcpu option with wrapper
In-Reply-To: <1320108819-2344-2-git-send-email-stanypub@gmail.com>
References: <1320108819-2344-1-git-send-email-stanypub@gmail.com>
 <1320108819-2344-2-git-send-email-stanypub@gmail.com>
Message-ID: <201111011151.35278.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stany, All,

On Tuesday 01 November 2011 01:53:39 Stany MARCEL wrote:
> Permit to define the mcpu of the external toolchain wrapper, based on
> BR2_GCC_TARGET_CPU.
> 
> Signed-off-by: Stany MARCEL <stanypub@gmail.com>
> ---
>  toolchain/toolchain-external/ext-tool.mk           |    6 ++++++
>  .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
>  2 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 572917f..640db5e 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -129,6 +129,8 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
>  CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
>  CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
>  CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
> +CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
> +

Spurious empty line.

>  # march/mtune/floating point mode needs to be passed to the external toolchain
>  # to select the right multilib variant
> @@ -144,6 +146,10 @@ ifneq ($(CC_TARGET_ABI_),)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
>  endif
> +ifneq ($(CC_TARGET_CPU_),)
> +TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
> +endif

Probably, you could try to stick the CPU setting near the ARCH and TUNE
settings (ie. just before ABI, just after TUNE).

>  ifeq ($(BR2_SOFT_FLOAT),y)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 3e23061..b1a4fcb 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -31,6 +31,9 @@ static char *predef_args[] = {
>  #ifdef BR_ABI
>  	"-mabi=" BR_ABI,
>  #endif
> +#ifdef BR_CPU
> +	"-mcpu=" BR_CPU,
> +#endif

Ditto as above.

>  #ifdef BR_SOFTFLOAT
>  	"-msoft-float",
>  #endif /* BR_SOFTFLOAT */
> 

Otherwise, looks good to me:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
