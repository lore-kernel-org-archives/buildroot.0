From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 12:27:41 +0200
Subject: [Buildroot] [PATCH v2] openblas: P5600 and I6400 cores only
 available for Codescape toolchains
In-Reply-To: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160719122741.6a0ac299@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 13:05:39 +0100, Vicente Olivert Riera wrote:

> +	# P5600 is built with MSA support which is only available in Codescape toolchains
> +	default "P5600"        if BR2_mips_32r2 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
>  	default "SICORTEX"     if BR2_mips_64
> -	default "I6400"        if BR2_mips_64r6
> +	# I6400 is built with MSA support which is only available in Codescape toolchains
> +	default "I6400"        if BR2_mips_64r6 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>  	default "SPARC"        if BR2_sparc
>  	default "CORTEXA15"    if BR2_cortex_a15
>  	default "CORTEXA9"     if BR2_cortex_a9

I think I don't like this, because when an upstream gcc release appears
with MSA support, it won't be used. We would then have to introduce
some BR2_TOOLCHAIN_HAS_MIPS_MSA hidden boolean to indicate if the
toolchain has MSA support or not. All that for the sake of a single
package.

If MSA-specific assembly code used in OpenBLAS, or are they just
passing -mmsa to tell the compiler to emit MSA code if possible?

In the latter case, it would be so much easier to have OpenBLAS test if
the compiler has -mmsa support, and if so, use it, and if not, not use
it. This can be done in make: the Linux kernel does it, with a make
function called cc-option. You can then do:

FOO_FLAGS += $(call cc-option,-mmsa)

and -mmsa only gets added to FOO_FLAGS if it's supported by the
compiler.

I guess such a thing could be contributed upstream to OpenBLAS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
