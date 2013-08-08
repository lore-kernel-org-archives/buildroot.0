From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 08 Aug 2013 07:56:20 -0300
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20130808100303.2b0226dd@skate>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
 <20130808100303.2b0226dd@skate>
Message-ID: <52037954.9080408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2013 05:03 AM, Thomas Petazzoni wrote:

> Dear Simon Dawson,
> 
> On Thu, 8 Aug 2013 08:21:14 +0100, Simon Dawson wrote:
> 
>> From my point of view, the ideal solution would be to reinstate uClibc
>> 0.9.31 support, and to lock the avr32 toolchain to that version of
>> uClibc. But I understand that this is likely to be unacceptable to
>> others.
> 
> Gustavo, you're the one who removed uClibc 0.9.31. What would it take
> to reinstate it? Have we made some significant simplifications/cleanups
> that would be complicated to rework to bring back 0.9.31 support for
> AVR32 ?

Hi.
1) Reinstate patches in the appropiate place since uclibc was packaged.
2) Probably add various "depends on !BR2_avr32" in packages that need
newer syscalls (alternatively add a ton of backports for uclibc 0.9.31
from newer releases).
3) Revert startfiles cleanup to the old manual way, adding new
exceptions/modes for the noMMU crowd (it wasn't handled before) - or
alternatively also patch the uclibc 0.9.31 makefile to make it more
0.9.32/33-ish like.

That said, i can't get anywhere with the AVR32 toolchain, it's failing
very early on:

-----
/home/gustavoz/b/avr32/output/build/host-gcc-initial-4.2.2-avr32-2.1.5/build/./gcc/xgcc
-B/home/gustavoz/b/avr32/output/build/host-gcc-initial-4.2.2-avr32-2.1.5/build/./gcc/
-B/home/gustavoz/b/avr32/output/host/usr/avr32-buildroot-linux-uclibc/bin/
-B/home/gustavoz/b/avr32/output/host/usr/avr32-buildroot-linux-uclibc/lib/
-isystem
/home/gustavoz/b/avr32/output/host/usr/avr32-buildroot-linux-uclibc/include
-isystem
/home/gustavoz/b/avr32/output/host/usr/avr32-buildroot-linux-uclibc/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I. -I../../gcc -I../../gcc/.
-I../../gcc/../include -I../../gcc/../libcpp/include
-I/home/gustavoz/b/avr32/output/host/usr/include
-I/home/gustavoz/b/avr32/output/host/usr/include
-I../../gcc/../libdecnumber -I../libdecnumber  -g0
-finhibit-size-directive -fno-inline-functions -fno-exceptions
-fno-zero-initialized-in-bss -fno-toplevel-reorder -Dinhibit_libc -mrelax \
  -c ../../gcc/crtstuff.c -DCRT_END \
  -o crtend.o
/tmp/ccN15d7y.s: Assembler messages:
/tmp/ccN15d7y.s:12: Error: invalid register list `,lr'
/tmp/ccN15d7y.s:22: Error: invalid register list `,pc'
/tmp/ccN15d7y.s:36: Error: invalid register list `,pc'
/tmp/ccN15d7y.s:54: Error: invalid register list `,lr'
/tmp/ccN15d7y.s:68: Error: invalid register list `,pc'
make[2]: *** [crtbegin.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/tmp/ccMp5aAy.s: Assembler messages:
/tmp/ccMp5aAy.s:12: Error: invalid register list `,lr'
/tmp/ccZ5kyzy.s: /tmp/ccMp5aAy.s:43: Assembler messages:
Error: invalid register list `,pc'
/tmp/ccZ5kyzy.s:10: /tmp/ccMp5aAy.s:61: Error: Error: invalid register
list `,lr'
invalid register list `,lr'/tmp/ccMp5aAy.s:75: Error: invalid register
list `,pc'

/tmp/ccZ5kyzy.s:25: Error: invalid register list `,pc'
-----

Which is documented (?!?!) upstream at
http://www.atmel.no/buildroot/buildroot-issues.html
So it seems any "modern" host gcc (4.6.x-ish here) will fail and the
solution is "use some old stuff".

There are patches for newer binutils and gcc in openwrt svn (for 2.20.1
and 4.4.7 respectively). I've tried in the past with them and hit some
issues too, though i don't remember OTOH what they were.
Also, these are pretty big patches, binutils being about 900 KiB and gcc
about 750 KiB, they wouldn't be pretty to carry around.

In my opinion, sorry if it hurts someone, we're going in circles trying
to keep up with a dead architecture, because that's what it is, no
matter how much support some people/companies want to give for their
products the onus shouldn't be on us that things weren't upstreamed in a
proper fashion which would make things far more simple.

Regards.
