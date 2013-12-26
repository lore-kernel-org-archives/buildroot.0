From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Dec 2013 22:57:26 +0100
Subject: [Buildroot] libgcc erroneously built as armv5 for
	arm920t(armv4t)
In-Reply-To: <20131102163906.0b558177@skate>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
 <20131102163906.0b558177@skate>
Message-ID: <20131226215726.GC3398@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-11-02 16:39 +0100, Thomas Petazzoni spake thusly:
> Dear adam hussein\(!\),
> 
> On Thu, 26 Sep 2013 08:34:53 -0700 (PDT), adam hussein\(!\) wrote:
> 
> > I've been building the at91rm9200ek configuration of buildroot to get a toolchain I can use to build u-boot with some board specific configuration.
> > 
> > This is an ARM920T core chip with ARMv4T architecture??- later ARM9 series have ARMv5TE architecture (http://en.wikipedia.org/wiki/ARM9)
> > 
> > When gcc is built, or perhaps specifically libgcc only, it seems the selection of 920t/v4 architecture gets lost and v5 is used instead.
> > This means that when I use it to build u-boot, I find it has the __udivsi3 function using the illegal (to v4) instruction CLZ (count leading zeros).
> > 
> > The easiest workaround for me is to specify arm7tdmi and be done with it, but I'd like to try contributing a proper fix if possible.
> 
> Can you try the attached patch? Ideally, it would be nice if you could
> try it with two configurations:
> 
>  * With the internal toolchain backend
>  * With the Sourcery CodeBench 2013.05 external toolchain
> 
> and run it on real hardware.
> 
> Thanks a lot for your testing!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

> From d3dca38af037a96fe45f94a303775c4f29b022b4 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Sat, 2 Nov 2013 16:32:48 +0100
> Subject: [PATCH] arch: use BR2_GCC_TARGET_CPU on ARM
> 
> Currently, the ARM Config.in logic specifies values for
> --with-arch/-march and --with-tune/-mtune, but not for
> --with-cpu/-mcpu. However, this causes problems on ARMv4, because
> specifying --with-arch=armv4t isn't enough to make gcc generate ARMv4
> code: one should also pass --with-cpu=<some ARMv4 CPU>.
> 
> Moreover, since Buildroot is generally designed to generate code
> specifically for the configured target, it makes sense to give our own
> --with-cpu/-mcpu value instead of relying on the default value used by
> gcc, and only do small optimizations with -mtune.
> 
> Reported-by: Adam Hussein <kryme76@yahoo.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  arch/Config.in.arm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index c0fabb7..dd58744 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -341,7 +341,7 @@ config BR2_ENDIAN
>  	default "LITTLE" if BR2_arm
>  	default "BIG"	 if BR2_armeb
>  
> -config BR2_GCC_TARGET_TUNE
> +config BR2_GCC_TARGET_CPU
>  	default "arm7tdmi"	if BR2_arm7tdmi
>  	default "arm7tdmi"	if BR2_arm720t
>  	default "arm7tdmi"	if BR2_arm740t
> -- 
> 1.8.1.2
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
