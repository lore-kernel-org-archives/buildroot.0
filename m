From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 15:41:30 +0200
Subject: [Buildroot] Bizarre behavior of armeb toolchain
Message-ID: <20130620154130.1606594d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm facing a bizarre problem with an armeb toolchain built by
Buildroot. I'm also posting this to the crossgcc@ list since there are
some gcc/binutils experts out there.

First, a little bit of background. ARM Big Endian comes into two
variants:

 * BE32, which was used up to ARMv5, where both the instructions and
   the data are Big Endian.

 * BE8, which is used since ARMv6, where the instructions remain
   little-endian and only the data are big-endian.

See
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0338g/ch06s05s01.html
for some details about this.

So, I've built an ARMv7 Cortex-A8 toolchain, with the armeb
architecture selected. The CROSS-gcc -v shows that it was configured as
follows:

	--target=armeb-buildroot-linux-uclibcgnueabi
	--with-abi=aapcs-linux
	--with-arch=armv7-a
	--with-tune=cortex-a8

Then, I wrote a simple program that contains some data and
instructions, built it under several conditions, and observed with
hexdump whether the data and code was little-endian or big-endian.

And the results are somewhat surprising: when I explicitly pass
-mbig-endian, I get the proper behavior (BE8 code with code in little
endian and data in big endian), but when I don't pass any flags to the
compiler, I get an incorrect behavior: both the code and data are big
endian, as if the BE8 wasn't used (and readelf confirms that it wasn't
used). See below the detailed results.

Note that the compiler is supposed to automatically use BE8 on
ARMv6/ARMv7 and BE32 on ARMv5 and earlier cores.

The data is DEADBEEF, and the instruction is E52DB004.

Flags used			Observed data	Observed code	Comment
======================= 	=============== =============== =========================================

-mlittle-endian			EFBEADDE	04B02DE5	Code and data in LE -> OK
-mbig-endian			DEADBEEF	04B02DE5	Code LE, data BE, binary marked BE8 -> OK
no flags			DEADBEEF	E52DB004	Data BE (ok!), code BE (*NOT* ok) -> NOK
-march=armv5t -mbig-endian	DEADBEEF        E52DB004	Code and data in BE, on ARMv5 -> OK
-march=armv5t			DEADBEEF	E52DB004	Code and data in BE, on ARMv5 -> OK

As can be seen in this table:

 (*) On ARMv5, regardless of whether -mbig-endian is passed or not, the
 code produced is correct (both code and data are big endian, which is
 correct for ARMv5 where the big endian mode is BE32)

 (*) On ARMv7 however, the code is different whether -mbig-endian is
 passed or not, even though an "armeb-linux" compiler is supposed to
 generate big endian code by default. When no flags is passed, both the
 data *and* code are big-endian (so it's BE32 like on ARMv5), but
 passing -mbig-endian makes the thing behave properly (code is
 little-endian, data is big-endian).

I'm using binutils 2.23.2 and gcc 4.7.3.

Any ideas?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
