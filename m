From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 11:59:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/libwebsockets: fix build with
 openssl and without threads
Message-ID: <20200103105951.1500818-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/6186b4718db285edadf7203d00ed72f8d76a31e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-build-with-openssl-and-without-th.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch

diff --git a/package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch b/package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch
new file mode 100644
index 0000000000..701a1cd67a
--- /dev/null
+++ b/package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch
@@ -0,0 +1,90 @@
+From 8d8bd8a8a09d2d9e937aee8c3e2b69810aa710fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 Jan 2020 00:40:54 +0100
+Subject: [PATCH] CMakeLists.txt: fix build with openssl and without threads
+
+Since version 3.1.0 and commit aa4143aebdb59f4f21094781fb3b6ab4649643a6,
+-pthread is unconditionally added to CMAKE_REQUIRED_FLAGS even if
+pthread.h is not found, this will result in a build failure with openssl
+if the toolchain doesn't support threads:
+
+[  5%] Building C object CMakeFiles/websockets_shared.dir/lib/core/lws_dll2.c.o
+In file included from /home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/include/libwebsockets.h:570,
+                 from /home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/lib/core/private.h:130,
+                 from /home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/lib/core/lws_dll2.c:22:
+/home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/include/libwebsockets/lws-genhash.h:79:18: error: field 'ctx' has incomplete type
+         HMAC_CTX ctx;
+                  ^~~
+
+This build failure is raised because openssl functions are not correcly
+detected:
+
+Determining if the function SSL_CTX_set1_param exists failed with the following output:
+Change Dir: /home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/CMakeFiles/CMakeTmp
+
+Run Build Command(s):/usr/bin/make cmTC_06946/fast && make[1]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/CMakeFiles/CMakeTmp'
+/usr/bin/make -f CMakeFiles/cmTC_06946.dir/build.make CMakeFiles/cmTC_06946.dir/build
+make[2]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/libwebsockets-3.2.0/CMakeFiles/CMakeTmp'
+Building C object CMakeFiles/cmTC_06946.dir/CheckFunctionExists.c.o
+/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc --sysroot=/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot -DKEYWORD=__inline  -Wall -Wsign-compare -Wuninitialized -Werror  -Wundef  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os  -DCHECK_FUNCTION_EXISTS=SSL_CTX_set1_param -pthread  -DNDEBUG   -o CMakeFiles/cmTC_06946.dir/CheckFunctionExists.c.o   -c /home/buildroot/autobuild/instance-2/output-1/host/share/cmake-3.15/Modules/CheckFunctionExists.c
+Linking C executable cmTC_06946
+/home/buildroot/autobuild/instance-2/output-1/host/bin/cmake -E cmake_link_script CMakeFiles/cmTC_06946.dir/link.txt --verbose=1
+/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc --sysroot=/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wall -Wsign-compare -Wuninitialized -Werror  -Wundef  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os  -DCHECK_FUNCTION_EXISTS=SSL_CTX_set1_param -pthread  -DNDEBUG    CMakeFiles/cmTC_06946.dir/CheckFunctionExists.c.o  -o cmTC_06946 /home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libssl.so /home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libcrypto.so -lssl -lcrypto -lm -lcap
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
+collect2: error: ld returned 1 exit status
+CMakeFiles/cmTC_06946.dir/build.make:88: recipe for target 'cmTC_06946' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6186b4718db285edadf7203d00ed72f8d76a31e4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 888f65e8..4f731ca7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -929,21 +929,23 @@ CHECK_C_SOURCE_COMPILES("#include <stdint.h>
+ 		return 0;
+ 	}" LWS_HAS_INTPTR_T)
+ 
+-set(CMAKE_REQUIRED_FLAGS "-pthread")	
+-CHECK_C_SOURCE_COMPILES("#define _GNU_SOURCE 
+-	#include <pthread.h> 
+-	int main(void) { 
+-		pthread_t th = 0;
+-		pthread_setname_np(th, NULL);
+-		return 0;
+-	}" LWS_HAS_PTHREAD_SETNAME_NP)
+-
+-CHECK_C_SOURCE_COMPILES("#include <stddef.h>
+-	#include <getopt.h> 
+-	int main(void) { 
+-		void *p = (void *)getopt_long;
+-		return p != NULL;
+-	}" LWS_HAS_GETOPT_LONG)
++if (LWS_HAVE_PTHREAD_H) 
++	set(CMAKE_REQUIRED_FLAGS "-pthread")	
++	CHECK_C_SOURCE_COMPILES("#define _GNU_SOURCE 
++		#include <pthread.h> 
++		int main(void) { 
++			pthread_t th = 0;
++			pthread_setname_np(th, NULL);
++			return 0;
++		}" LWS_HAS_PTHREAD_SETNAME_NP)
++
++	CHECK_C_SOURCE_COMPILES("#include <stddef.h>
++		#include <getopt.h> 
++		int main(void) { 
++			void *p = (void *)getopt_long;
++			return p != NULL;
++		}" LWS_HAS_GETOPT_LONG)
++endif()
+ 
+ 
+ if (NOT PID_T_SIZE)
+-- 
+2.24.0
+
-- 
2.24.0
