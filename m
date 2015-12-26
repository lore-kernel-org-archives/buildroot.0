From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Dec 2015 21:37:09 +0100
Subject: [Buildroot] [PATCH] toolchain-external: CodeSourcery PowerPC:
 Revert the removal of CS PowerPC 2011.03
In-Reply-To: <20151226164210.2a30c04f@free-electrons.com>
References: <1451131225-9384-1-git-send-email-romain.naour@gmail.com>
 <20151226164210.2a30c04f@free-electrons.com>
Message-ID: <567EFA75.7080004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/12/2015 16:42, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Sat, 26 Dec 2015 13:00:25 +0100, Romain Naour wrote:
> 
>> Also re-add the old CS toolchain handling for pixman and liquid-dsp.
> 
> This part is not good. With your change, the "fixes" on pixman and
> liquid-dsp are now also applied when using the SPE-capable 2012.03
> toolchain, while in the past they were only used for the non-SPE
> capable 2010.xx and 2011.xx toolchains:
> 
> -# Altivec detection isn't reliable for CS toolchains
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
> -PIXMAN_CONF_OPTS += --disable-vmx
> -endif

Indeed, I was unsure how to handle this...

> 
>  config BR2_PACKAGE_LIQUID_DSP
>         bool "liquid-dsp"
>         depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
>         depends on !BR2_STATIC_LIBS
> -       # These result in internal compiler error
> -       depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
> -       depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>         help
>           Liquid-DSP is a free and open-source signal processing
>           library for software-defined radios written in C.  Its
> 
> So either we need to have two Config.in symbols:
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC and
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_SPE, or you need to adjust
> the fixes to test that SPE is not set, like:
> 
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC):$(BR2_POWERPC_CPU_HAS_SPE),y:)
> -PIXMAN_CONF_OPTS += --disable-vmx
> -endif

Well, I think it would be better to handle the CS PowerPC 2012.03 case like for
Arago toolchains, i.e fix the CPU type dependency.

I noticed that this toolchain depends on BR2_powerpc_SPE which allow to select
BR2_powerpc_8548 (e500v2) but also BR2_powerpc_8540 (e500v1).

Are you sure the system build for a PowerPC 8540 can work with this toolchain ?
Do you think we can use BR2_powerpc_8548 instead of BR2_powerpc_SPE ?

I would do something like:
config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
	bool "Sourcery CodeBench PowerPC 2012.03 (e500v2 only)"
	depends on BR2_powerpc
	depends on BR2_powerpc_8548
	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
	depends on !BR2_STATIC_LIBS
	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
	select BR2_INSTALL_LIBSTDCPP
	select BR2_HOSTARCH_NEEDS_IA32_LIBS
	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
	help
	  Sourcery CodeBench toolchain for the PowerPC architecture,
	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
	  glibc 2.15, gdb 7.2.50 and kernel headers 3.2.10. It has
	  support for the following variants:
	    - e500v2 glibc, SPE, 32 bits

For the 2011.03 toolchain we keep Kconfig as it was previously:
config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
	bool "Sourcery CodeBench PowerPC 2011.03"
	depends on BR2_powerpc
	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
	depends on !BR2_STATIC_LIBS
	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
	select BR2_INSTALL_LIBSTDCPP
	select BR2_HOSTARCH_NEEDS_IA32_LIBS
	# kernel headers: 2.6.38
	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
	help
	  Sourcery CodeBench toolchain for the PowerPC architecture,
	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
	  glibc 2.13, gdb 7.2.50 and kernel headers 2.6.38. It has
	  support for the following variants:
	    - 603 glibc, 32 bits
	      Select a generic PowerPC core
	      Disable BR2_SOFT_FLOAT
	    - 603 soft float glibc, 32 bits
	      Select a generic PowerPC core
	      Enable BR2_SOFT_FLOAT
	    - e600 altivec glibc, 32 bits
	      Set BR2_TARGET_OPTIMIZATION to -te600
	    - e500v1 glibc, 32 bits
	      Set BR2_TARGET_OPTIMIZATION to -te500v1
	    - e500v2 glibc, 32 bits
	      Set BR2_TARGET_OPTIMIZATION to -te500v2
	    - e500mc glibc, 32 bits
	      Set BR2_TARGET_OPTIMIZATION to -te500mc
	    - 970 glibc hard-float, 64 bits
	      Set BR2_TARGET_OPTIMIZATION to -m64

We can let the user decide to select one of the two toolchains above if
BR2_powerpc_8548 is selected.

Thoughts ?

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
