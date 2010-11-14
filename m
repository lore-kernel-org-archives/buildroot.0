From: Dan Engel <dengel@sourceharvest.com>
Date: Sun, 14 Nov 2010 08:05:46 -0500
Subject: [Buildroot] making buildroot for arm7tdmi static flat fails
In-Reply-To: <1289712490.19487.13.camel@cecilia.engel.home>
References: <1289712490.19487.13.camel@cecilia.engel.home>
Message-ID: <1289739946.19487.28.camel@cecilia.engel.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Sun, 2010-11-14 at 00:28 -0500, Dan Engel wrote:
> Hello, all.
> 
> I'm trying to make buildroot for the arm7tdmi (toolchain only, no
> busybox, kernel, etc.) on a basic x86 system, and I get this after a
> while of building:
> 
>   LN include/sys/prctl.h
>   LN include/sys/ptrace.h
>   LN include/sys/timerfd.h
>   LN include/sys/elf.h
>   LN include/sys/io.h
>   LN include/sys/procfs.h
>   LN include/sys/ucontext.h
>   LN include/sys/user.h
>   AS lib/crt1.o
> make[1]: *** No rule to make target `lib/crti.o'.  Stop.
> make[1]: Leaving directory
>
`/mnt/local/arm_toolchain/build/buildroot-2010.08/output/toolchain/uClibc-0.9.31'
> make: ***
>
[/mnt/local/arm_toolchain/build/buildroot-2010.08/output/toolchain/uClibc-0.9.31/.configured] Error 2
> 

I have a follow-up:

In the configuration that led to the above error, I had disabled global
constructors and destructors in the uclibc configuration ("make
uclibc-menuconfig").

If I first try to build with global constructors and destructors
enabled, it eventually gives an error (I think during gcc construction)
about missing __fini_array and __init_array stuff. If I then change the
configuration (using "make uclibc-menuconfig") to disable the global
ctors and dtors and type "make" again, it builds to completion.
Something in that two-step process gets me past the above error about
lib/crti.o.

However, when I try to compile and link a simple flat "hello," the
following happens:

dan at cecilia ~/tmp $ arm-linux-gcc -Wl,-elf2flt hello.c
/mnt/local/armtc/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real: error: no memory region specified for loadable section `.ARM.extab'
collect2: ld returned 1 exit status
dan at cecilia ~/tmp $ 

Does anyone have any idea what I'm missing?

Thanks,
-Dan
