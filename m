From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:19:03 +0200
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200824221903.167aeb55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marie,

On Mon, 24 Aug 2020 14:09:01 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_1 -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
> tmp-divrem_1.s: Assembler messages:
> tmp-divrem_1.s:129: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:145: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:158: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:175: Error: selected processor does not support `mls r1,r4,r3,r8' in ARM mode
> tmp-divrem_1.s:209: Error: selected processor does not support `mls r11,r4,r12,r3' in ARM mode

So this means that the GMP build system thinks your CPU supports the
MLS instruction (which exists since ARMv6T2), but in fact the gcc on
your system says it is not available.

I would suggest to have a look at how GMP detects which optimized ARM
code to use in mpn/arm/ as this is probably where the issue is.

Could you try with GMP 6.2.0 as was suggested in the thread, or share
the complete build log of host-gmp, as well as the config.log file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
