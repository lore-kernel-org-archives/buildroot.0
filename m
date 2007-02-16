From: Michel Benoit <murpme@gmail.com>
Date: Fri, 16 Feb 2007 13:41:07 +0100
Subject: [Buildroot] mmap uClibc built with buildroot
Message-ID: <c88e466f0702160441u407ce9d4t3edc33575bf6d29@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

When building uClibc (both latest and 0.9.28.1) for my arm platform
(at91sam9260), it seems to be set up to use the old mmap1() instead of
the newer mmap2().

I'm trying to implement a little bit of code to tweak the hw registers
on my SoC according to
http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2002-February/007777.html
but when i run the code with strace I get the following output:

open("/dev/mem", O_RDWR|O_SYNC)         = 4
old_mmap()                              = -1 EFAULT (Bad address)

Some nice folks on the arm linux kernel list informed me that I need
to be using the newer mmap2() for this to work.

I found some emails about mmap on arm in the buildroot archive but
they seemed to be related to fixes in order to get mmap to work with
EABI builds.

The related code seems to be in the file syslibc/linux/arm/mmap64.c:

	stmfd	sp!, {r4, r5, lr}
	ldr	r5, [sp, $16]
	ldr	r4, [sp, $12]
	movs	ip, r5, lsl $20		@ check that offset is page-aligned
	bne	.Linval
	ldr	ip, [sp, $20]
	mov	r5, r5, lsr $12
	orr	r5, r5, ip, lsl $20	@ compose page offset
	movs	ip, ip, lsr $12
	bne	.Linval			@ check for overflow
	mov	ip, r0
	DO_CALL (mmap2)
	cmn	r0, $4096
	ldmccfd	sp!, {r4, r5, pc}
	cmn	r0, $ENOSYS
	ldmnefd	sp!, {r4, r5, lr}
	bne	__error
	/* The current kernel does not support mmap2.  Fall back to plain
	   mmap if the offset is small enough.  */
	ldr	r5, [sp, $20]
	mov	r0, ip			@ first arg was clobbered
	teq	r5, $0
	ldmeqfd	sp!, {r4, r5, lr}
	beq	HIDDEN_JUMPTARGET(mmap)
.Linval:
	mov	r0, $-EINVAL
	ldmfd	sp!, {r4, r5, lr}
	b	__error

__error:
	b	__syscall_error


Is this the right place to be looking ?

Is there an obvious reason why the DO_CALL (mmap2) fails?

Are there any config parameters or settings for uClibc that need to be
set/unset in order to use mmap2?

Best regards,

Michel
Stockholm, Sweden
