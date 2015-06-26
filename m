From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:38:28 +0200
Subject: [Buildroot] [git commit] package/opencv: bump to version 3.0
Message-ID: <20150626183909.66429807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9043951b93d206363fd8fda6863fc0259b90858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
3.0.

OpenCV-2.4.11 improves a lot the Buildroot integration, including a
couple of patches that are no longer needed:
- x86 PIC code compilation fix in core module [1];
- return type fix in superes module [2];
- opencv.pc generation [3].

It also improves the gstreamer-0.10/1.x detection [4], that will be
needed in a follow-up patch.

OpenCV-3.0 still requires 2 patches (backported from upstream fixing
pthread support [5,6].

The OpenCV-3.0 does some major changes, for which a transition guide
has been published [7].

Among these changes coming with OpenCV-3.0, some new modules have been
introduced and others got removed; leading to a bunch of configure
option updates (to keep as much as possible an iso-functional-perimeter)
and the legacy menu has been updated too.
The worth noticing removals being:
- the opencv_legacy and opencv_nonfree modules no longer exist;
- the opencv_contrib module has moved out of the opencv base tree and
  now has its own repository [8].
  There is currently no plan to support it.

Some 3rd-party supports have been improved or added; their integrations
in Buildroot will be addressed in follow-up patches.

[1] https://github.com/Itseez/opencv/commit/ea50be0529c248961e1b66293f8a9e4b807294a6
[2] https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4
[3] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
[4] https://github.com/Itseez/opencv/commit/38bb0db9dbec08666c8a64b3e4ead8fadf15c980
[5] https://github.com/Itseez/opencv/commit/1f983ec39c97298b0c8ce409a1cc229ecf14e55c
[6] https://github.com/Itseez/opencv/commit/a482dcce464acbd5368fb93c6c3d52ba8401776a
[7] http://docs.opencv.org/master/db/dfa/tutorial_transition_guide.html
[8] https://github.com/itseez/opencv_contrib

[Thomas:
  - address most contents made by Yann E. Morin on the Config.in file.]

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   32 +++
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |   62 ++++++
 .../0001-core-fix-x86-PIC-code-compilation.patch   |   49 -----
 ...002-fix-support-for-pthreads-parallel_for.patch |  212 ++++++++++++++++++++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |   40 ----
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch |  156 --------------
 package/opencv/Config.in                           |   54 +++---
 package/opencv/opencv.mk                           |   86 +++++++--
 8 files changed, 405 insertions(+), 286 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9b9fff0..d86d585 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -113,6 +113,38 @@ config BR2_TARGET_UBOOT_NETWORK
 	help
 	  U-Boot's custom network settings options have been removed.
 
+config BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	bool "opencv contrib module no longer exists"
+	select BR2_LEGACY
+	help
+	  OpenCV >=3.0 does not come with in-tree contrib modules.
+
+	  They have been moved out of the OpenCV base tree, into the opencv_contrib
+	  repository:
+	    https://github.com/Itseez/opencv_contrib
+
+config BR2_PACKAGE_OPENCV_LIB_GPU
+	bool "opencv gpu module no longer exists"
+	select BR2_LEGACY
+	help
+	  opencv_gpu module no longer exists as is in OpenCV >=3.0.
+
+	  It has been split into several modules prefixed with "cuda" that require
+	  Cuda programming toolkit, which is not available in Buildroot. So cuda
+	  modules are forcibly disabled in Buildroot.
+
+config BR2_PACKAGE_OPENCV_LIB_LEGACY
+	bool "opencv legacy module no longer exists"
+	select BR2_LEGACY
+	help
+	  opencv_legacy module no longer exists in OpenCV >=3.0.
+
+config BR2_PACKAGE_OPENCV_LIB_NONFREE
+	bool "opencv nonfree module no longer exists"
+	select BR2_LEGACY
+	help
+	  opencv_nonfree module no longer exists in OpenCV >=3.0.
+
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
diff --git a/package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch b/package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
new file mode 100644
index 0000000..2be8f33
--- /dev/null
+++ b/package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
@@ -0,0 +1,62 @@
+Backport from https://github.com/Itseez/opencv/commit/1f983ec39c97298b0c8ce409a1cc229ecf14e55c
+
+From 1f983ec39c97298b0c8ce409a1cc229ecf14e55c Mon Sep 17 00:00:00 2001
+From: Maksim Shabunin <maksim.shabunin@itseez.com>
+Date: Tue, 9 Jun 2015 13:59:48 +0300
+Subject: [PATCH] Fixed compilation of pthread-based parallel_for with gcc
+ 4.4.3
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ modules/core/src/parallel.cpp | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/modules/core/src/parallel.cpp b/modules/core/src/parallel.cpp
+index b1e7567..0b593ee 100644
+--- a/modules/core/src/parallel.cpp
++++ b/modules/core/src/parallel.cpp
+@@ -132,8 +132,14 @@
+ namespace cv
+ {
+     ParallelLoopBody::~ParallelLoopBody() {}
++#if defined HAVE_PTHREADS && HAVE_PTHREADS
++    void parallel_for_pthreads(const cv::Range& range, const cv::ParallelLoopBody& body, double nstripes);
++    size_t parallel_pthreads_get_threads_num();
++    void parallel_pthreads_set_threads_num(int num);
++#endif
+ }
+ 
++
+ namespace
+ {
+ #ifdef CV_PARALLEL_FRAMEWORK
+@@ -301,7 +307,7 @@ void cv::parallel_for_(const cv::Range& range, const cv::ParallelLoopBody& body,
+         }
+ 
+ #elif defined HAVE_PTHREADS
+-        void parallel_for_pthreads(const Range& range, const ParallelLoopBody& body, double nstripes);
++
+         parallel_for_pthreads(range, body, nstripes);
+ 
+ #else
+@@ -361,8 +367,6 @@ int cv::getNumThreads(void)
+ 
+ #elif defined HAVE_PTHREADS
+ 
+-        size_t parallel_pthreads_get_threads_num();
+-
+         return parallel_pthreads_get_threads_num();
+ 
+ #else
+@@ -424,8 +428,6 @@ void cv::setNumThreads( int threads )
+ 
+ #elif defined HAVE_PTHREADS
+ 
+-    void parallel_pthreads_set_threads_num(int num);
+-
+     parallel_pthreads_set_threads_num(threads);
+ 
+ #endif
+-- 
+2.4.4
+
diff --git a/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch b/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
deleted file mode 100644
index 9e8c2e9..0000000
--- a/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ea50be0529c248961e1b66293f8a9e4b807294a6 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 12 Oct 2014 10:17:23 +0200
-Subject: [PATCH] core: fix x86 PIC code compilation
-
-This bug was triggered by Buildroot autobuilders [1,2], causing this
-kind of failures [3,4]:
-
-  [ 14%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o
-  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp: In function '(static initializers for /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp)':
-  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp:280:10: error: inconsistent operand constraints in an 'asm'
-  make[3]: *** [modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o] Error 1
-
-[1] http://buildroot.org/
-[2] http://autobuild.buildroot.org/
-[3] http://autobuild.buildroot.org/?reason=opencv-2.4.10
-[4] http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- modules/core/src/system.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
-index 5a970d5..e9ffdc7 100644
---- a/modules/core/src/system.cpp
-+++ b/modules/core/src/system.cpp
-@@ -267,14 +267,17 @@ struct HWFeatures
-          : "cc"
-         );
-         #else
-+        // We need to preserve ebx since we are compiling PIC code.
-+        // This means we cannot use "=b" for the 2nd output register.
-         asm volatile
-         (
-          "pushl %%ebx\n\t"
-          "movl $7,%%eax\n\t"
-          "movl $0,%%ecx\n\t"
-          "cpuid\n\t"
-+         "movl %%ebx,%1\n\t"
-          "popl %%ebx\n\t"
--         : "=a"(cpuid_data[0]), "=b"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
-+         : "=a"(cpuid_data[0]), "=r"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
-          :
-          : "cc"
-         );
--- 
-2.1.2
-
diff --git a/package/opencv/0002-fix-support-for-pthreads-parallel_for.patch b/package/opencv/0002-fix-support-for-pthreads-parallel_for.patch
new file mode 100644
index 0000000..6eeb270
--- /dev/null
+++ b/package/opencv/0002-fix-support-for-pthreads-parallel_for.patch
@@ -0,0 +1,212 @@
+Backport from https://github.com/Itseez/opencv/commit/a482dcce464acbd5368fb93c6c3d52ba8401776a
+
+From a482dcce464acbd5368fb93c6c3d52ba8401776a Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@itseez.com>
+Date: Thu, 11 Jun 2015 16:53:07 +0300
+Subject: [PATCH] fix support for pthreads parallel_for
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt                         | 29 ++++++++++++++++++++++-------
+ cmake/OpenCVFindLibsPerf.cmake         | 14 +++++++++-----
+ cmake/templates/cvconfig.h.in          |  6 ++++++
+ modules/core/src/parallel.cpp          | 13 ++++++++-----
+ modules/core/src/parallel_pthreads.cpp |  2 +-
+ modules/core/src/precomp.hpp           |  6 ------
+ 6 files changed, 46 insertions(+), 24 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d9a17b3..27d8470 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -188,7 +188,7 @@ OCV_OPTION(WITH_QUICKTIME      "Use QuickTime for Video I/O insted of QTKit" OFF
+ OCV_OPTION(WITH_TBB            "Include Intel TBB support"                   OFF  IF (NOT IOS AND NOT WINRT) )
+ OCV_OPTION(WITH_OPENMP         "Include OpenMP support"                      OFF)
+ OCV_OPTION(WITH_CSTRIPES       "Include C= support"                          OFF  IF (WIN32 AND NOT WINRT)  )
+-OCV_OPTION(WITH_PTHREADS_PF    "Use pthreads-based parallel_for"             OFF  IF (NOT WIN32) )
++OCV_OPTION(WITH_PTHREADS_PF    "Use pthreads-based parallel_for"             ON   IF (NOT WIN32) )
+ OCV_OPTION(WITH_TIFF           "Include TIFF support"                        ON   IF (NOT IOS) )
+ OCV_OPTION(WITH_UNICAP         "Include Unicap support (GPL)"                OFF  IF (UNIX AND NOT APPLE AND NOT ANDROID) )
+ OCV_OPTION(WITH_V4L            "Include Video 4 Linux support"               ON   IF (UNIX AND NOT ANDROID) )
+@@ -1026,6 +1026,27 @@ if(DEFINED WITH_GPHOTO2)
+ endif(DEFINED WITH_GPHOTO2)
+ 
+ 
++# Order is similar to CV_PARALLEL_FRAMEWORK in core/src/parallel.cpp
++ocv_clear_vars(CV_PARALLEL_FRAMEWORK)
++if(HAVE_TBB)
++  set(CV_PARALLEL_FRAMEWORK "TBB (ver ${TBB_VERSION_MAJOR}.${TBB_VERSION_MINOR} interface ${TBB_INTERFACE_VERSION})")
++elseif(HAVE_CSTRIPES)
++  set(CV_PARALLEL_FRAMEWORK "C=")
++elseif(HAVE_OPENMP)
++  set(CV_PARALLEL_FRAMEWORK "OpenMP")
++elseif(HAVE_GCD)
++  set(CV_PARALLEL_FRAMEWORK "GCD")
++elseif(WINRT OR HAVE_CONCURRENCY)
++  set(CV_PARALLEL_FRAMEWORK "Concurrency")
++elseif(HAVE_PTHREADS_PF)
++  set(CV_PARALLEL_FRAMEWORK "pthreads")
++else()
++  set(CV_PARALLEL_FRAMEWORK "none")
++endif()
++status("")
++status("  Parallel framework:" TRUE THEN "${CV_PARALLEL_FRAMEWORK}" ELSE NO)
++
++
+ # ========================== Other third-party libraries ==========================
+ status("")
+ status("  Other third-party libraries:")
+@@ -1045,12 +1066,6 @@ status("    Use IPP Async:"  HAVE_IPP_A       THEN "YES" ELSE NO)
+ endif(DEFINED WITH_IPP_A)
+ 
+ status("    Use Eigen:"      HAVE_EIGEN       THEN "YES (ver ${EIGEN_WORLD_VERSION}.${EIGEN_MAJOR_VERSION}.${EIGEN_MINOR_VERSION})" ELSE NO)
+-status("    Use TBB:"        HAVE_TBB         THEN "YES (ver ${TBB_VERSION_MAJOR}.${TBB_VERSION_MINOR} interface ${TBB_INTERFACE_VERSION})" ELSE NO)
+-status("    Use OpenMP:"     HAVE_OPENMP      THEN YES ELSE NO)
+-status("    Use GCD"         HAVE_GCD         THEN YES ELSE NO)
+-status("    Use Concurrency" HAVE_CONCURRENCY THEN YES ELSE NO)
+-status("    Use C=:"         HAVE_CSTRIPES    THEN YES ELSE NO)
+-status("    Use pthreads for parallel for:"   HAVE_PTHREADS_PF THEN YES ELSE NO)
+ status("    Use Cuda:"       HAVE_CUDA        THEN "YES (ver ${CUDA_VERSION_STRING})" ELSE NO)
+ status("    Use OpenCL:"     HAVE_OPENCL      THEN YES ELSE NO)
+ 
+diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.cmake
+index bda5d79..d1bc541 100644
+--- a/cmake/OpenCVFindLibsPerf.cmake
++++ b/cmake/OpenCVFindLibsPerf.cmake
+@@ -120,12 +120,16 @@ if(WITH_OPENMP)
+   set(HAVE_OPENMP "${OPENMP_FOUND}")
+ endif()
+ 
+-if(UNIX OR ANDROID)
+-if(NOT APPLE AND NOT HAVE_TBB AND NOT HAVE_OPENMP)
+-  set(HAVE_PTHREADS_PF 1)
+-else()
+-  set(HAVE_PTHREADS_PF 0)
++if(NOT MSVC AND NOT DEFINED HAVE_PTHREADS)
++  set(_fname "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/pthread_test.cpp")
++  file(WRITE "${_fname}" "#include <pthread.h>\nint main() { (void)pthread_self(); return 0; }\n")
++  try_compile(HAVE_PTHREADS "${CMAKE_BINARY_DIR}" "${_fname}")
++  file(REMOVE "${_fname}")
+ endif()
++
++ocv_clear_vars(HAVE_PTHREADS_PF)
++if(WITH_PTHREADS_PF)
++  set(HAVE_PTHREADS_PF ${HAVE_PTHREADS})
+ else()
+   set(HAVE_PTHREADS_PF 0)
+ endif()
+diff --git a/cmake/templates/cvconfig.h.in b/cmake/templates/cvconfig.h.in
+index 4a1d1c6..3330774 100644
+--- a/cmake/templates/cvconfig.h.in
++++ b/cmake/templates/cvconfig.h.in
+@@ -139,6 +139,12 @@
+ /* PNG codec */
+ #cmakedefine HAVE_PNG
+ 
++/* Posix threads (pthreads) */
++#cmakedefine HAVE_PTHREADS
++
++/* parallel_for with pthreads */
++#cmakedefine HAVE_PTHREADS_PF
++
+ /* Qt support */
+ #cmakedefine HAVE_QT
+ 
+diff --git a/modules/core/src/parallel.cpp b/modules/core/src/parallel.cpp
+index 0b593ee..caa8129 100644
+--- a/modules/core/src/parallel.cpp
++++ b/modules/core/src/parallel.cpp
+@@ -80,6 +80,7 @@
+    4. HAVE_GCD         - system wide, used automatically        (APPLE only)
+    5. WINRT            - system wide, used automatically        (Windows RT only)
+    6. HAVE_CONCURRENCY - part of runtime, used automatically    (Windows only - MSVS 10, MSVS 11)
++   7. HAVE_PTHREADS_PF - pthreads if available
+ */
+ 
+ #if defined HAVE_TBB
+@@ -125,14 +126,14 @@
+ #  define CV_PARALLEL_FRAMEWORK "winrt-concurrency"
+ #elif defined HAVE_CONCURRENCY
+ #  define CV_PARALLEL_FRAMEWORK "ms-concurrency"
+-#elif defined HAVE_PTHREADS
++#elif defined HAVE_PTHREADS_PF
+ #  define CV_PARALLEL_FRAMEWORK "pthreads"
+ #endif
+ 
+ namespace cv
+ {
+     ParallelLoopBody::~ParallelLoopBody() {}
+-#if defined HAVE_PTHREADS && HAVE_PTHREADS
++#ifdef HAVE_PTHREADS_PF
+     void parallel_for_pthreads(const cv::Range& range, const cv::ParallelLoopBody& body, double nstripes);
+     size_t parallel_pthreads_get_threads_num();
+     void parallel_pthreads_set_threads_num(int num);
+@@ -306,7 +307,7 @@ void cv::parallel_for_(const cv::Range& range, const cv::ParallelLoopBody& body,
+             Concurrency::CurrentScheduler::Detach();
+         }
+ 
+-#elif defined HAVE_PTHREADS
++#elif defined HAVE_PTHREADS_PF
+ 
+         parallel_for_pthreads(range, body, nstripes);
+ 
+@@ -365,7 +366,7 @@ int cv::getNumThreads(void)
+         ? Concurrency::CurrentScheduler::Get()->GetNumberOfVirtualProcessors()
+         : pplScheduler->GetNumberOfVirtualProcessors());
+ 
+-#elif defined HAVE_PTHREADS
++#elif defined HAVE_PTHREADS_PF
+ 
+         return parallel_pthreads_get_threads_num();
+ 
+@@ -426,7 +427,7 @@ void cv::setNumThreads( int threads )
+                        Concurrency::MaxConcurrency, threads-1));
+     }
+ 
+-#elif defined HAVE_PTHREADS
++#elif defined HAVE_PTHREADS_PF
+ 
+     parallel_pthreads_set_threads_num(threads);
+ 
+@@ -452,6 +453,8 @@ int cv::getThreadNum(void)
+     return 0;
+ #elif defined HAVE_CONCURRENCY
+     return std::max(0, (int)Concurrency::Context::VirtualProcessorId()); // zero for master thread, unique number for others but not necessary 1,2,3,...
++#elif defined HAVE_PTHREADS_PF
++    return (int)(size_t)(void*)pthread_self(); // no zero-based indexing
+ #else
+     return 0;
+ #endif
+diff --git a/modules/core/src/parallel_pthreads.cpp b/modules/core/src/parallel_pthreads.cpp
+index 8c34959..091ea2d 100644
+--- a/modules/core/src/parallel_pthreads.cpp
++++ b/modules/core/src/parallel_pthreads.cpp
+@@ -42,7 +42,7 @@
+ 
+ #include "precomp.hpp"
+ 
+-#if defined HAVE_PTHREADS && HAVE_PTHREADS
++#ifdef HAVE_PTHREADS_PF
+ 
+ #include <algorithm>
+ #include <pthread.h>
+diff --git a/modules/core/src/precomp.hpp b/modules/core/src/precomp.hpp
+index d463126..88b60e4 100644
+--- a/modules/core/src/precomp.hpp
++++ b/modules/core/src/precomp.hpp
+@@ -292,12 +292,6 @@ TLSData<CoreTLSData>& getCoreTlsData();
+ #define CL_RUNTIME_EXPORT
+ #endif
+ 
+-#ifndef HAVE_PTHREADS
+-#if !(defined WIN32 || defined _WIN32 || defined WINCE || defined HAVE_WINRT)
+-#define HAVE_PTHREADS 1
+-#endif
+-#endif
+-
+ extern bool __termination; // skip some cleanups, because process is terminating
+                            // (for example, if ExitProcess() was already called)
+ 
+-- 
+2.4.4
+
diff --git a/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch b/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
deleted file mode 100644
index d71235d..0000000
--- a/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-superres: Fix return value VideoFrameSource_GPU
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 2e393ab83362743ba1825ad4b31d4a2925c606b4 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 27 Oct 2014 13:39:35 +0000
-Subject: [PATCH] superres: Fix return value VideoFrameSource_GPU
-
-superres module fails to compile with the following error messages:
-
-[100%] Building CXX object modules/superres/CMakeFiles/opencv_superres.dir/src/super_resolution.cpp.o
-/opencv-2.4.10/modules/superres/src/frame_source.cpp: In function 'cv::Ptr<cv::superres::FrameSource> cv::superres::createFrameSource_Video_GPU(const string&)':
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected type-specifier before 'VideoFrameSource'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: could not convert '(int*)operator new(4ul)' from 'int*' to 'cv::Ptr<cv::superres::FrameSource>'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected ';' before 'VideoFrameSource'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:41: error: 'VideoFrameSource' was not declared in this scope
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:264:1: error: control reaches end of non-void function [-Werror=return-type]
-cc1plus: some warnings being treated as errors
-make[3]: *** [modules/superres/CMakeFiles/opencv_superres.dir/src/frame_source.cpp.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-
-This is caused because the return value of the createFrameSource_Video_GPU function should be a VideoFrameSource_GPU object.
----
- modules/superres/src/frame_source.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/superres/src/frame_source.cpp b/modules/superres/src/frame_source.cpp
-index 5f59a98..c5b2e76 100644
---- a/modules/superres/src/frame_source.cpp
-+++ b/modules/superres/src/frame_source.cpp
-@@ -260,7 +260,7 @@ namespace
- 
- Ptr<FrameSource> cv::superres::createFrameSource_Video_GPU(const string& fileName)
- {
--    return new VideoFrameSource(fileName);
-+    return new VideoFrameSource_GPU(fileName);
- }
- 
- #endif // HAVE_OPENCV_GPU
diff --git a/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch b/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
deleted file mode 100644
index 768f08d..0000000
--- a/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From eceada586bbf18fc267e437522ec4f1f23ddc656 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 3 Oct 2014 00:32:40 +0200
-Subject: [PATCH] cmake/OpenCVGenPkgconfig.cmake: rework opencv.pc generation
-
-Using absolute path to locate the components in the "Libs:" field of the
-*.pc can badly break cross-compilation, especially when building
-statically linked objects.
-
-Indeed, pkg-config automatically replaces the '-I...' and '-L...' paths
-when the PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_LIBDIR environment
-variables are set [1]. This feature is very helpful and common in
-cross-compilation framework like Buildroot [2,3].
-
-When there are absolute paths in the *.pc files, pkg-config won't be
-able to do the path substitions for these paths when the afromentioned
-environment variables are set.
-In such case, since the prefix is the target one, not the sysroot one,
-these libraries' abolute paths will point to:
-- in the best case: a non-existing file (i.e. these files do not exists
-  on the host system;
-- at worst: the host system's libraries. This will make the linking
-  failed because these host system's libraries will most likely not be
-  build for the target architecture [4].
-
-So, this patch replace the components' absolute paths by the form:
-  -L<libdir> -l<libname>
-
-This way, the linker will be able to resolve each dependency path,
-whatever the kind of objects/build (shared object or static build) it
-is dealing with.
-
-Note that for static link, the library order does matter [5]. The order
-of the opencv components has been carefully chosen to comply with this
-requirement.
-
-Fixes #3931
-
-[1] http://linux.die.net/man/1/pkg-config
-[2] http://buildroot.org/
-[3] http://git.buildroot.net/buildroot/tree/package/pkgconf/pkg-config.in
-[4] http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/build-end.log
-[5] http://stackoverflow.com/questions/45135/linker-order-gcc
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
----
-Note: this patch properly applies on top of the master branch, though it
-      has been written on top of the 2.4 branch.
----
- cmake/OpenCVGenPkgconfig.cmake | 64 +++++++++++++++++++++++++++---------------
- 1 file changed, 42 insertions(+), 22 deletions(-)
-
-diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
-index fa57db9..183c56d 100644
---- a/cmake/OpenCVGenPkgconfig.cmake
-+++ b/cmake/OpenCVGenPkgconfig.cmake
-@@ -8,10 +8,6 @@
- #
- # ${BIN_DIR}/unix-install/opencv.pc -> For use *with* "make install"
- # -------------------------------------------------------------------------------------------
--set(prefix      "${CMAKE_INSTALL_PREFIX}")
--set(exec_prefix "\${prefix}")
--set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
--set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
- 
- if(CMAKE_BUILD_TYPE MATCHES "Release")
-   set(ocv_optkind OPT)
-@@ -35,42 +31,66 @@ ocv_list_reverse(OpenCV_LIB_COMPONENTS)
- ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
- 
- #build the list of components
--set(OpenCV_LIB_COMPONENTS_ "")
--foreach(CVLib ${OpenCV_LIB_COMPONENTS})
--  get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
--  get_filename_component(libname "${libpath}" NAME)
- 
--  if(INSTALL_TO_MANGLED_PATHS)
--    set(libname "${libname}.${OPENCV_VERSION}")
--  endif()
-+# Note:
-+#   when linking against static libraries, if libfoo depends on libbar, then
-+#   libfoo must come first in the linker flags.
-+
-+# world is a special target whose library should come first, especially for
-+# static link.
-+if(OpenCV_LIB_COMPONENTS MATCHES "opencv_world")
-+  list(REMOVE_ITEM OpenCV_LIB_COMPONENTS "opencv_world")
-+  list(INSERT OpenCV_LIB_COMPONENTS 0 "opencv_world")
-+endif()
-+
-+set(OpenCV_LIB_COMPONENTS_)
-+foreach(CVLib ${OpenCV_LIB_COMPONENTS})
- 
--  #need better solution....
--  if(libpath MATCHES "3rdparty")
--    set(installDir "share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
-+  get_target_property(libloc ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
-+  if(libloc MATCHES "3rdparty")
-+    set(libpath "\${exec_prefix}/share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
-   else()
--    set(installDir "${OPENCV_LIB_INSTALL_PATH}")
-+    set(libpath "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
-   endif()
-+  list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libpath}")
-+
-+  get_filename_component(libname ${CVLib} NAME_WE)
-+  string(REGEX REPLACE "^lib" "" libname "${libname}")
-+  list(APPEND OpenCV_LIB_COMPONENTS_ "-l${libname}")
- 
--  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
- endforeach()
- 
- # add extra dependencies required for OpenCV
--set(OpenCV_LIB_COMPONENTS ${OpenCV_LIB_COMPONENTS_})
- if(OpenCV_EXTRA_COMPONENTS)
-   foreach(extra_component ${OpenCV_EXTRA_COMPONENTS})
- 
--    if(extra_component MATCHES "^-[lL]" OR extra_component MATCHES "[\\/]")
--      set(maybe_l_prefix "")
-+    if(extra_component MATCHES "^-[lL]")
-+      set(libprefix "")
-+      set(libname "${extra_component}")
-+    elseif(extra_component MATCHES "[\\/]")
-+      get_filename_component(libdir "${extra_component}" PATH)
-+      list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}")
-+      get_filename_component(libname "${extra_component}" NAME_WE)
-+      string(REGEX REPLACE "^lib" "" libname "${libname}")
-+      set(libprefix "-l")
-     else()
--      set(maybe_l_prefix "-l")
-+      set(libprefix "-l")
-+      set(libname "${extra_component}")
-     endif()
--
--    set(OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS} ${maybe_l_prefix}${extra_component}")
-+    list(APPEND OpenCV_LIB_COMPONENTS_ "${libprefix}${libname}")
- 
-   endforeach()
- endif()
- 
-+list(REMOVE_DUPLICATES OpenCV_LIB_COMPONENTS_)
-+string(REPLACE ";" " " OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS_}")
-+
- #generate the .pc file
-+set(prefix      "${CMAKE_INSTALL_PREFIX}")
-+set(exec_prefix "\${prefix}")
-+set(libdir      "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
-+set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
-+
- if(INSTALL_TO_MANGLED_PATHS)
-   set(OPENCV_PC_FILE_NAME "opencv-${OPENCV_VERSION}.pc")
- else()
--- 
-2.4.1
-
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index e40437f..b327864 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -4,10 +4,15 @@ menuconfig BR2_PACKAGE_OPENCV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
 
+	  Note that the opencv_core module and the opencv_hal library
+	  are always built and installed, not matter which other
+	  modules are enabled below.
+
 	  http://opencv.org/
 
 if BR2_PACKAGE_OPENCV
@@ -20,12 +25,6 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	help
 	  Include opencv_calib3d module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	bool "contrib"
-	default y
-	help
-	  Include opencv_contrib module into the OpenCV build.
-
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
 	default y
@@ -38,40 +37,30 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 	help
 	  Include opencv_flann module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_GPU
-	bool "gpu"
-	help
-	  Include opencv_gpu module into the OpenCV build.
-
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
 	default y
 	help
 	  Include opencv_highgui module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	bool "imgproc"
+config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+	bool "imgcodecs"
 	default y
 	help
-	  Include opencv_imgproc module into the OpenCV build.
+	  Include opencv_imgcodecs module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_LEGACY
-	bool "legacy"
+config BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	bool "imgproc"
 	default y
 	help
-	  Include opencv_legacy module into the OpenCV build.
+	  Include opencv_imgproc module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
-	bool "ml (machine learning)"
+	bool "ml"
 	default y
 	help
 	  Include opencv_ml module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_NONFREE
-	bool "nonfree"
-	help
-	  Include opencv_nonfree module into the OpenCV build.
-
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
 	default y
@@ -86,6 +75,12 @@ config BR2_PACKAGE_OPENCV_LIB_PHOTO
 
 comment "opencv_python module requires numpy which is not yet available."
 
+config BR2_PACKAGE_OPENCV_LIB_SHAPE
+	bool "shape (shape descriptors and matchers)"
+	default y
+	help
+	  Include opencv_shape module into the OpenCV build.
+
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
 	default y
@@ -106,6 +101,12 @@ config BR2_PACKAGE_OPENCV_LIB_TS
 	help
 	  Include opencv_ts module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
+	bool "videoio (media i/o)"
+	default y
+	help
+	  Include opencv_videoio module into the OpenCV build.
+
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
 	default y
@@ -219,5 +220,8 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 
 endif # BR2_PACKAGE_OPENCV
 
-comment "opencv needs a toolchain w/ C++, NPTL, wchar"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+comment "opencv needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ee11220..7211c18 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.10
+OPENCV_VERSION = 3.0.0
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
@@ -12,19 +12,28 @@ OPENCV_LICENSE_FILES = LICENSE
 
 # OpenCV component options
 OPENCV_CONF_OPTS += \
+	-DBUILD_DOCS=OFF \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
 	-DBUILD_WITH_DEBUG_INFO=OFF
 
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
+OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
+else
+OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
+endif
+
 # OpenCV build options
 OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
+	-DENABLE_IMPL_COLLECTION=OFF \
 	-DENABLE_NOISY_WARNINGS=OFF \
 	-DENABLE_OMIT_FRAME_POINTER=ON \
 	-DENABLE_PRECOMPILED_HEADERS=OFF \
 	-DENABLE_PROFILING=OFF \
-	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
 
 # OpenCV link options
 OPENCV_CONF_OPTS += \
@@ -39,40 +48,61 @@ OPENCV_CONF_OPTS += \
 	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
+# * Modules on:
+#   - core: if not set, opencv does not build anything
+#   - hal: core's dependency
+# * Modules off:
+#   - android*: android stuff
+#   - apps: programs for training classifiers
+#   - java: java bindings
+#   - viz: missing VTK dependency
+#   - world: all-in-one module
+#
+# * Contrib modules from [1] are disabled:
+#   - opencv_contrib package is not available in Buildroot;
+#   - OPENCV_EXTRA_MODULES_PATH is not set.
+#
+# [1] https://github.com/Itseez/opencv_contrib
 OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_androidcamera=OFF \
 	-DBUILD_opencv_apps=OFF \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
-	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
 	-DBUILD_opencv_core=ON \
-	-DBUILD_opencv_dynamicuda=OFF \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
-	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
+	-DBUILD_opencv_hal=ON \
 	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
 	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
 	-DBUILD_opencv_java=OFF \
-	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
-	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
-	-DBUILD_opencv_ocl=OFF \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
-	-DBUILD_opencv_python=OFF \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=OFF \
+	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_viz=OFF \
 	-DBUILD_opencv_world=OFF
 
 # Hardware support options.
 #
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+# * fma3 and popcnt support is disabled because according to gcc manual [2], it
+#   is only available on x86_64 haswell, broadwell and knl architecture.
+#
+# [2] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
 OPENCV_CONF_OPTS += \
 	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
 	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DENABLE_FMA3=OFF \
+	-DENABLE_POPCNT=OFF \
 	-DENABLE_POWERPC=OFF \
 	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
@@ -83,6 +113,19 @@ OPENCV_CONF_OPTS += \
 
 # Cuda stuff
 OPENCV_CONF_OPTS += \
+	-DBUILD_CUDA_STUBS=OFF \
+	-DBUILD_opencv_cudaarithm=OFF \
+	-DBUILD_opencv_cudabgsegm=OFF \
+	-DBUILD_opencv_cudacodec=OFF \
+	-DBUILD_opencv_cudafeatures2d=OFF \
+	-DBUILD_opencv_cudafilters=OFF \
+	-DBUILD_opencv_cudaimgproc=OFF \
+	-DBUILD_opencv_cudalegacy=OFF \
+	-DBUILD_opencv_cudaobjdetect=OFF \
+	-DBUILD_opencv_cudaoptflow=OFF \
+	-DBUILD_opencv_cudastereo=OFF \
+	-DBUILD_opencv_cudawarping=OFF \
+	-DBUILD_opencv_cudev=OFF \
 	-DWITH_CUBLAS=OFF \
 	-DWITH_CUDA=OFF \
 	-DWITH_CUFFT=OFF
@@ -97,8 +140,10 @@ OPENCV_CONF_OPTS += \
 
 # Intel stuff
 OPENCV_CONF_OPTS += \
+	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
+	-DWITH_IPP_A=OFF \
 	-DWITH_TBB=OFF
 
 # Smartek stuff
@@ -112,10 +157,11 @@ OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
 
 # Non-Linux support (Android options) must remain OFF:
 OPENCV_CONF_OPTS += \
+	-DANDROID=OFF \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DBUILD_ANDROID_SERVICE=OFF \
 	-DBUILD_FAT_JAVA_LIB=OFF \
-	-DBUILD_JAVA_SUPPORT=OFF \
 	-DINSTALL_ANDROID_EXAMPLES=OFF \
 	-DWITH_ANDROID_CAMERA=OFF
 
@@ -130,15 +176,17 @@ OPENCV_CONF_OPTS += \
 	-DWITH_CSTRIPES=OFF \
 	-DWITH_DSHOW=OFF \
 	-DWITH_MSMF=OFF \
+	-DWITH_PTHREADS_PF=OFF \
 	-DWITH_VFW=OFF \
 	-DWITH_VIDEOINPUT=OFF \
 	-DWITH_WIN32UI=OFF
 
-# Software/3rd-party support options.
+# Software/3rd-party support options:
+# - disable all examples
 OPENCV_CONF_OPTS += \
+	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_JASPER=OFF \
 	-DBUILD_JPEG=OFF \
-	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
 	-DBUILD_OPENEXR=OFF \
 	-DBUILD_PNG=OFF \
 	-DBUILD_TIFF=OFF \
@@ -151,14 +199,20 @@ OPENCV_CONF_OPTS += \
 # - eigen: OpenCV does not use it, not take any benefit from it.
 OPENCV_CONF_OPTS += \
 	-DWITH_1394=OFF \
+	-DWITH_CLP=OFF \
 	-DWITH_EIGEN=OFF \
-	-DWITH_IMAGEIO=OFF \
+	-DWITH_GDAL=OFF \
+	-DWITH_GPHOTO2=OFF \
 	-DWITH_OPENCL=OFF \
+	-DWITH_OPENCL_SVM=OFF \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF \
 	-DWITH_OPENMP=OFF \
+	-DWITH_OPENNI2=OFF \
 	-DWITH_OPENNI=OFF \
 	-DWITH_UNICAP=OFF \
+	-DWITH_VTK=OFF \
+	-DWITH_WEBP=OFF \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
@@ -171,14 +225,14 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
 else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-OPENCV_CONF_OPTS += -DWITH_GTK=ON
+OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
 OPENCV_DEPENDENCIES += libgtk2
 else
 OPENCV_CONF_OPTS += -DWITH_GTK=OFF
