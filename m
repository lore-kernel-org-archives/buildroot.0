From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 19 Jun 2008 07:52:54 +0200
Subject: [Buildroot] [BR-AVR32] Debugging VICE emulator for AVR32
In-Reply-To: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
References: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
Message-ID: <1213854774.6777.7.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-06-18 at 21:44 -0400, John Voltz wrote:
> Hi,
> 
> For some time now, I have been trying to debug the VICE emulator in
> buildroot. There seems to be a problem with uClibc 0.9.29. VICE will
> not start on x86 or on AVR32, but it would run in the past on uClibc
> 0.9.28. In fact, the old binary of VICE that I built for 0.9.28 will
> run with 0.9.29. I find that strange. I'm hoping someone can help me
> make sense of the gdb info. Here is where the segfault occurs
> immediately after starting VICE on AVR32:
> 

Do you know exactly where it segfaults? Which line in the assembler dump
below? Which toolchain are you using? I would recommend using the
toolchain in the latest Buildroot for AVR32 v2.2.0-rc3.

>     0x2ada63d4    <_pthread_cleanup_push_defer>:            pushm r4-r7,lr
> -    0x2ada63d6    <_pthread_cleanup_push_defer+2>:        lddpc r6,0x2ada63f0 <_pthread_cleanup_push_defer+28>
> -    0x2ada63d8    <_pthread_cleanup_push_defer+4>:        rsub r6,pc

Putting GOT pointer in r6.

> -    0x2ada63da    <_pthread_cleanup_push_defer+6>:        mov r8,18
> -    0x2ada63de    <_pthread_cleanup_push_defer+10>:        ld.w r8,r6[r8<<0x2]

Fetch a pointer from the GOT with offset 0x48 (18 << 0x02).

> -    0x2ada63e2    <_pthread_cleanup_push_defer+14>:        ld.w r8,r8[172]

Then load something from an offset from the loaded pointer, accessing a
struct perhaps? Does not seem like r8 is zero at this point, given your
register dump below.

> -    0x2ada63e6    <_pthread_cleanup_push_defer+18>:        cp.w r8,0

Compare it to zero, function pointer?

> -    0x2ada63e8    <_pthread_cleanup_push_defer+20>:        breq 0x2ada63ec <_pthread_cleanup_push_defer+24>
> -    0x2ada63ea    <_pthread_cleanup_push_defer+22>:        icall r8

Jump to the fetched function(?).

> -    0x2ada63ec    <_pthread_cleanup_push_defer+24>:        popm r4-r7,pc

Return

> -    0x2ada63ee    <_pthread_cleanup_push_defer+26>:        add r0,r0

Alignment of local function data.

> -    0x2ada63f0    <_pthread_cleanup_push_defer+28>:        *unknown*
> -    0x2ada63f2    <_pthread_cleanup_push_defer+30>:        breq 0x2ada6482 <__libc_pthread_init+38>
> 

Address of the GOT pointer.

Do not really see anything immediate wrong with this code.

> Register contents:
> r0    {0x0}
> r1    {0x2adddffc}
> r2    {0x2adde000}
> r3    {0x2adddff8}
> r4    {0x7fc6b688}
> r5    {0x0}
> r6    {0x2ada9f58}
> r7    {0x2add82e0}
> r8    {0x2ada63d4}
> r9    {0x0}
> r10    {0x2adab600}
> r11    {0x2ada6338}
> r12    {0x7fc6b64c}
> sp    {0x7fa6e010}
> lr    {0x2ada63ec}
> pc    {0x2ada63d4}
> 

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
