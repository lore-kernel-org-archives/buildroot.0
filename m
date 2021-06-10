From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 10 Jun 2021 14:28:18 +0000
Subject: [Buildroot] [git commit branch/2021.02.x] Config.in: disable
 PIC/PIE for Nios2
In-Reply-To: <20210610075846.7C12686F32@busybox.osuosl.org>
References: <20210610075846.7C12686F32@busybox.osuosl.org>
Message-ID: <c01bf1d9ae8f40dd93b68a6d22c41103@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Recently in Buildroot the option BR2_PIC_PIE has been enabled by default along
> with other hardening features [1]. Since then the nios2 defconfig
> qemu_nios2_10m50_defconfig is failing to boot due to a segfault in init program:

You probably just don't want to enable PIE for nios2 at all.
Even switch statement jump tables are problematic in shared objects.
(I think the table has to go in .code to ensure it is <16k from
the instructions that use it.)
The change to gcc certainly broke our use where the code is 'pure'.
We only run a few kB of code.

It is worth remembering that the nios2 is a simple in-order cpu
built from FPGA logic elements.
Getting one to run@much over 100MHz is hard.

We do use them for embedded code loops, I really can't imagine
running Linux on one - probably too slow to be really useful.
After all, if you need to run Linux on an fpga there are plently
with a small ARM core 'in the corner'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
