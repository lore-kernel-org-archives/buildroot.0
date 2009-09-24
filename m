From: Dominic Mason <dominic@opusvl.com>
Date: Thu, 24 Sep 2009 17:27:06 +0100
Subject: [Buildroot]  ARCH=mips and linux-2.6.30.2
Message-ID: <1253809626.16645.27.camel@xd-02.opusvl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Whilst building mips (mipsel) for an Alchemy AU1100 based system, I got
the following error whilst building the kernel:


CC      arch/mips/lib/delay.o
arch/mips/lib/delay.c: In function '__udelay':
arch/mips/lib/delay.c:46: warning: right shift count >= width of type
arch/mips/lib/delay.c: In function '__ndelay':
arch/mips/lib/delay.c:54: error: 'us' undeclared (first use in this
function)
arch/mips/lib/delay.c:54: error: (Each undeclared identifier is reported
only once
arch/mips/lib/delay.c:54: error: for each function it appears in.)
make[1]: *** [arch/mips/lib/delay.o] Error 1
make: *** [arch/mips/lib] Error 2

This is using buildroot-2009-08 with kernel 2.6.30.2

For what it's worth, if you copy arch/mips/lib/delay.c 
from a vanilla 2.6.30.4 kernel, then the error disappears.

However, the patch appears to have been missed from the 2.6.30.5 kernel,
where it re-appears.

The relevant lines in arch/mips/lib/delay.c should be:

        __delay((us * 0x000010c7ull * HZ * lpj) >> 32);
and

        __delay((ns * 0x00000005ull * HZ * lpj) >> 32);


which should replace

        __delay((us * 0x000010c7 * HZ * lpj) >> 32);

and

        __delay((us * 0x00000005 * HZ * lpj) >> 32);



Apologies for not being proficient enough to supply this as a patch.

It would appear that the above change exists in the vanilla linux-2.6.31
kernel from www.kernel.org

So this is really for information only, for anyone who gets this error
trying to compile a mips system using the 2.6.30.2 and 2.6.30.5 kernel.



-- 
Dominic Mason <dominic@opusvl.com>
Opus VL
