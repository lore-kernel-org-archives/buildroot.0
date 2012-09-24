From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Sep 2012 19:02:08 +0200
Subject: [Buildroot] [PATCH 3/3] arch: improve definition of gcc mtune,
	mcpu, etc.
In-Reply-To: <a9b004ff67d93f81796aa2a6a10734cf1d59ccf2.1348468443.git.thomas.petazzoni@free-electrons.com>
References: <cover.1348468443.git.thomas.petazzoni@free-electrons.com>
 <a9b004ff67d93f81796aa2a6a10734cf1d59ccf2.1348468443.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209241902.08775.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 24 September 2012 08:34:31 Thomas Petazzoni wrote:
> As suggested by Yann E. Morin, there is a better way than our current
> big Config.in.common to define the gcc mtune, mcpu, march,
> etc. values. We can split the setting of those values in each
> architecture file, which makes a lot more sense.
> 
> Therefore, the Config.in file now creates empty kconfig variables
> BR2_ARCH, BR2_ENDIAN, BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH,
> BR2_GCC_TARGET_ABI and BR2_GCC_TARGET_CPU. The values of those
> variables are set by the individual Config.in.<arch> files. This is
> possible because such files are now only conditionally included
> depending on the top-level architecture that has been selected.
[--SNIP--]
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 8d9db3c..2acedc4 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -60,3 +60,55 @@ config BR2_ARM_OABI
>  	depends on !BR2_GCC_VERSION_4_7_X
>  endchoice
>  
> +config BR2_ARCH
> +	default "arm"	if BR2_arm
> +	default "armeb"	if BR2_armeb
> +
> +config BR2_ENDIAN
> +	default "LITTLE" if BR2_arm
> +	default "BIG"	 if BR2_armeb
> +
> +config BR2_GCC_TARGET_TUNE
> +	default arm600		if BR2_arm600

This is a 'string' option, so defaults should be enclosed between
double-quotes:
	default "arm600"	if BR2_ARM600

Ditto for all archs.

Yep, that's how the code was prior to your changes, but why not clean it
up in the process (either in this patch, or in a following patch)?

If you fix that in this patch, or in a following patch:
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
