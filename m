From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:37:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: fix fenv build
 failure on ARCv2 with glibc
In-Reply-To: <20171107211149.17617-1-bernd.kuhls@t-online.de>
References: <20171107211149.17617-1-bernd.kuhls@t-online.de>
Message-ID: <20171107223752.3844357c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Nov 2017 22:11:49 +0100, Bernd Kuhls wrote:
> https://git.buildroot.net/buildroot/commit/toolchain?id=0633eb58a2912328508a76f8fe9875a0d113a880
> added glibc support for ARCv2 which lacks fenv.h.
> 
> Fixes
> http://autobuild.buildroot.net/results/aec/aec300d7d4472421398a24202d6871c965bd1be5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> -	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
> +	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on archs38
> +	# in combination with glibc and nios2
>  	# No support for ARMv7-M in the ARM assembly logic
>  	# Microblaze build affected by gcc PR71124 (infinite loop)
>  	# m68k coldfire causes a build failure, because the check for
> @@ -9,7 +10,9 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	# not. See https://patchwork.ozlabs.org/patch/756664/ and
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
>  	# details.
> -	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze && !BR2_m68k_cf
> +	default y if !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC) && \
> +		!BR2_nios2 && !BR2_ARM_CPU_ARMV7M && \
> +		!BR2_microblaze && !BR2_m68k_cf

We don't want to fix that now, but this is getting unreadable. Perhaps
we could improve that by doing this:

config BR2_PACKAGE_FFMPEG_ARCH_BROKEN
	bool
	# blabla why
	default y if BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC
	# blabla why
	default y if BR2_nios2
	# ...
	default y if BR2_ARM_CPU_ARMV7M
	# ...
	default y if BR2_microblaze
	# blabla why
	default y if BR2_m68k_cf

config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	bool
	default y if !BR2_PACKAGE_FFMPEG_ARCH_BROKEN

It's probably more readable :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
