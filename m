From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:20:21 +0100
Subject: [Buildroot] [git commit] package/sdl2: fix build without threads
Message-ID: <20200213221202.79BCF8E01B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38973acc7055f90f689bd81ffd4bd3ecede5d283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (not needed since bump to version 2.0.10 and
  https://github.com/spurious/SDL-mirror/commit/2601ef1f2d7f998c1d276d1b06cac4ed7feba2e1)
- Add a new patch to fix an outstanding build failure

Fixes:
 - http://autobuild.buildroot.org/results/7f7712c5bd47de4a3fcec1e0d0526fd5a3ecd532

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../sdl2/0001-fix-build-with-disable-threads.patch | 63 ----------------------
 ...nux-SDL_threadprio.c-fix-build-without-th.patch | 35 ++++++++++++
 2 files changed, 35 insertions(+), 63 deletions(-)

diff --git a/package/sdl2/0001-fix-build-with-disable-threads.patch b/package/sdl2/0001-fix-build-with-disable-threads.patch
deleted file mode 100644
index 81f7d7446f..0000000000
--- a/package/sdl2/0001-fix-build-with-disable-threads.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 26646028f79d7f3d857df9b46cd6d0285796c699 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 21 Nov 2018 22:31:09 +0100
-Subject: [PATCH] fix build with --disable-threads
-
-SDL_LinuxSetThreadPriority() has been added since version 2.0.9 and
-https://github.com/SDL-mirror/SDL/commit/f25a7fa870bdceb339e5105973f689606bcb9086
-
-However, this function is used in src/dynapi/SDL_dynapi_procs.h even
-when SDL_THREADS_DISABLED
-
-However, when SDL_THREADS_DISABLED is set, SDL_LinuxSetThreadPriority is
-not defined because thread/pthread/SDL_systhread.c is not built
-
-So check SDL_THREADS_DISABLED in addition to __LINUX__
-
-Fixes:
- - http://autobuild.buildroot.org/results/539cb9ab6c605dc6be73ebe90debab1a998f2451
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/SDL_system.h          | 4 ++--
- src/dynapi/SDL_dynapi_procs.h | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/SDL_system.h b/include/SDL_system.h
-index 4dc372d6b..0513d7fa5 100644
---- a/include/SDL_system.h
-+++ b/include/SDL_system.h
-@@ -77,7 +77,7 @@ extern DECLSPEC SDL_bool SDLCALL SDL_DXGIGetOutputInfo( int displayIndex, int *a
- 
- 
- /* Platform specific functions for Linux */
--#ifdef __LINUX__
-+#if defined(__LINUX__) && !defined(SDL_THREADS_DISABLED)
- 
- /**
-    \brief Sets the UNIX nice value for a thread, using setpriority() if possible, and RealtimeKit if available.
-@@ -86,7 +86,7 @@ extern DECLSPEC SDL_bool SDLCALL SDL_DXGIGetOutputInfo( int displayIndex, int *a
-  */
- extern DECLSPEC int SDLCALL SDL_LinuxSetThreadPriority(Sint64 threadID, int priority);
-  
--#endif /* __LINUX__ */
-+#endif /* defined(__LINUX__) && !defined(SDL_THREADS_DISABLED) */
- 	
- /* Platform specific functions for iOS */
- #if defined(__IPHONEOS__) && __IPHONEOS__
-diff --git a/src/dynapi/SDL_dynapi_procs.h b/src/dynapi/SDL_dynapi_procs.h
-index c95cf708b..ee9bf60a6 100644
---- a/src/dynapi/SDL_dynapi_procs.h
-+++ b/src/dynapi/SDL_dynapi_procs.h
-@@ -708,7 +708,7 @@ SDL_DYNAPI_PROC(SDL_bool,SDL_IsAndroidTV,(void),(),return)
- SDL_DYNAPI_PROC(double,SDL_log10,(double a),(a),return)
- SDL_DYNAPI_PROC(float,SDL_log10f,(float a),(a),return)
- SDL_DYNAPI_PROC(char*,SDL_GameControllerMappingForDeviceIndex,(int a),(a),return)
--#ifdef __LINUX__
-+#if defined(__LINUX__) && !defined(SDL_THREADS_DISABLED)
- SDL_DYNAPI_PROC(int,SDL_LinuxSetThreadPriority,(Sint64 a, int b),(a,b),return)
- #endif
- SDL_DYNAPI_PROC(SDL_bool,SDL_HasAVX512F,(void),(),return)
--- 
-2.17.1
-
diff --git a/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch b/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch
new file mode 100644
index 0000000000..1165edc661
--- /dev/null
+++ b/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch
@@ -0,0 +1,35 @@
+From cb51ec369186628e016a10ccf25b2b26d5d2ef85 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Feb 2020 21:31:36 +0100
+Subject: [PATCH] src/core/linux/SDL_threadprio.c: fix build without threads
+
+Add an include on SDL_error.h to avoid the following build failure
+without threads:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: build/.libs/SDL_threadprio.o: in function `SDL_LinuxSetThreadPriority_REAL':
+SDL_threadprio.c:(.text+0x0): undefined reference to `SDL_Unsupported'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7f7712c5bd47de4a3fcec1e0d0526fd5a3ecd532
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugzilla.libsdl.org/show_bug.cgi?id=4971]
+---
+ src/core/linux/SDL_threadprio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/core/linux/SDL_threadprio.c b/src/core/linux/SDL_threadprio.c
+index 162b1a3f1..2cbc4cb48 100644
+--- a/src/core/linux/SDL_threadprio.c
++++ b/src/core/linux/SDL_threadprio.c
+@@ -22,6 +22,7 @@
+ 
+ #ifdef __LINUX__
+ 
++#include "SDL_error.h"
+ #include "SDL_stdinc.h"
+ 
+ #if !SDL_THREADS_DISABLED
+-- 
+2.24.1
+
