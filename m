From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:53:48 +0200
Subject: [Buildroot] [PATCH v3 1/2] x264: new package
In-Reply-To: <1412326439-12230-1-git-send-email-0intro@gmail.com>
References: <1412326439-12230-1-git-send-email-0intro@gmail.com>
Message-ID: <20141005145348.2913eb46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David du Colombier,

On Fri,  3 Oct 2014 10:53:58 +0200, David du Colombier wrote:

> +if BR2_PACKAGE_X264
> +
> +config BR2_PACKAGE_X264_CLI
> +	bool "CLI"
> +	default n

default n is not needed, as the default for a boolean option is to be
disabled.

> +	help
> +	  Command Line Interface

Maybe more text would be needed here.

But the biggest problem is that it doesn't build:

Try this configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_PACKAGE_X264=y
BR2_PACKAGE_X264_CLI=y

It will fail with:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-as -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -I. -I. -std=gnu99 -mcpu=cortex-a8 -mfpu=neon -c -DSTACK_ALIGNMENT=16 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/arm/cpu-a.o common/arm/cpu-a.S
/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-as: unrecognized option '-_LARGEFILE_SOURCE'

This is caused by the following code in the configure script:

if [ $asm = auto -a $ARCH = ARM ] ; then
    # set flags so neon is built by default
    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"

    if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
        cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
        cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
        ASFLAGS="$ASFLAGS $CFLAGS -c"
    else
        echo "You specified a pre-ARMv6 or Thumb-1 CPU in your CFLAGS."
        echo "If you really want to run on such a CPU, configure with --disable-asm."
        exit 1
    fi
fi

When you're on ARM, CFLAGS is added to ASFLAGS. However, the CFLAGS
passed by Buildroot contain options that are not suitable for AS.
Basically, what x264 is doing here is completely stupid: assuming that
all compiler flags can be passed as assembler flags.

Also, the "else" condition above is interesting: the assembly code is
only valid for ARMv6+. So in your x264.mk file, the following snippet
is wrong:

ifeq ($(BR2_arm)$(BR2_i386)$(BR2_powerpc)$(BR2_x86_64),)
        X264_CONF_OPTS += --disable-asm
endif

Because if you're on ARMv5, we will *not* pass --disable-asm, while we
should. So this logic should be refined to take into account variants
of the ARM architecture.

Could you look into this and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
