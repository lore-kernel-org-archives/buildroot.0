From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 08:47:04 +0200
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
 gnuconfig targets
In-Reply-To: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
Message-ID: <20110510084704.7cd44147@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 09 May 2011 14:12:53 +0100
Phil Edworthy <PHIL.EDWORTHY@renesas.com> wrote:

> sh2eb and sh2a_nofpueb gnuconfig targets are no longer supported
> in Buildroot. This patch replaces these Buildroot targets with sh2
> and sh2a respectively, and adds sh4a targets as these are widely
> used.
> 
> To build for devices without an fpu, the relevant toolchain flags
> will have to be specified.

Thanks a lot for coming back so quickly with an updated patch and
clarification about SuperH support. That's really nice!

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

A few questions/comments below, though.

> diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
> index 5748fbb..9a96d7d 100644
> --- a/fs/jffs2/Config.in
> +++ b/fs/jffs2/Config.in
> @@ -94,8 +94,8 @@ choice
>  	prompt "Endianess"
>  	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_armeb || \
>  			BR2_avr32 || BR2_m68k || BR2_mips || \
> -			BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
> -			BR2_sh3eb || BR2_sh4eb || BR2_sparc
> +			BR2_powerpc || BR2_sh2 || BR2_sh2a || \
> +			BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc

Not your fault, but we should probably try to use BR2_ENDIAN here, in
order to have the big/little endian list of architectures in a common
location and not duplicated here in JFFS2. But that's a separate
matter, and should be fixed in a separate patch.

> diff --git a/toolchain/elf2flt/elf2flt/config.sub b/toolchain/elf2flt/elf2flt/config.sub
> index 4279c84..2072457 100755
> --- a/toolchain/elf2flt/elf2flt/config.sub
> +++ b/toolchain/elf2flt/elf2flt/config.sub

Just curious, as I have never used Buildroot to build a toolchain for
non-MMU platforms (only used pre-built Blackfin toolchains so far). How
does this elf2flt thing fits into the toolchain build process ?

Instead of patching this config.sub file, wouldn't it be possible to
use the one we have in package/gnuconfig/ ? Or, put it differently, is
there an upstream location for elf2flt we could use instead of having
its source code directly into the Buildroot tree ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
