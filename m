From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 09:19:10 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] boost: fix static detection of lock-free atomic ints
In-Reply-To: <20180904222820.22186-1-fontaine.fabrice@gmail.com>
References: <20180904222820.22186-1-fontaine.fabrice@gmail.com>
Message-ID: <20180905091910.535af5d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for investigating this issue, I know what it takes to dive into
the Boost build system, however, I am a bit confused by what's
happening.

On Wed,  5 Sep 2018 00:28:20 +0200, Fabrice Fontaine wrote:
> When build statically, boost is unable to detect lock-free atomics ints
> because it tries to link dynamically, see
> output/build/boost-1.67.0/bin.v2/config.log (with -d5 option):
> 
> Using shell: /bin/sh -c
>     argv[0] = '/bin/sh'
>     argv[1] = '-c'
>     argv[2] = '
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
> '
> gcc.compile.c++ bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o
> 
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"

So here, it is compiling (no linking) the
has_atomic_flag_lockfree_test.cpp test file into its corresponding
object file. It does not use -shared at this point.

> 0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
> gcc.compile.c++ bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o
> 
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"." -c -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o" "libs/system/src/error_code.cpp"

Here, it also compiles error_code.cpp into error_code.o, which I'm not
sure how it is related to the atomic stuff.

> 0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
> SEM: <s>gcc-link-semaphore now used by <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
> Using shell: /bin/sh -c
>     argv[0] = '/bin/sh'
>     argv[1] = '-c'
>     argv[2] = '
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static

And here it tries to produce a shared library,
libboost_system.so.1.67.0, which just the error_code.o object file in
it ?

Questions:

 - Why is Boost trying to _produce_ a shared library ?

 - How is producing a shared library from the error_code.o object file
   related to testing the availability of lock-free atomics ?

> +# When detecting features such as lockfree atomic ints, boost does not take into
> +# account the configuration provided by the user. Indeed, boost does not specify
> +# any value and as a result the default value (shared) is used
> +define BOOST_FIX_STATIC_FEATURES_DETECTION
> +$(SED) 's/has_atomic_flag_lockfree_test.cpp/has_atomic_flag_lockfree_test.cpp : <link>static <runtime-link>static/g;' \
> +		$(@D)/libs/thread/build/Jamfile.v2
> +endef

Have you reported the issue upstream to see what they have to say ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
