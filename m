From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 20:56:43 +0100
Subject: [Buildroot] [git commit] package/librtlsdr: fix build failure
Message-ID: <20141214201845.8745D80405@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable run test for pthread detection.

In case of build with only static library, CMake fails to detect the
pthread library (-lpthread), so it falls back trying to link using
-pthread and execute the test program.

<snip>
  [...]
  -- Looking for include file pthread.h
  -- Looking for include file pthread.h - found
  -- Looking for pthread_create in pthreads
  -- Looking for pthread_create in pthreads - not found
  -- Looking for pthread_create in pthread
  -- Looking for pthread_create in pthread - not found
  -- Check if compiler accepts -pthread
  CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
     THREADS_PTHREAD_ARG (advanced)
  For details see /home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/TryRunResults.cmake
  -- Check if compiler accepts -pthread - no
  -- Found Threads: TRUE
  -- Udev rules not being installed, install them with -DINSTALL_UDEV_RULES=ON
  -- Building with kernel driver detaching disabled, use -DDETACH_KERNEL_DRIVER=ON to enable
  -- Building for version: 0.5.3 / 0.5.3
  -- Using install prefix: /usr
  -- Configuring incomplete, errors occurred!
  See also "/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeOutput.log".
  See also "/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeError.log".
</snip>

Here it fails because, in the CMake FindThreads.cmake file, the
'try_run' function is unconditionally called [1].

Also, the CMakeError.log gives more details why linking with -lpthread
fails:

<snip>
  [...]
  Run Build Command:"/usr/bin/make" "cmTryCompileExec3012181287/fast"
  make[1]: Entering directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  /usr/bin/make -f CMakeFiles/cmTryCompileExec3012181287.dir/build.make CMakeFiles/cmTryCompileExec3012181287.dir/build
  make[2]: Entering directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  /home/buildroot/instance-1/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp/CMakeFiles 1
  Building C object CMakeFiles/cmTryCompileExec3012181287.dir/CheckFunctionExists.c.o
  /home/buildroot/instance-1/output/host/usr/bin/arm-linux-gcc   -pipe -Os -static  -DCHECK_FUNCTION_EXISTS=pthread_create   -o CMakeFiles/cmTryCompileExec3012181287.dir/CheckFunctionExists.c.o   -c /home/buildroot/instance-1/output/host/usr/share/cmake-3.0/Modules/CheckFunctionExists.c
  Linking C executable cmTryCompileExec3012181287
  /home/buildroot/instance-1/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3012181287.dir/link.txt --verbose=1
  /home/buildroot/instance-1/output/host/usr/bin/arm-linux-gcc  -pipe -Os -static  -DCHECK_FUNCTION_EXISTS=pthread_create  -static  CMakeFiles/cmTryCompileExec3012181287.dir/CheckFunctionExists.c.o  -o cmTryCompileExec3012181287 -rdynamic -lpthread -Wl,-Bstatic -lusb-1.0 -Wl,-Bdynamic
  /home/buildroot/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(init.os): In function `__pthread_initialize_minimal':
  init.c:(.text+0x270): undefined reference to `__libc_setup_tls'
  collect2: error: ld returned 1 exit status
  CMakeFiles/cmTryCompileExec3012181287.dir/build.make:89: recipe for target 'cmTryCompileExec3012181287' failed
  make[2]: *** [cmTryCompileExec3012181287] Error 1
  make[2]: Leaving directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  Makefile:118: recipe for target 'cmTryCompileExec3012181287/fast' failed
  make[1]: *** [cmTryCompileExec3012181287/fast] Error 2
  make[1]: Leaving directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'

  Determining if compiler accepts -pthread returned PLEASE_FILL_OUT-FAILED_TO_RUN instead of 2. The compiler had the following output:
  Change Dir: /home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp

  Run Build Command:"/usr/bin/make" "cmTryCompileExec1361818630/fast"
  make[1]: Entering directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  /usr/bin/make -f CMakeFiles/cmTryCompileExec1361818630.dir/build.make CMakeFiles/cmTryCompileExec1361818630.dir/build
  make[2]: Entering directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  /home/buildroot/instance-1/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp/CMakeFiles 1
  Building C object CMakeFiles/cmTryCompileExec1361818630.dir/CheckForPthreads.c.o
  /home/buildroot/instance-1/output/host/usr/bin/arm-linux-gcc   -pipe -Os -static     -o CMakeFiles/cmTryCompileExec1361818630.dir/CheckForPthreads.c.o   -c /home/buildroot/instance-1/output/host/usr/share/cmake-3.0/Modules/CheckForPthreads.c
  Linking C executable cmTryCompileExec1361818630
  /home/buildroot/instance-1/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1361818630.dir/link.txt --verbose=1
  /home/buildroot/instance-1/output/host/usr/bin/arm-linux-gcc  -pipe -Os -static    -static  CMakeFiles/cmTryCompileExec1361818630.dir/CheckForPthreads.c.o  -o cmTryCompileExec1361818630 -rdynamic -pthread
  make[2]: Leaving directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
  make[1]: Leaving directory '/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeTmp'
</snip>

While falling back on -pthread is correct when using only static
libraries to get some tls-related macros defined [2,3], it is wrong to
try to run the test program in case of cross-compilation.

So, this patch only disable run test when pthread support is done using
-pthread, i.e. in case of the type of libraries is "static only".

Fixes:
  http://autobuild.buildroot.org/results/26c/26cb8c2e5f867d49451f61304bf0a1a6f7b825d9/

[1] http://www.cmake.org/gitweb?p=cmake.git;a=blob;f=Modules/FindThreads.cmake;h=a0bc4d133eb3f9d3ae096f0e03e419ef7be66ce8;hb=HEAD#l84
[2] http://lists.busybox.net/pipermail/buildroot/2014-June/100690.html
[3] http://stackoverflow.com/questions/23250863/difference-between-pthread-and-lpthread-while-compiling

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librtlsdr/librtlsdr.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 2c5cf1f..51ecabe 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -19,4 +19,15 @@ ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
 LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
 endif
 
+# In case of static-lib-only builds, CMake's FindThreads.cmake code tries to
+# get the right flags, checking first for -lpthreads, then -lpthread, and lastly
+# for -pthread.
+# The 2 first link checks fail because of undefined symbols: __libc_setup_tls.
+# In the later check, CMake successfully compiles and links the test program,
+# but it also tries to run it, which is wrong when cross-compiling.
+#
+# The following CMake variable only disables the TRY_RUN call in the -pthread
+# test.
+LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 $(eval $(cmake-package))
