From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Nov 2014 17:33:35 +0100
Subject: [Buildroot] [git commit] arch/x86: get rid of
	BR2_GCC_TARGET_TUNE
In-Reply-To: <CABbD_XADwGBWc2YUpOz2tqnhzNbzumW4G++3xFSRCObqN_8ncg@mail.gmail.com>
 (=?utf-8?Q?=22K=C3=A1roly?= Kasza"'s message of "Fri, 7 Nov 2014 15:23:49
 +0100")
References: <20141106233447.1B0D4B1487@busybox.osuosl.org>
 <CABbD_XADwGBWc2YUpOz2tqnhzNbzumW4G++3xFSRCObqN_8ncg@mail.gmail.com>
Message-ID: <87r3xfug0w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "K?roly" == K?roly Kasza <kaszak@gmail.com> writes:

 > Hello all,
 > since this commit, GCC fails to build at the initial stage, with the i386 or
 > x86_x64 targets, if BR2_GCC_TARGET_ARCH is set to "generic".

 > 4.8 error message:
 > configure: error: cannot compute suffix of object files: cannot compile
 > 4.9 error message:
 > Unknown CPU given in --with-arch=generic.

 > I would substitute the "generic" variable with "" in arch/Config.in.x86, which
 > would?omit
 > HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 > in package/gcc/gcc.mk. That makes compiling gcc possible.
 > But that would also mean CC_TARGET_ARCH would also be blank in
 > toolchain-external.mk, omitting
 > TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_).

 > I guess omitting a parameter, or setting it to "generic" _should_ mean the
 > same, but I'm not sure.

It looks like you are right. From
https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options:

-mtune=cpu-type
    Tune to cpu-type everything applicable about the generated code,
    except for the ABI and the set of available instructions. While
    picking a specific cpu-type schedules things appropriately for that
    particular chip, the compiler does not generate any code that cannot
    run on the default machine type unless you use a -march=cpu-type
    option. For example, if GCC is configured for i686-pc-linux-gnu then
    -mtune=pentium4 generates code that is tuned for Pentium 4 but still
    runs on i686 machines.

    The choices for cpu-type are the same as for -march. In addition,
    -mtune supports 2 extra choices for cpu-type:

    ?generic?
        Produce code optimized for the most common IA32/AMD64/EM64T
        processors. If you know the CPU on which your code will run,
        then you should use the corresponding -mtune or -march option
        instead of -mtune=generic. But, if you do not know exactly what
        CPU users of your application will have, then you should use
        this option.

        As new processors are deployed in the marketplace, the behavior
        of this option will change. Therefore, if you upgrade to a newer
        version of GCC, code generation controlled by this option will
        change to reflect the processors that are most common at the
        time that version of GCC is released.

        There is no -march=generic option because -march indicates the
        instruction set the compiler can use, and there is no generic
        instruction set applicable to all processors. In contrast,
        -mtune indicates the processor (or, in this case, collection of
        processors) for which the code is optimized.

So we shouldn't pass -march=generic. I'm not sure it even makes sense to
have the BR2_x86_generic option.

Thomas, Yann - Any comments?

-- 
Venlig hilsen,
Peter Korsgaard 
