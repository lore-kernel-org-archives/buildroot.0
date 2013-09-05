From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 23:48:41 +0200
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
 BR2_BINFMT_FLAT
In-Reply-To: <1378262667.32360.6.camel@phoenix>
References: <1378262598.32360.5.camel@phoenix>
 <1378262667.32360.6.camel@phoenix>
Message-ID: <20130905234841.3bbfe0d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 10:44:27 +0800, Axel Lin wrote:

> diff --git a/arch/Config.in b/arch/Config.in
> index 14899ca..31c23ec 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -223,8 +223,9 @@ config BR2_GCC_TARGET_MODE
>  # Set up target binary format
>  choice
>  	prompt "Target Binary Format"
> -	depends on BR2_bfin || BR2_m68k
> -	default BR2_BINFMT_FDPIC
> +	depends on BR2_arm || BR2_bfin || BR2_m68k
> +	default BR2_BINFMT_ELF if BR2_arm
> +	default BR2_BINFMT_FDPIC if (BR2_bfin || BR2_m68k)

I know it was broken before, but FDPIC isn't supported on BR2_m68k, so
I guess we should have something like:

	prompt "Target Binary Format"
	depends on BR2_arm || BR2_m68k || BR2_bfin
	default BR2_BINFMT_ELF if BR2_arm
	default BR2_BINFMT_FDPIC if BR2_bfin
	default BR2_BINFMT_FLAT if BR2_m68k

But I'm wondering if we shouldn't go further than that, and make
BR2_BINFMT_FLAT available only for non-MMU ARMs. Something like:

	prompt "Target Binary Format"
	depends on BR2_arm7tmdi || BR2_arm_cortex_m3 ||	BR2_arm_cortex_m4 || BR2_m68k || BR2_bfin
	default BR2_BINFMT_FLAT if BR2_arm7tmdi || BR2_arm_cortex_m3 ||	BR2_arm_cortex_m4 || BR2_m68k
	default BR2_BINFMT_FDPIC if BR2_bfin

or something like this. This way, users of MMU-capable ARM variants
wouldn't be confused by the availability of FLAT and ELF as binary
formats. Of course, BR2_BINFMT_ELF should gain some !BR2_arm7tmdi
&& !BR2_arm_cortex_m3 && !BR2_arm_cortex_m4 dependencies, or maybe even
a !BR2_USE_MMU dependency. I think there's quite some room for
improvement around the definition of which CPU has an MMU or not, and
which architectures support which binary formats.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
