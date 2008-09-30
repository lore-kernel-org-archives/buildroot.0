From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 30 Sep 2008 11:52:40 +0200
Subject: [Buildroot] xkb.c:2169: relocation truncated to fit
In-Reply-To: <20080929143511.754c35a6@atmel.com>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B26FF@bfl-exchange-1.BFL.local><20080929140622.4823d684@atmel.com><49ED01FC03EE524BB7BB258E8F93BFF32B272D@bfl-exchange-1.BFL.local>
	<20080929143511.754c35a6@atmel.com>
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32B276A@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
> You got the basics of it, adding PIC will probably help, although this

> should be enabled by default for -O2, but I see you have -Os set as 
> well in the flags to GCC. Try adding -mrelax and see what happens.

I have set the optimization level to -O2 and tried to compile with
different settings: -fPIC / -fPIC -DPIC / -mrelax But I get always the
relocation truncated to fit error.
The errormessage is now a bit different than the first one I wrote:

/atmel/buildrootBT/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gc
c -O2 -I/atmel/buildrootBT/build_avr32/staging_dir/usr/include
-I/atmel/buildrootBT/build_avr32/staging_dir/include
--sysroot=/atmel/buildrootBT/build_avr32/staging_dir/ -isysroot
/atmel/buildrootBT/build_avr32/staging_dir -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/atmel/buildrootBT/build_avr32/staging_dir/usr/include/pixman-1 -o
Xfbdev fbinit.o  libfbdev.a ../../../dix/.libs/libdix.a
../../../config/libconfig.a ../../../hw/kdrive/src/libkdrive.a
../../../hw/kdrive/linux/liblinux.a ../../../fb/.libs/libfb.a
../../../mi/.libs/libmi.a ../../../xfixes/.libs/libxfixes.a
../../../Xext/.libs/libXext.a ../../../dbe/.libs/libdbe.a
../../../XTrap/.libs/libxtrap.a ../../../record/.libs/librecord.a
../../../render/.libs/librender.a ../../../randr/.libs/librandr.a
../../../damageext/.libs/libdamageext.a
../../../miext/damage/.libs/libdamage.a
../../../miext/shadow/.libs/libshadow.a ../../../Xi/.libs/libXi.a
../../../xkb/.libs/libxkb.a ../../../xkb/.libs/libxkbstubs.a
../../../composite/.libs/libcomposite.a ../../../dix/.libs/libxpstubs.a
../../../os/.libs/libos.a ../../../hw/kdrive/src/libkdrivestubs.a
/atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXfont.so
/atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXau.so
/atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libfontenc.so
/atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libpixman-1.so
/atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXdmcp.so -lm
-Wl,--rpath -Wl,/atmel/buildrootBT/build_avr32/staging_dir/usr/lib
-Wl,--rpath -Wl,/atmel/buildrootBT/build_avr32/staging_dir/usr/lib
../../../xkb/.libs/libxkb.a(xkb.o): In function `ProcXkbSetMap':
xkb.c:(.text+0x845e): relocation truncated to fit: R_AVR32_9UW_PCREL
against `.text'+865c
collect2: ld returned 1 exit status

I see two different .text locations, but i don't know why the compiler
has a problem here.

One or two month ago I was able to compile the same XServer (Version
1.4.1).
I even tried to use the old xserver_xorg-server.mk and patches, but that
didn't help too.
So since there isn't anything changed for the XServer, maybe there are
compiler/library or processor specific changes in Buildroot which cause
this error?

Regards
Sebastian
