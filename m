From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 19:49:46 +0100
Subject: [Buildroot] [PATCH 3/8] arch: FDPIC is not supported on m68k
In-Reply-To: <1417642895-29606-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211184946.GC4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 22:41 +0100, Thomas Petazzoni spake thusly:
> The current binfmt selection in arch/Config.in allows to select FDPIC
> on m68k, which is incorrect. This commit fixes that, and makes sure
> FDPIC is the default on Blackfin, while FLAT is the default on m68k.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 2779ab6..3bac187 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -255,7 +255,8 @@ config BR2_ARCH_HAS_ATOMICS
>  choice
>  	prompt "Target Binary Format"
>  	depends on BR2_bfin || BR2_m68k
> -	default BR2_BINFMT_FDPIC
> +	default BR2_BINFMT_FDPIC if BR2_bfin
> +	default BR2_BINFMT_FLAT if BR2_m68k
>  
>  config BR2_BINFMT_ELF
>  	bool "ELF"
> @@ -267,7 +268,7 @@ config BR2_BINFMT_ELF
>  
>  config BR2_BINFMT_FDPIC
>  	bool "FDPIC"
> -	depends on BR2_bfin || BR2_m68k
> +	depends on BR2_bfin
>  	help
>  	  ELF FDPIC binaries are based on ELF, but allow the individual load
>  	  segments of a binary to be located in memory independently of each

I find all this depends on and defaults to be a bit hard to follow.

What about doing it slightly differently:

    choice
        prompt "Target Binary Format"
    
    config BR2_BINFMT_ELF
        bool "ELF"
        depends on !BR2_bfin && !BR2_m68k
    
    config BR2_BINFMT_FDPIC
        bool "FDPIC"
        depends on BR2_bfin
    
    config BR2_BINFMT_FLAT
        bool "FLAT"
        depends on BR2_bfin || BR2_m68k
        select BR2_STATIC_LIBS
    
    endchoice

That way:

  - ELF will only be visible for those archs that can run ELF binaries.
    It will be the only choice, yes, but so would FLAT be the only
    choice for m68k, like we have today;

  - ELF is not available for bfin, so the next entry, FDPIC, will be the
    default in that case, and FLAT can still be selected;

  - for m68k, only flat is available, so it's the only choice.

It somewhat simplify the choice, no?

The rest of the series I'll review after dinner.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
