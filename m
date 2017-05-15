From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:03:45 +0200
Subject: [Buildroot] [PATCH] kvm-unit-tests: fix build on x86-64 with
	specific gcc versions
In-Reply-To: <1494276103-22722-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 8 May 2017 22:41:43 +0200")
References: <1494276103-22722-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87o9uuiaxq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > kvm-unit-tests uses the following code on x86/x86-64:
 > static inline u64 scale_delta(u64 delta, u64 mul_frac)
 > {
 >         u64 product, unused;

 >         __asm__ (
 >                 "mul %3"
 >                 : "=d" (product), "=a" (unused) : "1" (delta), "rm" ((u64)mul_frac) );

 >         return product;
 > }

 > The "mul" instruction does not have a suffix that indicates the width of
 > the data being multiplied. When the data is passed in a register, there
 > is no need to specify the width, but with some gcc versions, the data is
 > passed as a memory reference, and therefore the assembler does not know
 > the width of the data to be multiplied. It causes the following build
 > failure:

 > x86/hyperv_clock.c: Assembler messages:
 > x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction

 > Since the data being multiplied is 64 bit, we explicitly specify the
 > instruction as being "mulq".

 > Fixes:

 >   http://autobuild.buildroot.net/results/a4a65d01f049db83a93de92660f228dd18532625/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
