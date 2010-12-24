From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Dec 2010 09:05:17 +0100
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
	<20101223082740.3a8e44c4@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
Message-ID: <20101224090517.0c935c19@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy,

(Could you please avoid top-posting ? Thanks!)

On Thu, 23 Dec 2010 13:03:15 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> Okay, I've done some tracking and have found the issue, but I don't know
> Mips asm that great (only 2 months into mips).
> 
> The code that it pukes at for building gmp for the native toolchain is:
> 
> #define umul_ppmm(w1, w0, u, v) \
> __asm__ ("multu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
> 
> (defined in longlong.h under the root of gmp-4.2.4)
> 
> The error given is:
> dive_1.c:114:4: error: impossible constraint in 'asm'
> dive_1.c:114 is: umul_ppmm (h, dummy, l, divisor);

Hum, maybe this has been fixed in more recent versions of gmp. Could
you try Gustavoz's toolchain-rework branch ? It bumps gmp to version
5.0.1, it's really the first thing to test before trying to fix an old
gmp version.

Gustavo's repository is at git://repo.or.cz/buildroot-gz.git, the
branch is toolchain-rework. Or you can get the individual patches at
http://lists.busybox.net/pipermail/buildroot/2010-December/039804.html.

> Also, for my edification and learning, how does that asm line read?

Well:

 * multu is the instruction

 * %2 says "the third argument in the argument list", so in our case,
   it's "d" (u)

 * %3 says "the fourth argument in the argument list", so in our case,
   it's "d" (v)

 * the part after the first colon is the list of output registers.
   See
   http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html#s5
   for the syntax of what Gcc calls "extended assembly".

 * The "=l" (w0) tells gcc to put the contents of the LO register into
   the w0 variable. Presumably, the LO register contains a part of the
   result of the multiplication. The "l" is called a constraint, and is
   described at
   http://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Constraints
   (section on MIPS).

 * Similarly, the "=h" (w1) tells gcc to put the contents of the HI
   register into the w1 variable. The gcc documentation say that this
   constraint is no longer supported, so probably the problem is here.

 * the part after the second colon is the list of input registers.

 * the "d" (u) and "d" (v) tell gcc to store the values of variables u
   and v into two "address registers", and use those registers instead
   of %2 and %3 in the instruction.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
