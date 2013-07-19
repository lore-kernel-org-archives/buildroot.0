From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jul 2013 20:11:53 +0200
Subject: [Buildroot] EABIhf: breaks kernel build
In-Reply-To: <20130719161733.GC3751@free.fr>
References: <20130719161733.GC3751@free.fr>
Message-ID: <20130719181153.GD3751@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-19 18:17 +0200, Yann E. MORIN spake thusly:
> Since the ARM EABIhf stuff was committed, the Linux kernel build is
> broken, and fails with this message:
>     armv6-rpi36-linux-gnueabi-gcc: error: -mfloat-abi=soft and
>     -mfloat-abi=hard may not be used together
> 
> This is because -mfloat-abi=hard is hard-coded in the wrapper, but the
> kernel wants to pass -msoft-float.
> 
> See attach exerpt of my build log (with a instrumented ext-ttolchain
> wrapper). Notice argv[6] and argv[41]:
> 
>     argv[6]='-mfloat-abi=hard'
>     argv[41]='-msoft-float'
> 
> argv[6] is out hard-coded float ABI option, while argv[41] is passed by
> the kernel.
> 
> I don't know how to solve this.
> 
> The trivial and immediate idea would be to have a black-list of
> arguments and exclude the ones we pass that conflict with the ones
> passed on the command line, but this will be *very* complex and always
> incomplete.
> 
> An alternate idea would be to detect we're building a Linux kernel by
> looking at -D__KERNEL__ in the command line arguments, and if so, not
> pass our hard-coded args. This would work for the Linux kernel, but
> would break for other packages (eg. U-Boot?).
> 
> Another way would be to look at the environment and check if a variable
> is set (eg. BR_IN_KERNEL_OR_UBOOT_OR_WHATEVER) and in this case not pass
> our hard-coded options. While it would work from inside Buildroot, it
> would break as soon as the user would want to use the toolchain directly
> from outside Buildroot.
> 
> Or simply not pass -mfloat-abi=hard at all.

One way which would solve my special case would be to only pass the
sysroot in the wrapper, since my toolchain is already optimised by
default for my target.

So, an option like (give another!):

    config BR2_TOOLCHAIN_WRAPPER_SYSROOT_ONLY
        bool "External toolchain is already optimised for the target"
        help
          Say 'Y' here if your external toolchain is configured to
          emit optimised code for your target.

          If it is not the case, or you are unsure, say 'N', the default.

Then guard the extra hard-coded args between #ifdef...#endif, keeping
only the sysroot arg.

No, this is not the solution at all. But at least it would work when the
external toolchain has been tailored for the target in the first place.

For now, I've just guarded all float-related args between:
    #if defined NOT_DEFINED
    ...
    #endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
