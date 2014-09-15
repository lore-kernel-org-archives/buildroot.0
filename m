From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 23:33:39 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140915213339.GC3878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-09-15 23:01 +0200, Thomas Petazzoni spake thusly:
> In commit 88cf3bb91792c9c04586e14f293d89a6e0c13e1d
> ("arch/Config.in.arm: Use armv6k for arm1136jf-s rev1"), Beno?t
> Th?baudeau added separate options for the revision 0 and revision 1 of
> the ARM1136JF-S processor, so that different -march values could be
> used (armv6j for revision 0, armv6k for revision 1).
> 
> However, this is preventing the removal of the BR2_GCC_TARGET_ARCH
> option, which we need to do to give only the CPU type to gcc, and let
> it decide the architecture variant that matches. This is because this
> story of revision 0 vs. revision 1 is the only case where -mcpu
> doesn't fully define the CPU.
> 
> Moreover, a quick test with gcc shows that -march=armv6j
> -mcpu=arm1136jf-s is accepted, while -march=armv6k -mcpu=arm1136jf-s
> makes gcc complain: " warning: switch -mcpu=arm1136jf-s conflicts with
> -march=armv6k switch".
> 
> In addition, gcc 5 will apparently no longer allow to pass all of
> --with-arch, --with-cpu and --with-tune, so we will anyway have to
> rely only on one of them.
> 
> As a consequence, this commit basically reverts
> 88cf3bb91792c9c04586e14f293d89a6e0c13e1d and provides only one option
> for ARM1136JF-S. If the two revisions are really different, then they
> should be supported in upstream gcc with different -mcpu values.
> 
> Note that the removal of the two options should not break existing
> full .config, since the hidden option BR2_arm1136jf_s becomes again a
> visible option to select the CPU.

But it would break a defconfig.

As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
have it select BR2_arm1136jf_s, so the user can re-use a defconfig.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> ---
>  arch/Config.in.arm | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 201ff1d..6e3c4e6 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -54,12 +54,8 @@ config BR2_arm926t
>  	bool "arm926t"
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> -config BR2_arm1136jf_s_r0
> -	bool "arm1136jf_s rev0"
> -	select BR2_ARM_CPU_HAS_VFPV2
> -	select BR2_ARM_CPU_HAS_THUMB
> -config BR2_arm1136jf_s_r1
> -	bool "arm1136jf_s rev1"
> +config BR2_arm1136jf_s
> +	bool "arm1136jf-s"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
>  config BR2_arm1176jz_s
> @@ -113,10 +109,6 @@ config BR2_iwmmxt
>  	bool "iwmmxt"
>  endchoice
>  
> -config BR2_arm1136jf_s
> -	bool
> -	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
> -
>  choice
>  	prompt "Target ABI"
>  	depends on BR2_arm || BR2_armeb
> @@ -364,8 +356,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "armv4t"	if BR2_arm920t
>  	default "armv4t"	if BR2_arm922t
>  	default "armv5te"	if BR2_arm926t
> -	default "armv6j"	if BR2_arm1136jf_s_r0
> -	default "armv6k"	if BR2_arm1136jf_s_r1
> +	default "armv6j"	if BR2_arm1136jf_s
>  	default "armv6zk"	if BR2_arm1176jz_s
>  	default "armv6zk"	if BR2_arm1176jzf_s
>  	default "armv7-a"	if BR2_cortex_a5
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
