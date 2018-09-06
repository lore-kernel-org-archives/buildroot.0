From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:05:45 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] boost: fix static detection of lock-free atomic ints
In-Reply-To: <20180905105127.31591-1-fontaine.fabrice@gmail.com>
References: <20180905105127.31591-1-fontaine.fabrice@gmail.com>
Message-ID: <20180906210545.6717e9ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks again for your work on this topic. However, I am sorry, but I
still don't understand :-/

On Wed,  5 Sep 2018 12:51:27 +0200, Fabrice Fontaine wrote:

> +When build statically, boost is unable to detect lock-free atomics ints
> +because it tries to link dynamically with boost_system, see

I don't see where it tries to link dynamically with boost_system.

> +Using shell: /bin/sh -c
> +    argv[0] = '/bin/sh'
> +    argv[1] = '-c'
> +    argv[2] = '
> +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
>
> +gcc.compile.c++ bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o
> +
> +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"

Here it builds the object file has_atomic_flag_lockfree_test.o, it uses
-static, there's no -shared or nothing really wrong here. This tests
succeeds, so lock-free atomic ints are available, we're all good.

It does *not* try to link against libboost_system at this point.

> +0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
> +gcc.compile.c++ bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o
> +
> +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"." -c -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o" "libs/system/src/error_code.cpp"
> +
> +0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
> +SEM: <s>gcc-link-semaphore now used by <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
> +Using shell: /bin/sh -c
> +    argv[0] = '/bin/sh'
> +    argv[1] = '-c'
> +    argv[2] = '
> +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static

Here is also does not try to link against libboost_system: it tries to
*generate* it!

The summarized command is "g++ -o libboost_system.so.1.67.0" so the
overall goal of the command is to *produce* libboost_system.so.1.67.0,
not to link against it.

> +ld (ld-elf2flt): -shared used without passing a shared library ID

Obviously, this fails because building shared libraries is not possible
in this static-only configuration.

But I fail to see the relation:

 - Between producing libboost_system.so and the "project boost/thread"
   thing

 - Between inverting "project boost/thread" and the
   atomic_flag_lock_free test and this issue disappearing.

This still feel very mysterious to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
