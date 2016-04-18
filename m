From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Apr 2016 23:27:36 +0200
Subject: [Buildroot] [PATCH v2] arch/x86: remove support for i386
In-Reply-To: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <57155148.9030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/17/16 23:31, Thomas Petazzoni wrote:
> The Linux kernel doesn't even support i386 anymore, there is no NPTL
> support for i386 and uClibc-ng only supports NPTL on x86, so there is
> essentially no usable thread implementation. Most likely glibc and
> musl also don't support i386 either. So it's time to remove the
> support for this architecture variant.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index ff759a0..d6f57a1 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -615,8 +615,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>   	bool "Musl 1.1.12 toolchain (experimental)"
>   	depends on (BR2_arm && BR2_ARM_EABI) || \
>   		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \

  With this patch I notice this... Huh? AFAIK ARMv4 cannot have VFPv2, so it 
can't be EABIhf, right? I guess, Thomas, that you just blindly set this because 
the EABIhf version of the toolchain is ARMv5, without realizing that it's ARMv5 
because EABIhf doesn't exist for v4?

  Regards,
  Arnout

> -		(BR2_armeb && BR2_ARM_EABI) || \
> -		(BR2_i386 && !BR2_x86_i386) || \
> +		(BR2_armeb && BR2_ARM_EABI) || BR2_i386 || \
>   		(BR2_mips && !BR2_SOFT_FLOAT) || \
>   		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
>   		BR2_sh4 || BR2_sh4eb || \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
