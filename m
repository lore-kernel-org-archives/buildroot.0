From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 May 2013 18:37:48 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_NO_GCC_x_y
In-Reply-To: <1367503646-31181-1-git-send-email-mjonker@synopsys.com>
References: <1367503646-31181-1-git-send-email-mjonker@synopsys.com>
Message-ID: <5182965C.7060303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/13 16:07, Mischa Jonker wrote:
> This patch eliminates the long "depends on" lines in
> toolchain/gcc/Config.in by letting architectures specify
> which GCC versions they do not support.
>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>   arch/Config.in          |    7 +++++++
>   arch/Config.in.arc      |    7 +++++++
>   arch/Config.in.arm      |   15 +++++++++++++++
>   arch/Config.in.powerpc  |    9 +++++++++
>   arch/Config.in.sparc    |   24 ++++++++++++++++++++++++
>   arch/Config.in.x86      |    2 ++
>   toolchain/gcc/Config.in |   42 +++++++++++++++++++++++++++++++++++-------
>   7 files changed, 99 insertions(+), 7 deletions(-)

  This diffstat looks a lot better already. Of course, the 7 deletions 
are a bit misleading, it's actually something like 50 deletions (due to 
lack of newlines).

[snip]
>   	config BR2_GCC_VERSION_4_8_X
> -		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
> +		depends on !BR2_ARCH_HAS_NO_GCC_4_8
>   		select BR2_GCC_NEEDS_MPC
>   		bool "gcc 4.8.x"
>
>   	config BR2_GCC_VERSION_SNAP
> -		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
> +		depends on !BR2_ARCH_HAS_NO_GCC_SNAP
>   		select BR2_GCC_NEEDS_MPC
>   		bool "gcc snapshot"
>   endchoice

  For the cases which will only ever support one specific gcc version 
(arc (until it's upstreamed), avr32, and leon), I think it makes more 
sense to disable the choice completely.

choice
         prompt "GCC compiler Version" if BR2_sparc_sparchfleon || \
		BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon ||  \
		BR2_sparc_sparcsfleonv8 || BR2_avr32 || BR2_arc
         default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || \
		BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon ||  \
		BR2_sparc_sparcsfleonv8
         default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
         default BR2_GCC_VERSION_4_7_X


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
