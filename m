From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 14:24:25 +0100
Subject: [Buildroot] [PATCH] toolchain-external: Introduce gdb_copy
 option
In-Reply-To: <DM6PR12MB2876311450E0AA31BC3CA84CD94D0@DM6PR12MB2876.namprd12.prod.outlook.com>
References: <20191118080047.22036-1-Evgeniy.Didin@synopsys.com>
 <20191118091144.1407b93b@windsurf.home>
 <DM6PR12MB2876311450E0AA31BC3CA84CD94D0@DM6PR12MB2876.namprd12.prod.outlook.com>
Message-ID: <20191118142425.4a31a41d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

Top-posting on most open-source mailing list is not considered to be a
good practice. If possible, you should try to do bottom posting. Thanks!

On Mon, 18 Nov 2019 12:01:56 +0000
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> Using prebuilt toolchain besides the speedup of build has another advantage - in most cases that toolchain was well tested
> and guaranteed to work stable.

True.

> And without copything the prebuilt GDB debugger to target we need to build it from sources,
> which version is defined in package/gdb and most likely is different to prebuilt toolchain version. gdbserver ver. XXX may not be
> able to work with GDB ver. YYY.

Wait, this argument does not make sense: your patch is about copying
gdb to the target, so it is completely unrelated to gdbserver.

You can already today use the cross-gdb of the external toolchain
together with the gdbserver of the external toolchain: it is precisely
because there is often some kind of version dependency between both
that we have a Buildroot option to copy the toolchain-provided
gdbserver to the target.

However your patch is about copying the full *target* gdb to the target
filesystem, which again is completely unrelated to gdbserver.

> In our case we have dynamically linked minimalistic GDB with only Libc components dependencies:
> --------------------------------8<--------------------------------
>  $ arc-linux-objdump  -hx gdb | grep  NEEDED
>   NEEDED               libdl.so.2
>   NEEDED               libstdc++.so.6
>   NEEDED               libm.so.6
>   NEEDED               libgcc_s.so.1
>   NEEDED               libc.so.6

This is true today for your specific toolchain, but it is very possible
that in the future you will enable support for ncurses/readline, for
python, for expat, or other features. And then it will simply not work.

> In linaro/arm/mips toolchains there is no prebuilt GDB debugger,
> so I guess we should add additional  conditional "depends on BR2_arc".
> Will it be acceptable?

I think I would only find it acceptable if there was a check that the
target gdb provided by the toolchain only had dependencies on the C
library (libdl, libstdc++, libm, libc, etc.), and no other dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
