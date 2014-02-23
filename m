From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 10:57:06 +0000
Subject: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter
In-Reply-To: <20140223104807.473b5d47@skate>
References: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
 <20140223104807.473b5d47@skate>
Message-ID: <884EA965490E3C4D8E66AEF41E98025006C2AD@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Using external toolchain than BR2_GCC_TARGET_CPU is passed to GCC by -mcpu 
Using buildroot toolchain than BR2_GCC_TARGET_CPU is passed to configure by --with-cpu

ARC GCC likes to get -mcpu=ARC700
However through configure I am not sure but I think that config.gcc script is involved and it likes to get arc*.

Maybe my patch is a workaround to make external toolchain work for ARC and complete solution is to change ARC GCC.

Noam

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Sunday, February 23, 2014 11:48 AM
To: Noam Camus
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter

Dear Noam Camus,

On Sun, 23 Feb 2014 08:28:55 +0000, Noam Camus wrote:
> external toolchain passes -mcpu=arc700 However compiler is familiar 
> with -mcpu=ARC700
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  arch/Config.in.arc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc index 
> 60b59f0..53e7052 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -11,4 +11,5 @@ config BR2_ENDIAN
>  	default "BIG"	 if BR2_arceb
>  
>  config BR2_GCC_TARGET_CPU
> +	default "ARC700" if BR2_TOOLCHAIN_EXTERNAL
>  	default "arc700"

We clearly don't want to use BR2_TOOLCHAIN_EXTERNAL here as a condition. What is the official value? Is it -mcpu=arc700 or
-mcpu=ARC700 ? Maybe the existing arc700 value was wrong and should just be fixed? Or does the value depends on the gcc version?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
