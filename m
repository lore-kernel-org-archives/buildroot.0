From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:49:29 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] boost: fix static detection of lock-free atomic ints
In-Reply-To: <20180905105127.31591-1-fontaine.fabrice@gmail.com>
References: <20180905105127.31591-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010214929.5af0c4df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 12:51:27 +0200, Fabrice Fontaine wrote:
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
> 
> 0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
> gcc.compile.c++ bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o
> 
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"." -c -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o" "libs/system/src/error_code.cpp"
> 
> 0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
> SEM: <s>gcc-link-semaphore now used by <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
> Using shell: /bin/sh -c
>     argv[0] = '/bin/sh'
>     argv[1] = '-c'
>     argv[2] = '
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static
> '
> gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0
> 
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static
> 
> ld (ld-elf2flt): -shared used without passing a shared library ID
> collect2: error: ld a retourn? le statut de sortie 1
> 0.003123 sec system; 0.004732 sec user; 15.646509 sec clock
> ...failed gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0...
> 
> Due to this wrong detection, boost_atomic is wrongly selected by
> boost_thread which cause a build failure on missing select
> 
> To fix this, move the exe statement before the boost/thread project
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f46d38991385cbc2a4fa14eb31074e770cd79803
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Replace hack by a patch movin exe statement in the beginning of 
>    libs/thread/build/Jamfile.v2

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
