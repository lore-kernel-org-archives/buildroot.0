From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 15:32:58 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
 beaglebone_defconfig
In-Reply-To: <8761wa1w3b.fsf@dell.be.48ers.dk>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wa1w3b.fsf@dell.be.48ers.dk>
Message-ID: <20130716153258.1f2c3201@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 16 Jul 2013 15:19:04 +0200, Peter Korsgaard wrote:

> Did you test build this? I had a beaglebone derived config (but with
> latest linaro), and u-boot failed to build with:

Yes, I tried beaglebone_defconfig, which uses an internal toolchain...
which would not exhibit this problem.

> /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc -DDO_DEPS_ONLY \
> 		-g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -I/home/peko/source/buildroot/output/build/uboot-2013.04/include -fno-builtin -ffreestanding -nostdinc -isystem /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -march=armv7-a -Wall -Wstrict-prototypes       \
> 			-o arch/arm/cpu/armv7/am33xx/asm-offsets.s arch/arm/cpu/armv7/am33xx/asm-offsets.c -c -S; \
> 	else \
> 		touch arch/arm/cpu/armv7/am33xx/asm-offsets.s; \
> 	fi
> arm-linux-gnueabihf-gcc: error: -mfloat-abi=soft and -mfloat-abi=hard may not be used together
> make[1]: *** [lib/asm-offsets.s] Error 1
> 
> Because of the hard/soft float mixup. It might not happen with the
> internal toolchain as we're not forcing -mfloat-abi=hard on the command
> line, but I haven't tried yet.

Unfortunately, I'm not sure how to fix this particular problem. It's
gcc that is too stupid to understand that -msoft-float appearing in the
command line after -mfloat-abi=hard should take precedence over
-mfloat-abi=hard. I believe we already had this case in the past, maybe
not specifically with those options, but with other options.

One solution I see to this is not very nice:

	if (gcc command line contains -msoft-float) {
		do not pass -mfloat-abi and -mfpu arguments
	}

The other solution is to simply not pass -mfloat-abi=hard, assuming the
toolchain would by default generate such binaries, which should be the
case because EABI and EABIhf are not compatible. However, we should
still pass -mfloat-abi=soft/softfp as needed.

That makes me think that I should maybe add a check that ensures that
the ABI selection (EABI/EABIhf) matches the one provided by the
external toolchain (which is useful when custom external toolchains are
used).

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
