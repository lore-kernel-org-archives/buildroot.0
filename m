From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 10:59:57 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <20140306213113.GH3625@free.fr>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
Message-ID: <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 6, 2014 at 10:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-03-06 11:43 +0100, Fabio Porcedda spake thusly:
>> Hi all,
>> luajit fails to build on a Ubuntu 13.10 x86_64 with the following defconfig:
>>
>> BR2_x86_generic=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_LUAJIT=y
>>
>>
>> with the following build error:
>>
>> CC        luajit.o
>> HOSTLINK  host/minilua
>> /usr/bin/ld: skipping incompatible
>> /usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc.a when searching for -lgcc
>> /usr/bin/ld: cannot find -lgcc
>> /usr/bin/ld: skipping incompatible
>> /usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc_s.so when searching for
>> -lgcc_s
>> /usr/bin/ld: cannot find -lgcc_s
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [host/minilua] Error 1
>> make[2]: *** [amalg] Error 2
>> make[1]: *** [amalg] Error 2
>> make: *** [/e/buildroot/br-tmp/output/build/luajit-2.0.2/.stamp_built] Error 2
>
> Yes, that's somewhat expected.
>
> From luajit.mk:
>
>     # The luajit build procedure requires the host compiler to have the
>     # same bitness as the target compiler. Therefore, on a x86 build
>     # machine, we can't build luajit for x86_64, which is checked in
>     # Config.in. When the target is a 32 bits target, we pass -m32 to
>     # ensure that even on 64 bits build machines, a compiler of the same
>     # bitness is used. Of course, this assumes that the 32 bits multilib
>     # libraries are installed.
>
> I tries here, and I have a bigger problem (line continuations manually
> added for readability):
>
>     HOSTCC    host/minilua.o
>     /usr/bin/gcc -m32  -O2 -fomit-frame-pointer -Wall   -I. \
>         -DLUAJIT_TARGET=LUAJIT_ARCH_x86 -DLJ_ARCH_HASFPU=1  \
>         -DLJ_ABI_SOFT FP=0 -O2                              \
>         -I/home/ymorin/dev/buildroot/O/host/usr/include -c  \
>         -o host/minilua.o host/minilua.c
>     In file included from <command-line>:0:0:
>     /usr/include/stdc-predef.h:30:26: fatal error: bits/predefs.h: No such
>     file or directory
>      #include <bits/predefs.h>
>                               ^
>     compilation terminated.
>     make[4]: *** [host/minilua.o] Error 1
>     make[3]: *** [amalg] Error 2
>     make[2]: *** [amalg] Error 2
>     make[1]: *** [/home/ymorin/dev/buildroot/O/build/luajit-2.0.2/.stamp_built] Error 2
>     make: *** [_all] Error 2
>     Command exited with non-zero status 2
>
> And this can not work on a pure 64-bit system (aka, without the 32-bit
> legacy stuff).
>
> Note: my kernel does have 32-bit legacy support, but my system does not
> have the development (-dev stuff with headers and .so symlinks) userland
> installed, only the runtime. So I can actually _run_ 32-bit stuff, just
> not _generate_ any...
>
> Not sure how we can get away with this...

I think we have two choices:
 - add a check to test if 32bit compiler is installed and if not print
a clear message about the toolchain requirement
 - add (BR2_i386 && BR2_HOSTARCH='i386') to the config.in to exlude
such combination.

Regards
-- 
Fabio Porcedda
