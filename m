From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 7 Mar 2015 12:44:04 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling
	luajit
In-Reply-To: <CA+TH9Vk8eGbdW+X+NK=jkKeWRQO4MagfhU06P05HzP229zjDsQ@mail.gmail.com>
References: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
 <20150306195416.62f7424b@free-electrons.com>
 <CA+TH9Vm09qBNY2qrykL1zTe5JmPmiRObfg_-K1juURVSjWwvZA@mail.gmail.com>
 <54FA4B00.4000901@mind.be>
 <CA+TH9Vk8eGbdW+X+NK=jkKeWRQO4MagfhU06P05HzP229zjDsQ@mail.gmail.com>
Message-ID: <CA+TH9V=GWMch_yqBNcfvjXuW1oGWSgWEuvbwqtzTjQ-ptWVpzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout, Thomas,

Making that link manually

ln -s $PWD/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm
host/usr/include/asm

did the trick, but I cannot understand why it's not created
automatically. Can you point me where that link sould be created
(cannot find it by myself) so I can try to debug?

Thank you for your time!

2015-03-07 10:43 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Arnout Vandecappelle,
>
> 2015-03-07 1:49 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 06/03/15 22:52, Angelo Compagnucci wrote:
>> [snip]
>>> /usr/bin/make all "LJCORE_O=ljamalg.o"
>>> HOSTCC    host/minilua.o
>>> HOSTCC    host/buildvm_asm.o
>>> HOSTCC    host/buildvm_peobj.o
>>> HOSTCC    host/buildvm_lib.o
>>> HOSTCC    host/buildvm_fold.o
>>> CC        luajit.o
>>> In file included from /usr/include/bits/errno.h:24:0,
>>>                  from /usr/include/errno.h:35,
>>>                  from host/buildvm.h:13,
>>>                  from host/buildvm_asm.c:6:
>>> /usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
>>> file or directory
>>>  #include <asm/errno.h>
>>
>>  The error actually pertains to the compilation of host/buildvm_asm.o, which is
>> a host file not a target file. It helps to debug this kind of thing with
>> BR2_JLEVEL=1...
>
> Yes, I know, luajit is both an host and a target package. Whit
> BR2_JLEVEL=1 the output is:
>
>>>> luajit 2.0.3 Building
> /usr/bin/make -j1 PREFIX="/usr"
> STATIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
> DYNAMIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc
> -fPIC" TARGET_LD="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
> TARGET_AR="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-ar
> rcus" TARGET_STRIP=true TARGET_CFLAGS="-D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " TARGET_LDFLAGS=""
> HOST_CC="/usr/bin/gcc -m32" HOST_CFLAGS="-O2
> -I/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/include"
> HOST_LDFLAGS="-L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/lib
> -L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib
> -Wl,-rpath,/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib"
> BUILDMODE=dynamic -C
> /home/angelo/DEV/BUILDROOT/br_acqua_dev/build/luajit-2.0.3 amalg
> Building LuaJIT 2.0.3
> /usr/bin/make -C src amalg
> +--------------------------------------------------------------------------+
> | WARNING: Compiling the amalgamation needs a lot of virtual memory        |
> | (around 300 MB with GCC 4.x)! If you don't have enough physical memory   |
> | your machine will start swapping to disk and the compile will not finish |
> | within a reasonable amount of time.                                      |
> | So either compile on a bigger machine or use the non-amalgamated build.  |
> +--------------------------------------------------------------------------+
> /usr/bin/make all "LJCORE_O=ljamalg.o"
> HOSTCC    host/minilua.o
> In file included from /usr/include/bits/errno.h:24:0,
>                  from /usr/include/errno.h:35,
>                  from host/minilua.c:40:
> /usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
> file or directory
>  #include <asm/errno.h>
>                        ^
> compilation terminated.
> make[4]: *** [host/minilua.o] Error 1
> make[3]: *** [amalg] Error 2
> make[2]: *** [amalg] Error 2
> make[1]: *** [/home/angelo/DEV/BUILDROOT/br_acqua_dev/build/luajit-2.0.3/.stamp_built]
> Error 2
> make: *** [_all] Error 2
>
>
>>  It looks like there is something wrong with your system's toolchain
>> installation. There really should be a /usr/include/asm/errno.h. In a multilib
>> installation, asm is typically a symlink to <arch>/asm. Is it possible that this
>> symlink got removed by a botched package install?
>
> I just pulled from git, cleaned all with make distclean, loaded the
> previously attached .config and compiled.
> I'm using Linaro 2014.09 toolchain.
> Honestly there is no way I can have screwed up my installation,
> because it's cleanly pulled from git (rev.
> 591cb698d7768a52c1f1c527345782b500142edc).
>
> Hope this helps!
>
> Sincerely, Angelo
>
>>
>>
>>  Regards,
>>  Arnout
>>
>> [snip]
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
