From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sat, 26 Oct 2019 09:01:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: fix macro expansion
 error for RISC-V with musl
In-Reply-To: <20191025214328.48a8207e@windsurf.dhcp.lyon.intranet>
References: <20191025095605.17673-1-mark.corbin@embecosm.com>
 <20191025214328.48a8207e@windsurf.dhcp.lyon.intranet>
Message-ID: <21295920-9ccf-62e0-7f72-3b1b1aee1183@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 25/10/2019 20:43, Thomas Petazzoni wrote:
> On Fri, 25 Oct 2019 10:56:05 +0100
> Mark Corbin <mark.corbin@embecosm.com> wrote:
>
>> The expansion of the SIGSEGV_FAULT_STACKPOINTER macro fails when
>> building for RISC-V with musl because REG_SP is not defined (it is
>> defined for glibc). This patch just replaces REG_SP with the
>> numerical register offset (which is 2 for the stack pointer).
> REG_SP is defined in musl in:
>
>   https://git.musl-libc.org/cgit/musl/tree/arch/riscv64/bits/reg.h
>
> So I'm not sure I'm following the reasoning here.

There are register definitions in reg.h, but these are not the ones used
by the signal header files in musl (arch/<build arch>/bits/signal.h). If
you want to index the registers array in the ucontext_t or mcontext_t
structures using a register name it needs to be defined at the top of
bits/signal.h (see the musl i386, m68k, x32 and x86_64 architectures).
Alternatively, for architectures that do not define register names in
the musl signal.h file, the registers array is indexed in libsigsegv
using a numeric offset (see libsigsegv-2.12/src/fault-linux-mips.h for
example).

There are two options to fix the current libsigsegv build issue for
RISC-V with musl (REG_SP undefined), either a) patch musl to add a
definition for REG_SP to signal.h or b) change REG_SP to a numeric value
of 2 in libsigsegv-2.12/src/fault-linux-riscv64.h (as proposed by this
patch).


Mark

-- 
-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
