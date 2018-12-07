From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Dec 2018 09:13:56 +0100
Subject: [Buildroot] strace on xtensa/uclibc
In-Reply-To: <20181207070029.CF0512073D@mail.bootlin.com>
References: <20181207070029.CF0512073D@mail.bootlin.com>
Message-ID: <20181207091356.605a9c69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Baruch, Max Filipov for Xtensa and Waldemar for uClibc-ng.

On Fri,  7 Dec 2018 08:00:29 +0100 (CET), Thomas Petazzoni wrote:

>       xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/5a0112b7a2c81fa5253c9adc93efe415256cd811 |     

I had a look at those failures of strace on xtensa:

  http://autobuild.buildroot.net/?reason=strace-4.25

I.e, strace 4.25 only fails to build on Xtensa. The reason is that
uClibc-ng doesn't have the correct values for some POLL* macros: they
don't match the kernel values.

Let's take POLLWRBAND as an example. The kernel defines it like this:

arch/xtensa/include/uapi/asm/poll.h:#define POLLWRBAND  0x0100

So strace 4.25 checks that it has the correct value:

#if defined(__m68k__) || defined(__mips__) || defined(__sparc__) || defined(__xtensa__)
#if defined(POLLWRBAND) || (defined(HAVE_DECL_POLLWRBAND) && HAVE_DECL_POLLWRBAND)
DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
static_assert((POLLWRBAND) == (0x0100), "POLLWRBAND != 0x0100");

But uClibc-ng doesn't have an arch-specific header to define POLLWRBAND
on xtensa, so it falls back to the generic definition, which isn't
correct for xtensa:

libc/sysdeps/linux/common/bits/poll.h:# define POLLWRBAND       0x200           /* Priority data may be written.  */

The same issue happens with POLLREMOVE.

I think xtensa needs to have its own
libc/sysdeps/linux/xtensa/bits/poll.h in uClibc-ng.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
