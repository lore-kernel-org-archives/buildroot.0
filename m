From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:18:47 +0100
Subject: [Buildroot] [PATCH] arch/arc: add support of ARC HS38 core
In-Reply-To: <1414585517-5957-1-git-send-email-abrodkin@synopsys.com>
References: <1414585517-5957-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141029221847.33373037@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 29 Oct 2014 15:25:17 +0300, Alexey Brodkin wrote:

> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fcb5d7d..1a862d7 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,5 +1,22 @@
> +# Choise of CPU

I don't think this comment is very useful, so you can get rid of it.
And anyway, s/Choise/Choice/.

> +choice
> +	prompt "Target CPU"
> +	depends on BR2_arc
> +	default BR2_arc700
> +	help
> +	    Specific CPU to use
> +
> +config BR2_arc700
> +	bool "ARC 700"
> +
> +config BR2_archs
> +	bool "ARC HS"

The commit log says that the core is called HS38, but now it's just
"HS". Can you clarify?

>  # Choise of atomic instructions presence
>  config BR2_ARC_ATOMIC_EXT
> +	default y if BR2_archs

Why? Are atomic instructions *always* available on HS38, or are they
also optional like on ARC700 ?

>  config BR2_GCC_TARGET_CPU
> -	default "arc700"
> +	default "arc700" if BR2_arc700
> +	default "archs"	 if BR2_archs

So from gcc's point of view, the processor is called archs, but from a
marketing point of view it's HS38. What happens if tomorrow Synopsys
creates a different CPU core called HS100 ?

Is this processor already supported by the current binutils/gcc/uClibc
versions used for the ARC architecture in Buildroot?

The rest of the patch looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
