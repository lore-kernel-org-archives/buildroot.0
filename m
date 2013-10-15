From: Michael Rommel <rommel@layer-7.net>
Date: Tue, 15 Oct 2013 19:16:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-14
In-Reply-To: <20131015063009.2086B52C1A0@lolut.humanoidz.org>
References: <20131015063009.2086B52C1A0@lolut.humanoidz.org>
Message-ID: <A9D235D0-F376-428F-A49F-E315294C4B5D@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Oct 15, 2013, at 8:30 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2013-10-14
>     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f04e2ff7ef02fab1e350e1152145050c79f0b7cf/


/home/test/test/2/output/host/usr/bin/nios2-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -W -Wall -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wbad-function-cast -fshort-enums -fstrict-aliasing -fno-common -Wpadded -pedantic -D_REENTRANT -D_GNU_SOURCE -D AICCU_CONSOLE -D AICCU_GNUTLS -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\"" -o aiccu main.o ../common/tun.o ../common/aiccu.o ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o ../common/heartbeat.o ../common/tic.o ../common/ayiya.o ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o  -lgnutls -lpthread -lresolv
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libpcre.so.1 so try adding it to the linker command line
/home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libpcre.so.1: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status

I had a look at this error and tried to compare that with currently running builds. As far as I can see, a default build on a i586 with the included toolchain works fine and does not need linking with libpcre. Also a nm on the mentioned file (sysroot/usr/lib/crt1.o) reveals no _gp symbol on an i586 whereas with the external nios toolchain, _gp is referenced as symbol.

rommel at pelican:/var/nfs/software/initrds/uclibc/buildroot-clean-i586/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib$ nm crt1.o
00000000 D __data_start
         U __uClibc_main
         U _fini
         U _init
00000000 T _start
00000000 W data_start
         U main

Yes, if I include -lpcre on the linker line, the nios2 compile completes, but I have no way of testing, whether the result works. I also could not find any direct dependency from aiccu to the pcre, neither a function call that starts with pcre_, nor an inclusion of a pcre.h header file. And, yes, If I include -lpcre on the commandline, also the resulting i586 binary works, but unless someone convinces me that his is really a missing dependency of aiccu, I am hesitant to change anything right now, as most other builds went okay.

I tend to think, that this is a problem not related to aiccu, but if anyone else can confirm this, I fell better :-)

Cheers,

  Michael.

-- 
Michael Rommel, Erlangen, Germany
