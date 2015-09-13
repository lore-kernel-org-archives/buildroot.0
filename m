From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 10:21:36 +0200
Subject: [Buildroot] [PATCH 2/3] New entry for the Cortex-M4 processor
In-Reply-To: <1442127768-26447-2-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <1442127768-26447-2-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <20150913102136.01d94129@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Sun, 13 Sep 2015 03:02:47 -0400, Chris Wardman wrote:
> I created a new entry for the Cortex-M4 processor in the processor list.

Don't use "personal" formulations in commit log. It should be something
like: "This commit adds a new entry..."

> Right now it is being tested against a STM32F4disovery board.
> This is technically an M4F. I will add that entry with the floating point in the future

Ditto here.

And the title of the commit log should be:

	arch: add entry for the ARM Cortex-M4 processor

> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 4d10f4c..2692402 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -156,6 +156,11 @@ config BR2_cortex_m3
>  	bool "cortex-M3"
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_HAS_THUMB2
> +config BR2_cortex_m4
> +       bool "cortex-M4"
> +        select BR2_ARM_CPU_HAS_THUMB
> +        select BR2_ARM_CPU_HAR_THUMB2
> +        select BR2_ARM_CPU_ARMV7M

Please use tab for indentation. Also, while Cortex-M3 also does it, I
think selecting both Thumb and Thumb-2 is not correct: Cortex-M3/M4
only support Thumb-2, no? Or at least, gcc only provides a -mthumb
option that will generate Thumb-2 code, so there is no way to generate
classic Thumb code on ARMv7-M platforms. Though since the problem
already exists for Cortex-M3, we can keep it this way for Cortex-M4 as
well for now.

Also, you're selecting the BR2_ARM_CPU_ARMV7M option, but this option
does not exist. Since there is a BR2_ARM_CPU_ARMV7A, I believe it makes
sense to create this option, so probably you should have three patches
here:

 * One option that adds BR2_ARM_CPU_ARMV7M
 * One patch that makes Cortex-M3 select it
 * One patch that adds Cortex-M4

Other than that, looks good to me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
