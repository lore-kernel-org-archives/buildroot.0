From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 5 Dec 2017 17:52:34 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <3fegfexqs4.ln2@ID-313208.user.individual.net>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
 <3fegfexqs4.ln2@ID-313208.user.individual.net>
Message-ID: <CAJtjsKbdPj+39gq+bK2trs86Os-osz72N_h4zbW0o+4nwBVdZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Dec 4, 2017 at 6:49 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Am Sun, 03 Dec 2017 10:59:05 +0100 schrieb Thomas Petazzoni:
>
>> Seems like host-zlib is needed.
>
> host-erlang depends on host-openssl which depends on host-zlib so this
> should not be the problem. Anyway I could reproduce the build error on a
> minimal Debian system which lacks a zlib-dev package, host-zlib was built
> by buildroot.
>
> More investigation is needed on my part, but for today I have no time
> left for this, sorry.
>

Thanks, I did the same (i.e., run it from a fresh debian-testing-amd64
chroot) and manage to reproduce the -lz error:
/usr/bin/gcc -c -o ../priv/obj/x86_64-pc-linux-gnu/trace_ip_drv.o
-DHAVE_CONFIG_H -Werror=undef -Werror=implicit -Werror=return-type
-Wall -Wstrict-prototypes -Wmissing-prototypes
-Wdeclaration-after-statement  -DUSE_THREADS -D_THREAD_SAFE
-D_REENTRANT -DPOSIX_THREADS -D_POSIX_THREAD_SAFE_FUNCTIONS -O2
-I/path/to/host/include
-I/path/to/build/host-erlang-20.0/erts/x86_64-pc-linux-gnu
-fno-tree-copyrename -I/path/to/host/include -D_GNU_SOURCE -fPIC -I./
-I/path/to/build/host-erlang-20.0/erts/emulator/beam
-I/path/to/build/host-erlang-20.0/erts/include
-I/path/to/build/host-erlang-20.0/erts/include/x86_64-pc-linux-gnu
-I/path/to/build/host-erlang-20.0/erts/include/internal
-I/path/to/build/host-erlang-20.0/erts/include/internal/x86_64-pc-linux-gnu
-I/path/to/build/host-erlang-20.0/erts/emulator/sys/unix
-I/path/to/build/host-erlang-20.0/erts/emulator/sys/common
-I../priv/obj/x86_64-pc-linux-gnu
-I/path/to/build/host-erlang-20.0/erts/emulator/x86_64-pc-linux-gnu
trace_ip_drv.c
/usr/bin/gcc -shared -Wl,-Bsymbolic -o
../priv/lib/x86_64-pc-linux-gnu/dyntrace.so
../priv/obj/x86_64-pc-linux-gnu/dyntrace.o -lz -lutil -ldl -lm
/usr/bin/ld: cannot find -lz
collect2: error: ld returned 1 exit status

It does have libz.so in the host so I think the issue is in one of
Erlang's makefiles. Their build architecture is a real mess and I'm
not sure how to fix it properly, but it clearly miss the HOST_LDFLAGS
when linking lib/runtime_tools/c_src/dyntrace.c

I try to add LDFLAGS="$(HOST_LDFLAGS)" to HOST_ERLANG_MAKE_OPTS and it
does solve this issue but fails later on:
/usr/bin/gcc  -fno-PIE  -Werror=undef -Werror=implicit
-Werror=return-type  -O3 -I/path/to/host/include
-I/path/to/build/host-erlang-20.0/erts/x86_64-pc-linux-gnu
-fno-tree-copyrename -I/path/to/host/include -D_GNU_SOURCE -DERTS_SMP
-DHAVE_CONFIG_H -Wall -Wstrict-prototypes -Wmissing-prototypes
-Wdeclaration-after-statement -DUSE_THREADS -D_THREAD_SAFE
-D_REENTRANT -DPOSIX_THREADS -D_POSIX_THREAD_SAFE_FUNCTIONS
-DERTS_DIRTY_SCHEDULERS   -Ix86_64-pc-linux-gnu/opt/smp -Ibeam
-Isys/unix -Isys/common -Ix86_64-pc-linux-gnu -Ipcre -Ihipe
-I../include -I../include/x86_64-pc-linux-gnu -I../include/internal
-I../include/internal/x86_64-pc-linux-gnu -c hipe/hipe_mkliterals.c -o
obj/x86_64-pc-linux-gnu/opt/smp/hipe_mkliterals.o
/usr/bin/gcc -L/path/to/host/lib -Wl,-rpath,/path/to/host/lib -o
/path/to/build/host-erlang-20.0/bin/x86_64-pc-linux-gnu/hipe_mkliterals.smp
obj/x86_64-pc-linux-gnu/opt/smp/hipe_mkliterals.o -lz -lutil -ldl -lm
/usr/bin/ld: obj/x86_64-pc-linux-gnu/opt/smp/hipe_mkliterals.o:
relocation R_X86_64_32 against `.rodata.str1.8' can not be used when
making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: Nonrepresentable section on output
collect2: error: ld returned 1 exit status

I stop here for today.
-- 
Johan
