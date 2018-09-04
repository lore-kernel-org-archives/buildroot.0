From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Sep 2018 21:27:34 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fix static detection of lock-free
 atomic ints
Message-ID: <20180904192734.27206-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When build statically, boost is unable to detect lock-free atomics ints
because it tries to link dynamically, see
output/build/boost-1.67.0/bin.v2/config.log (with -d5 option):

Using shell: /bin/sh -c
    argv[0] = '/bin/sh'
    argv[1] = '-c'
    argv[2] = '
    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
'
gcc.compile.c++ bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o

    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"

0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
gcc.compile.c++ bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o

    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"." -c -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o" "libs/system/src/error_code.cpp"

0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
SEM: <s>gcc-link-semaphore now used by <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
Using shell: /bin/sh -c
    argv[0] = '/bin/sh'
    argv[1] = '-c'
    argv[2] = '
    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static
'
gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0

    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static

ld (ld-elf2flt): -shared used without passing a shared library ID
collect2: error: ld a retourn? le statut de sortie 1
0.003123 sec system; 0.004732 sec user; 15.646509 sec clock
...failed gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0...

Due to this wrong detection, boost_atomic is wrongly selected by
boost_thread which cause a build failure on missing select

Add a hack to fix this behavior in libs/thread/build/Jamfile.v2
as I'm not sufficiently knowledgeable in bjam to know why the
configuration is not correctly passed

Fixes:
 - http://autobuild.buildroot.net/results/bfc004ba10b50d4294be5ccd0abef7c00ed074d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b2605a70b7..fe986edb00 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -106,6 +106,16 @@ endif
 # variants. Override that if we want static only or shared only.
 ifeq ($(BR2_STATIC_LIBS),y)
 BOOST_OPTS += link=static runtime-link=static
+
+# When detecting features such as lockfree atomic ints, boost does not take into
+# account the configuration provided by the user. Indeed, boost does not specify
+# any value and as a result the default value (shared) is used
+define BOOST_FIX_STATIC_FEATURES_DETECTION
+$(SED) 's/has_atomic_flag_lockfree_test.cpp/has_atomic_flag_lockfree_test.cpp : <link>static <runtime-link>static/g;' \
+		$(@D)/libs/thread/build/Jamfile.v2
+endef
+
+BOOST_PRE_CONFIGURE_HOOKS += BOOST_FIX_STATIC_FEATURES_DETECTION
 else ifeq ($(BR2_SHARED_LIBS),y)
 BOOST_OPTS += link=shared runtime-link=shared
 endif
-- 
2.17.1
