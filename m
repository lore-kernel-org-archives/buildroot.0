From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2012 14:38:30 +0100
Subject: [Buildroot] [PATCH 1/5] arch: improve definition of gcc mtune,
	mcpu, etc.
In-Reply-To: <8ef94365af539b190e9525a10c5b642dc7108cb9.1352986210.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
 <8ef94365af539b190e9525a10c5b642dc7108cb9.1352986210.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201211151438.30221.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 15 November 2012 14:30:11 Thomas Petazzoni wrote:
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

I know you are just moving stuff around, but those symbols are typed
as strings, so the default values should be enclosed in-between double
quotes:
    default "arm600"   if BR2_arm600

Moreover, the code is not coherent with itslef, even in a single file.
For example, you have (both are string symbols):

    config BR2_ENDIAN
        default "LITTLE" if BR2_arm

    config BR2_GCC_TARGET_TUNE
        default arm600   if BR2_arm600

That it currently works is just happenstance, and may well break in
the future when we upgrade to a newer kconfig version.

Maybe we can just apply this for now, and fix that in a future patch?

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
