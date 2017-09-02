From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 21:47:04 +0200
Subject: [Buildroot] [PATCH 1/4] arch: add option to disable internal
 toolchain backend
In-Reply-To: <5326fe3900e51f3b0a2ac4fc9d750245d560802c.1504381100.git.yann.morin.1998@free.fr>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
 <5326fe3900e51f3b0a2ac4fc9d750245d560802c.1504381100.git.yann.morin.1998@free.fr>
Message-ID: <20170902214704.0a01ba92@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this!

On Sat,  2 Sep 2017 21:38:49 +0200, Yann E. MORIN wrote:

> +# For some architectures or specific cores, our internal toolchain
> +# backend is not suitable (like, missing support in upstream gcc, or
> +# no ChipCo fork exists...)
> +config BR2_ARCH_NO_INTERNAL_BACKEND
> +	bool

I'm not a big fan of the option name. What about:

config BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
	bool
	default y if !BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT

config BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
	bool

So, arches can select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT, and else
we can "depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT".

> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 584d053058..919757e558 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -43,6 +43,7 @@ choice
>  config BR2_TOOLCHAIN_BUILDROOT
>  	bool "Buildroot toolchain"
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
> +	depends on !BR2_ARCH_NO_INTERNAL_BACKEND
>  	depends on !BR2_bf606
>  	depends on !BR2_bf607
>  	depends on !BR2_bf608

Now that I think of it: we have dropped the Blackfin ADI external
toolchain. Therefore, we currently have no in-tree solution to use/test
bf606, bf607, bf608, etc. Perhaps we should drop them instead ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
