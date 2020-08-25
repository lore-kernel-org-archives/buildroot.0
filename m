From: Marie Maurer <marie.maurer@pixida.de>
Date: Tue, 25 Aug 2020 07:43:06 +0000
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <20200825093345.50f51945@windsurf.home>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824221903.167aeb55@windsurf.home>
 <VI1PR03MB452800581DAF06C2AC4B1B0298570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB4528133C5651F56F709E5ED698570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200825093345.50f51945@windsurf.home>
Message-ID: <VI1PR03MB452849E1179528B11527FB1A98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

it is a Raspberry Pi Compute Module 3 Plus. This is the output during startup:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.51-v7+ (dom at buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1333 SMP Mon Aug 10 16:4
5:19 BST 2020
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Raspberry Pi Compute Module 3 Plus Rev 1.0
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created CMA memory pool at 0x37400000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] On node 0 totalpages: 242688
[    0.000000]   Normal zone: 2133 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 242688 pages, LIFO batch:63
[    0.000000] percpu: Embedded 20 pages/cpu s49856 r8192 d23872 u81920
[    0.000000] pcpu-alloc: s49856 r8192 d23872 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3

pi at raspberrypi:~/buildroot/buildroot-2020.08-rc1 $ uname -a
Linux raspberrypi 5.4.51-v7+ #1333 SMP Mon Aug 10 16:45:19 BST 2020 armv7l GNU/Linux

> But more globally, why are you trying to build Buildroot on a RaspberryPi itself?
> It's going to be massively slow compared to the build time you would achieve on any reasonable x86-64 system.

First it was just a mistake, I took the wrong windows to compile buildroot
and thought if this is the only bug, it is worth reporting.

But we are also doing other compile and test tasks directly on the target,
so perhaps (even when slow) would be an option to make things easier in future.
Target is controlled by a CI.

If you think, not worth to look for, please let me know.

Best regards,

Marie

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Gesendet: Dienstag, 25. August 2020 09:34
An: Marie Maurer <marie.maurer@pixida.de>
Cc: Aaron Dewes <aaron.dewes@web.de>; buildroot at busybox.net
Betreff: Re: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same is working)

Hello Marie,

On Tue, 25 Aug 2020 07:26:18 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> Perhaps full rebuild necessary?

No, I don't think a full rebuild will help here.

> checking build system type... armv7l-unknown-linux-gnueabihf checking
> host system type... armv7l-unknown-linux-gnueabihf

On which RaspberryPi are you building ? It's detecting an ARMv7 core here.

>  /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I..
> -DOPERATION_divrem_1
> -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include
> -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
> tmp-divrem_1.s: Assembler messages:
> tmp-divrem_1.s:130: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:146: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:159: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:176: Error: selected processor does not support `mls
> r1,r4,r3,r8' in ARM mode
> tmp-divrem_1.s:210: Error: selected processor does not support `mls
> r11,r4,r12,r3' in ARM mode
> make[3]: *** [Makefile:768: divrem_1.lo] Error 1

And it doesn't make any sense for ARMv7 to not have support for MLS if I'm correct.

But more globally, why are you trying to build Buildroot on a RaspberryPi itself? It's going to be massively slow compared to the build time you would achieve on any reasonable x86-64 system.

Best regards,

Thomas Petazzoni
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Pixida GmbH
Ungererstr. 129
80805 M?nchen

Amtsgericht M?nchen - HRB 173520
Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou



www.pixida.de<http://www.pixida.de/>

[PIXIDA]



Unsere Datenschutzgrunds?tze<http://www.pixida.com/grundsaetze.html>
