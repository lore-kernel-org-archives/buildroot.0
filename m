From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 22:44:08 +0200
Subject: [Buildroot] [PATCH 3/8] arch: improve ARM floating point
	support and add support for EABIhf
In-Reply-To: <1373123292-15085-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Jul 2013 17:08:07 +0200")
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373123292-15085-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4fagkx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit introduces the support for the EABIhf ABI, next to the
 Thomas> existing support we have for EABI and OABI (even though OABI support
 Thomas> is deprecated). EABIhf allows to improve performance of floating point
 Thomas> workload by using floating point registers to transfer floating point
 Thomas> arguments when calling functions, instead of using integer registers
 Thomas> to do, as is done in the 'softfp' floating point model of EABI.

 Thomas> In addition to this, this commit introduces a list of options for the
 Thomas> floating point support:
 Thomas>  * Software floating point
 Thomas>  * VFP
 Thomas>  * VFPv3
 Thomas>  * VFPv3-D16
 Thomas>  * VFPv4
 Thomas>  * VFPv4-D16

 Thomas> and it introduces some logic to make sure the options are only visible
 Thomas> when it makes sense, depending on the ARM core being selected. This is
 Thomas> however made complicated by the fact that certain VFP capabilities are
 Thomas> mandatory on some cores, but optional on some other cores. The kconfig
 Thomas> logic tries to achieve the following goals:

 Thomas>  * Hide options that are definitely not possible.

 Thomas>  * Use safe default values (i.e for Cortex-A5 and A7, the presence of
 Thomas>    the VFPv4 unit is optional, so we default on software floating
 Thomas>    point on these cores)..

 Thomas>  * Show the available possibilities, even if some of them are not
 Thomas>    necessarily working on a particular core (again, for the Cortex-A5
 Thomas>    and A7 cores, there is no way of knowing whether the particular
 Thomas>    variant used by the user has VFPv4 or not, so we select software
 Thomas>    floating point by default, but still show VFP/VFPv3/VFPv4 options).

 Thomas> It is worth noting that this commit doesn't add support for all
 Thomas> possible -mfpu= values on ARM. We haven't added support for fpa, fpe2,
 Thomas> fpe3, maverick (those four are only used on very old ARM cores), for
 Thomas> vfpv3-fp16, vfpv3-d16-fp16, vfpv3xd, vfpv3xd-fp16, neon-fp16,
 Thomas> vfpv4-sp-d16. They can be added quite easily if needed thanks to the
 Thomas> new organization of the Config.in options.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


 Thomas>  config BR2_cortex_a15
 Thomas>  	bool "cortex-A15"
 Thomas>  	select BR2_ARM_CPU_HAS_NEON
 Thomas> +	select BR2_ARM_CPU_HAS_VFPV4
 Thomas>  config BR2_fa526
 Thomas>  	bool "fa526/626"
 Thomas>  config BR2_pj4
 Thomas>  	bool "pj4"
 Thomas> +	select BR2_ARM_CPU_HAS_VFPV3
 Thomas>  config BR2_strongarm
 Thomas>  	bool "strongarm sa110/sa1100"
 Thomas>  config BR2_xscale
 Thomas> @@ -67,34 +101,67 @@ config BR2_arm1136jf_s
 Thomas>  choice
 Thomas>  	prompt "Target ABI"
 Thomas>  	depends on BR2_arm || BR2_armeb
 Thomas> -	depends on BR2_DEPRECATED
 Thomas>  	default BR2_ARM_EABI

Looks good. You could argue that we should do:

      default BR2_ARM_EABIHF

instead (E.G. default to eabihf if available, otherwise fall back to
eabi), but with all the optional vfp units it's perhaps better to play
it safe..

-- 
Bye, Peter Korsgaard
