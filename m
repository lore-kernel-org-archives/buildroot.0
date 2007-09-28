From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 18:28:08 +0200
Subject: [Buildroot] Building ARM with Soft-float
In-Reply-To: <1190969812.5322.96.camel@elrond.atmel.sweden>
References: <1190969812.5322.96.camel@elrond.atmel.sweden>
Message-ID: <1190996888.5322.198.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 10:56 +0200 skrev Ulf Samuelsson:
> Tried the Integrator-926ejs default.
> =>	This works:
> 

Beeing trying the ARM integrator softfloat the whole day.

Vanilla configuration works.
generic-arm, instead of arm926ejs works

oabi, instead of eabi, generates a new problem
which was not present a week ago.
The C compiler seems to be built with EABI...

My configuration is as follows
> grep ABI .config
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
> grep ABI toolchain_build_arm_nofpu/uClibc-0.9.29/.config
CONFIG_ARM_OABI=y
# CONFIG_ARM_EABI is not set
> grep abi .config
BR2_GNU_TARGET_SUFFIX="uclibc-linux-gnueabi"

I compile the file a.c:  

> cat a.c
#ifdef  __ARM_EABI__
#warning "EABI"
#endif
> ./arm-uclibc-linux-gnueabi-gcc a.c
a.c:2:2: warning: #warning "EABI"

Why is this?

This results in a failure, since
uClibc/include/bits/sysnum.h is generated from 
<kernel-header>/asm/arch/unistd.h
and if __ARM_EABI__ is set, then 
the Syscall numbers are wrong, and the 
_NR_syscall definition is not (base+113)
as it was one week ago
#define _NR_syscall  (<base>+113)
instead it is
#define _NR_syscall  _NR_syscall

so the build of syscalls.c in uClibc fails.

I can't see anything in the toolset which configures
the ABI for the compiler.



BR
Ulf Samuelsson



> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
