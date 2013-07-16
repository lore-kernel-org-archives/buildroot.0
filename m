From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:13:23 +0200
Subject: [Buildroot] [PATCHv3 05/14] gcc: take into account ARM floating
	point capabilities
In-Reply-To: <1373961805-3901-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:16 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip0a1wcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The ARM EABIhf support was introduced in gcc 4.6.x, so versions
 Thomas> earlier than this one should not be used when EABIhf is selected.

 Thomas> The ARM VFPv4 support was introduced in gcc 4.5.x, so versions earlier
 Thomas> than this one should not be used when VFPv4 is used.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gcc/Config.in.host | 10 ++++++++++
 Thomas>  1 file changed, 10 insertions(+)

 Thomas> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
 Thomas> index a529d14..1f9aa9a 100644
 Thomas> --- a/package/gcc/Config.in.host
 Thomas> +++ b/package/gcc/Config.in.host
 Thomas> @@ -22,15 +22,22 @@ choice
 
 Thomas>  	config BR2_GCC_VERSION_4_3_X
 Thomas>  		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 Thomas> +		depends on !BR2_ARM_EABIHF
 Thomas>  		bool "gcc 4.3.x"
 
 Thomas>  	config BR2_GCC_VERSION_4_4_X
 Thomas>  		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 Thomas>  		bool "gcc 4.4.x"
 Thomas> +		# ARM EABIhf support appeared in gcc 4.6
 Thomas> +		depends on !BR2_ARM_EABIHF
 Thomas> +		# VFPv4 support appeared in gcc 4.5
 Thomas> +		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 Thomas>  	config BR2_GCC_VERSION_4_5_X
 Thomas>  		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 Thomas>  		select BR2_GCC_NEEDS_MPC
 Thomas> +		# ARM EABIhf support appeared in gcc 4.6
 Thomas> +		depends on !BR2_ARM_EABIHF
 Thomas>  		bool "gcc 4.5.x"
 
 Thomas>  	config BR2_GCC_VERSION_4_6_X
 Thomas> @@ -40,17 +47,20 @@ choice
 
 Thomas>  	config BR2_GCC_VERSION_4_7_X
 Thomas>  		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 Thomas> +		depends on !BR2_ARM_OABI

OABI is gone, so these can be dropped.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
