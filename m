From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 04:08:47 +0100
Subject: [Buildroot] [PATCH 3/3] arch: improve definition of gcc mtune,
 mcpu, etc.
In-Reply-To: <9b972f2db74b874534b3548249241f5bccc1d7cf.1351967245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
 <9b972f2db74b874534b3548249241f5bccc1d7cf.1351967245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095DC3F.8090204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 19:28, Thomas Petazzoni wrote:
> As suggested by Yann E. Morin, there is a better way than our current
> big Config.in.common to define the gcc mtune, mcpu, march,
> etc. values. We can split the setting of those values in each
> architecture file, which makes a lot more sense.
>
> Therefore, the Config.in file now creates empty kconfig variables
> BR2_ARCH, BR2_ENDIAN, BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH,
> BR2_GCC_TARGET_ABI and BR2_GCC_TARGET_CPU. The values of those
> variables are set by the individual Config.in.<arch>  files. This is
> possible because such files are now only conditionally included
> depending on the top-level architecture that has been selected.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  Barring a few details:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

Checked by sorting everything and taking the diff with the original.
Also checked completeness of BR2_ENDIAN (which is now much easier).


[snip]
> diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
> new file mode 100644
> index 0000000..4c68a37
> --- /dev/null
> +++ b/arch/Config.in.aarch64
> @@ -0,0 +1,5 @@
> +config BR2_ARCH
> +	default "aarch64"	if BR2_aarch64

  Isn't this condition redundant?

> +
> +config BR2_ENDIAN
> +	default "LITTLE"
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 8d9db3c..2acedc4 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -60,3 +60,55 @@ config BR2_ARM_OABI
>   	depends on !BR2_GCC_VERSION_4_7_X
>   endchoice
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

  Yann suggested to add quotes here.

[snip]
> diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
> new file mode 100644
> index 0000000..ebf8454
> --- /dev/null
> +++ b/arch/Config.in.avr32
> @@ -0,0 +1,5 @@
> +config BR2_ARCH
> +       default "avr32"
> +
> +config BR2_ENDIAN
> +       default "BIG"

  spaces -> tab

> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
> index 1823bde..0b137ae 100644
> --- a/arch/Config.in.bfin
> +++ b/arch/Config.in.bfin
> @@ -8,3 +8,9 @@ config BR2_BFIN_FLAT
>   	bool "FLAT"
>   	select BR2_PREFER_STATIC_LIB
>   endchoice
> +
> +config BR2_ARCH
> +	default "bfin"
> +
> +config BR2_ENDIAN
> +        default "LITTLE"

  spaces -> tab

[snip]
> diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
> new file mode 100644
> index 0000000..dbdd99a
> --- /dev/null
> +++ b/arch/Config.in.microblaze
> @@ -0,0 +1,10 @@
> +config BR2_ARCH
> +	default "microblaze"
> +
> +config BR2_ENDIAN
> +	default "LITTLE" if BR2_microblazeel
> +	default "BIG"	 if BR2_microblazebe
> +
> +config BR2_microblaze
> +	bool
> +	default y if BR2_microblazeel || BR2_microblazebe

  Isn't this condition redundant now?  I.e., use def_bool.

[snip]
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 20b0b06..55c1651 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -81,3 +81,48 @@ config BR2_powerpc_SPE
>   	bool "SPE"
>   	depends on BR2_powerpc_8540 || BR2_powerpc_8548
>   endchoice
> +
> +config BR2_ARCH
> +	default "powerpc"	if BR2_powerpc

  Isn't this condition redundant now?

[snip]
> diff --git a/arch/Config.in.sh b/arch/Config.in.sh
> index 314c55a..cf70fd5 100644
> --- a/arch/Config.in.sh
> +++ b/arch/Config.in.sh
> @@ -22,3 +22,20 @@ config BR2_sh4a
>   config BR2_sh4aeb
>   	bool "sh4aeb (SH4A big endian)"
>   endchoice
> +
> +config BR2_ARCH
> +	default "sh2"		if BR2_sh2
> +	default "sh2a"		if BR2_sh2a
> +	default "sh3"		if BR2_sh3
> +	default "sh3eb"		if BR2_sh3eb
> +	default "sh4"		if BR2_sh4
> +	default "sh4eb"		if BR2_sh4eb
> +	default "sh4a"		if BR2_sh4a
> +	default "sh4aeb"	if BR2_sh4aeb
> +	default "sh64"		if BR2_sh64
> +
> +config BR2_ENDIAN
> +	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a || \
> +				   BR2_x86_64 || BR2_sh64

  That x86_64 must be a mistake...

> +	default "BIG"		if BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
> +				   BR2_sh4eb || BR2_sh4aeb
[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
