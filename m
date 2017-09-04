From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Sep 2017 19:21:37 +0200
Subject: [Buildroot] [PATCH 4/9] arch/arm: do not allow soft-float for
	armv8a
In-Reply-To: <bd6e8e2eaf13ecc5e45e360875cfff3494b86a8c.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
 <bd6e8e2eaf13ecc5e45e360875cfff3494b86a8c.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <20170904172137.GB5223@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-09-03 15:17 +0200, Yann E. MORIN spake thusly:
> armv8a has made VFPv4 and NEON mandatory, so there is no point in
> allowing software floating point, even in 32-bit mode.

In fact, even though I'm pretty sure that OK in 64-bit, we might still
have a reason to do soft-float in 32-bit mode, if only for legacy
binary-only applications that were built as soft-float way back in the
(not so) good old days...

In which case, we should instead depend on !BR2_ARCH_IS_64.

Thoughts?

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index d110d52e2d..0ae6a16a0a 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -374,6 +374,7 @@ choice
>  config BR2_ARM_SOFT_FLOAT
>  	bool "Soft float"
>  	depends on BR2_ARM_EABI
> +	depends on !BR2_ARM_CPU_ARMV8A
>  	select BR2_SOFT_FLOAT
>  	help
>  	  This option allows to use software emulated floating
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
