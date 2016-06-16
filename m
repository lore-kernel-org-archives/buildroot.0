From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 14:15:08 +0200
Subject: [Buildroot] why enable arm soft-float toolchain configuration
 but still get hard float instruction
In-Reply-To: <CADUS3onZeBbpKf7BRiD7-bV2hL0FANnOsjkia2vKv_EOsQdKaw@mail.gmail.com>
References: <CADUS3onZeBbpKf7BRiD7-bV2hL0FANnOsjkia2vKv_EOsQdKaw@mail.gmail.com>
Message-ID: <20160616141508.08a16eb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 15:55:03 +0800, yoma sophian wrote:

> 0000ad30 <__sigsetjmp>:
>     ad30:       e59fc058        ldr     ip, [pc, #88]   ; ad90
> <__sigsetjmp+0x60>
>     ad34:       e79f200c        ldr     r2, [pc, ip]
>     ad38:       e1a0c000        mov     ip, r0
>     ad3c:       e1a0300d        mov     r3, sp
>     ad40:       e0233002        eor     r3, r3, r2
>     ad44:       e48c3004        str     r3, [ip], #4
>     ad48:       e02e3002        eor     r3, lr, r2
>     ad4c:       e48c3004        str     r3, [ip], #4
>     ad50:       e8ac0ff0        stmia   ip!, {r4, r5, r6, r7, r8, r9, sl, fp}
>     ad54:       e59f2030        ldr     r2, [pc, #48]   ; ad8c
> <__sigsetjmp+0x5c>
>     ad58:       e5922000        ldr     r2, [r2]
>     ad5c:       e3120040        tst     r2, #64 ; 0x40
>     ad60:       0a000000        beq     ad68 <__sigsetjmp+0x38>
>     ad64:       ecac8b10        vstmia  ip!, {d8-d15}
>     ad68:       e3120c02        tst     r2, #512        ; 0x200
>     ad6c:       0a000005        beq     ad88 <__sigsetjmp+0x58>

These two instructions test if your processor has iWMMXT extensions. If
it does, then it saves the iWMMXT registers, and if not, the following
instructions are skipped.

>     ad70:       ececa102        stfp    f2, [ip], #8
>     ad74:       ececb102        stfp    f3, [ip], #8
>     ad78:       ececc102        stfp    f4, [ip], #8
>     ad7c:       ececd102        stfp    f5, [ip], #8

You can read the corresponding source code from ./sysdeps/arm/setjmp.S
in the glibc C library:

#ifndef ARM_ASSUME_NO_IWMMXT
        tst     a3, #HWCAP_ARM_IWMMXT
        beq     .Lno_iwmmxt

        /* Save the call-preserved iWMMXt registers.  */
        /* Following instructions are wstrd wr10, [ip], #8 (etc.)  */
        sfi_breg r12, \
        stcl    p1, cr10, [\B], #8
        sfi_breg r12, \
        stcl    p1, cr11, [\B], #8
        sfi_breg r12, \
        stcl    p1, cr12, [\B], #8
        sfi_breg r12, \
        stcl    p1, cr13, [\B], #8
        sfi_breg r12, \
        stcl    p1, cr14, [\B], #8
        sfi_breg r12, \
        stcl    p1, cr15, [\B], #8
.Lno_iwmmxt:
#endif

In other words: I believe what you see is correct. You indeed have a
few instructions using the FPU when building in soft-float mode, but
they are not executed, unless you actually have a FPU.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
