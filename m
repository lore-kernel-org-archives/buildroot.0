From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Mar 2016 23:34:56 +0100
Subject: [Buildroot] [PATCH v2 02/17] arch/arm: Cortex-M3 provides only
 Thumb-2
In-Reply-To: <1458335299-27409-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160318223456.GC32171@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-18 22:08 +0100, Thomas Petazzoni spake thusly:
> The Cortex-M cores only support Thumb-2, not Thumb. In fact, Thumb-2
> is a superset of Thumb, and we could have a single option for both in
> Buildroot, since -mthumb on ARMv4/v5 means original Thumb, while
> -mthumb on ARMv7 means Thumb 2. However, for clarity, it makes sense
> to have two separate options. But in this case, Cortex-M3 should not
> advertise that it supports Thumb, as in fact selecting Thumb would
> generate Thumb-2 code.

So, if a package has some assembly code written in Thumb not Thimb2, it
should do sometinh like:

    ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)
    FOO_OPTS += --enable-thumb
    endif

whereas now it would only need to do:

    ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)
    FOO_OPTS += --enable-thumb
    endif

Right?

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.arm | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 33f763a..cd1ec33 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -172,7 +172,6 @@ config BR2_cortex_a17
>  	select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_m3
>  	bool "cortex-M3"
> -	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_HAS_THUMB2
>  	select BR2_ARM_CPU_ARMV7M
>  config BR2_fa526
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
