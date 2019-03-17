From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 16:32:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.12
Message-ID: <20190317153211.27782-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-initialization-in-test-iodelay.patch  | 65 -----------------
 .../jack2/0002-Improve-check-for-ucontext.patch    | 84 ----------------------
 ...ace-support-depends-on-execinfo.h-existen.patch | 67 -----------------
 .../0004-tests-define-__STDC_LIMIT_MACROS.patch    | 41 -----------
 package/jack2/0005-gcc7.patch                      | 31 --------
 package/jack2/0006-fix-ftbfs-with-clang.patch      | 28 --------
 package/jack2/jack2.hash                           |  2 +-
 package/jack2/jack2.mk                             |  2 +-
 8 files changed, 2 insertions(+), 318 deletions(-)
 delete mode 100644 package/jack2/0001-Fix-initialization-in-test-iodelay.patch
 delete mode 100644 package/jack2/0002-Improve-check-for-ucontext.patch
 delete mode 100644 package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
 delete mode 100644 package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
 delete mode 100644 package/jack2/0005-gcc7.patch
 delete mode 100644 package/jack2/0006-fix-ftbfs-with-clang.patch

diff --git a/package/jack2/0001-Fix-initialization-in-test-iodelay.patch b/package/jack2/0001-Fix-initialization-in-test-iodelay.patch
deleted file mode 100644
index ee2493886b..0000000000
--- a/package/jack2/0001-Fix-initialization-in-test-iodelay.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From ff1ed2c4524095055140370c1008a2d9cccc5645 Mon Sep 17 00:00:00 2001
-From: Adrian Knoth <adi@drcomp.erfurt.thur.de>
-Date: Sat, 11 Jun 2016 05:35:07 +0200
-Subject: [PATCH] Fix initialization in test/iodelay.cpp
-
-jack_latency_range_t is
-
-struct _jack_latency_range {
-    jack_nframes_t min;
-    jack_nframes_t max;
-};
-
-and jack_nframes_t is
-
-typedef uint32_t        jack_nframes_t;
-
-so it's unsigned. Initialising it with -1 is invalid (at least in C++14). We cannot use {0, 0}, because latency_cb has
-
-   jack_latency_range_t range;
-   range.min = range.max = 0;
-   if ((range.min != capture_latency.min) || (range.max !=
-       capture_latency.max)) {
-       capture_latency = range;
-   }
-
-so we must not have {0, 0}, otherwise the condition would never be true.
-
-Using UINT32_MAX should be equivalent to the previous -1.
-
-[Upstream commit https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tests/iodelay.cpp | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tests/iodelay.cpp b/tests/iodelay.cpp
-index e1ba63fa..1ef470fd 100644
---- a/tests/iodelay.cpp
-+++ b/tests/iodelay.cpp
-@@ -20,6 +20,7 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
-+#include <stdint.h>
- #include <math.h>
- #include <unistd.h>
- #include <jack/jack.h>
-@@ -167,8 +168,8 @@ static jack_client_t  *jack_handle;
- static jack_port_t    *jack_capt;
- static jack_port_t    *jack_play;
- 
--jack_latency_range_t   capture_latency = {-1, -1};
--jack_latency_range_t   playback_latency = {-1, -1};
-+jack_latency_range_t   capture_latency = {UINT32_MAX, UINT32_MAX};
-+jack_latency_range_t   playback_latency = {UINT32_MAX, UINT32_MAX};
- 
- void
- latency_cb (jack_latency_callback_mode_t mode, void *arg)
-@@ -266,4 +267,4 @@ int main (int ac, char *av [])
-     return 0;
- }
- 
--// --------------------------------------------------------------------------------
-\ No newline at end of file
-+// --------------------------------------------------------------------------------
diff --git a/package/jack2/0002-Improve-check-for-ucontext.patch b/package/jack2/0002-Improve-check-for-ucontext.patch
deleted file mode 100644
index b8aa1da721..0000000000
--- a/package/jack2/0002-Improve-check-for-ucontext.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From ad79670d6d1e7ef2aad6935715921e5317cbe618 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 23 May 2016 22:28:12 +0200
-Subject: [PATCH] Improve check for ucontext
-
-The ucontext functionality is not available on all CPUs with all C
-libraries. Instead of making just assumptions based on the CPU
-architecture, this commit adds the necessary checks in wscript to verify
-the availability of the ucontext functionality, before using it in
-dbus/sigsegv.c.
-
-This avoids the long list of architecture exclusions, and make it more
-robust when building jack2 for new CPU architectures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- dbus/sigsegv.c | 12 ++++++------
- wscript        | 16 +++++++++++++++-
- 2 files changed, 21 insertions(+), 7 deletions(-)
-
-diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
-index df2c42c..00a62b5 100644
---- a/dbus/sigsegv.c
-+++ b/dbus/sigsegv.c
-@@ -106,20 +106,20 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
-     jack_error("info.si_errno = %d", info->si_errno);
-     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
-     jack_error("info.si_addr  = %p", info->si_addr);
--#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
-+#if defined(HAVE_UCONTEXT) && defined(HAVE_NGREG)
-     for(i = 0; i < NGREG; i++)
-         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
--#if defined(__powerpc64__)
-+#if defined(HAVE_UCONTEXT_GP_REGS)
-                 ucontext->uc_mcontext.gp_regs[i]
--#elif defined(__powerpc__)
-+#elif defined(HAVE_UCONTEXT_UC_REGS)
-                 ucontext->uc_mcontext.uc_regs[i]
--#elif defined(__sparc__) && defined(__arch64__)
-+#elif defined(HAVE_UCONTEXT_MC_GREGS)
-                 ucontext->uc_mcontext.mc_gregs[i]
--#else
-+#elif defined(HAVE_UCONTEXT_GREGS)
-                 ucontext->uc_mcontext.gregs[i]
- #endif
-                 );
--#endif /* alpha, ia64, kFreeBSD, arm, hppa */
-+#endif /* defined(HAVE_UCONTEXT) && defined(HAVE_NGREG) */
- 
- #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
- # if defined(SIGSEGV_STACK_IA64)
-diff --git a/wscript b/wscript
-index 63ba3aa..34a56fc 100644
---- a/wscript
-+++ b/wscript
-@@ -168,10 +168,24 @@ def configure(conf):
- 
-     conf.check_cc(header_name='execinfo.h', define_name="HAVE_EXECINFO_H", mandatory=False)
-     conf.check_cc(header_name='samplerate.h', define_name="HAVE_SAMPLERATE")
--
-     if conf.is_defined('HAVE_SAMPLERATE'):
-         conf.env['LIB_SAMPLERATE'] = ['samplerate']
- 
-+    # test for the availability of ucontext, and how it should be used
-+    for t in ("gp_regs", "uc_regs", "mc_gregs", "gregs"):
-+        fragment = "#include <ucontext.h>\n"
-+        fragment += "int main() { ucontext_t *ucontext; return (int) ucontext->uc_mcontext.%s[0]; }" % t
-+        confvar = "HAVE_UCONTEXT_%s" % t.upper()
-+        conf.check_cc(fragment=fragment, define_name=confvar, mandatory=False,
-+                      msg="Checking for ucontext->uc_mcontext.%s" % t)
-+        if conf.is_defined(confvar):
-+            conf.define('HAVE_UCONTEXT', 1)
-+
-+    fragment = "#include <ucontext.h>\n"
-+    fragment += "int main() { return NGREG; }"
-+    conf.check_cc(fragment=fragment, define_name="HAVE_NGREG", mandatory=False,
-+                  msg="Checking for NGREG")
-+
-     conf.sub_config('example-clients')
- 
-     if conf.check_cfg(package='celt', atleast_version='0.11.0', args='--cflags --libs', mandatory=False):
--- 
-2.7.4
-
diff --git a/package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch b/package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
deleted file mode 100644
index 719c6a83ba..0000000000
--- a/package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 4b2c73ad056aa327dc3b505410da68cf384317ba Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Mon, 16 May 2016 22:26:05 +0200
-Subject: [PATCH] Make backtrace support depends on execinfo.h existence
-
-In some C-libraries (like uclibc), backtrace support is optional, so the
-execinfo.h file may not exist.
-
-This change adds the check for execinfo.h header and conditionnaly enable
-backtrace support.
-
-This issue has been triggered by Buildroot farms:
-  http://autobuild.buildroot.org/results/391/391e71a988250ea66ec4dbee6f60fdce9eaf2766/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- dbus/sigsegv.c | 8 +++++++-
- wscript        | 1 +
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
-index ee12f91..0b31d89 100644
---- a/dbus/sigsegv.c
-+++ b/dbus/sigsegv.c
-@@ -27,7 +27,9 @@
- #include <stdio.h>
- #include <signal.h>
- #include <dlfcn.h>
--#include <execinfo.h>
-+#if defined(HAVE_EXECINFO_H)
-+# include <execinfo.h>
-+#endif /* defined(HAVE_EXECINFO_H) */
- #include <errno.h>
- #ifndef NO_CPP_DEMANGLE
- char * __cxa_demangle(const char * __mangled_name, char * __output_buffer, size_t * __length, int * __status);
-@@ -161,12 +163,16 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
-         bp = (void**)bp[0];
-     }
- #else
-+# if defined(HAVE_EXECINFO_H)
-     jack_error("Stack trace (non-dedicated):");
-     sz = backtrace(bt, 20);
-     strings = backtrace_symbols(bt, sz);
- 
-     for(i = 0; i < sz; ++i)
-         jack_error("%s", strings[i]);
-+# else /* defined(HAVE_EXECINFO_H) */
-+    jack_error("Stack trace not available");
-+# endif /* defined(HAVE_EXECINFO_H) */
- #endif
-     jack_error("End of stack trace");
-     exit (-1);
-diff --git a/wscript b/wscript
-index aef4bd8..63ba3aa 100644
---- a/wscript
-+++ b/wscript
-@@ -166,6 +166,7 @@ def configure(conf):
-         if conf.env['BUILD_JACKDBUS'] != True:
-             conf.fatal('jackdbus was explicitly requested but cannot be built')
- 
-+    conf.check_cc(header_name='execinfo.h', define_name="HAVE_EXECINFO_H", mandatory=False)
-     conf.check_cc(header_name='samplerate.h', define_name="HAVE_SAMPLERATE")
- 
-     if conf.is_defined('HAVE_SAMPLERATE'):
--- 
-2.8.2
-
diff --git a/package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch b/package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
deleted file mode 100644
index e4990b5c34..0000000000
--- a/package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c971aaab74ca6e7d4ac3a06bd26e7309dfc5da45 Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Date: Mon, 22 Aug 2016 19:04:47 +0530
-Subject: [PATCH] tests: define __STDC_LIMIT_MACROS
-
-With glibc 2.16, we get following build error when building jack2:
-
-  [193/247] cxx: tests/iodelay.cpp -> build/tests/iodelay.cpp.4.o
-  ../tests/iodelay.cpp:171:43: error: 'UINT32_MAX' was not declared in this scope
-  ../tests/iodelay.cpp:171:55: error: 'UINT32_MAX' was not declared in this scope
-  ../tests/iodelay.cpp:172:44: error: 'UINT32_MAX' was not declared in this scope
-  ../tests/iodelay.cpp:172:56: error: 'UINT32_MAX' was not declared in this scope
-
-In glibc 2.17 or older version, Header <stdint.h> defines these macros
-for C++ only if explicitly requested by defining __STDC_LIMIT_MACROS.
-
-We can't use <cstdint> since it requires C++11 standard.
-
-This build issue found by Buildroot autobuilder.
-http://autobuild.buildroot.net/results/369/369ce208ffea43dad75ba0a13469159b341e3bf5/
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- tests/iodelay.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/iodelay.cpp b/tests/iodelay.cpp
-index 1ef470f..f5c5836 100644
---- a/tests/iodelay.cpp
-+++ b/tests/iodelay.cpp
-@@ -20,6 +20,7 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
-+#define __STDC_LIMIT_MACROS
- #include <stdint.h>
- #include <math.h>
- #include <unistd.h>
--- 
-2.6.2
-
diff --git a/package/jack2/0005-gcc7.patch b/package/jack2/0005-gcc7.patch
deleted file mode 100644
index dadaf44ed9..0000000000
--- a/package/jack2/0005-gcc7.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f7bccdca651592cc4082b28fd4a01ed6ef8ab655 Mon Sep 17 00:00:00 2001
-From: Kjetil Matheussen <k.s.matheussen@notam02.no>
-Date: Sat, 15 Jul 2017 13:21:59 +0200
-Subject: [PATCH] Tests: Fix compilation with gcc7
-
-Fixes
-../tests/test.cpp: In function ?int process4(jack_nframes_t, void*)?:
-../tests/test.cpp:483:73: error: call of overloaded ?abs(jack_nframes_t)? is ambiguous
-  if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
-
-Downloaded from upstream commit
-https://github.com/jackaudio/jack2/commit/f7bccdca651592cc4082b28fd4a01ed6ef8ab655
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- tests/test.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test.cpp b/tests/test.cpp
-index 8a8a8117..d2ef9a05 100644
---- a/tests/test.cpp
-+++ b/tests/test.cpp
-@@ -479,7 +479,7 @@ int process4(jack_nframes_t nframes, void *arg)
- 	jack_nframes_t delta_time = cur_time - last_time;
- 
- 	Log("calling process4 callback : jack_frame_time = %ld delta_time = %ld\n", cur_time, delta_time);
--	if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
-+	if (delta_time > 0  && abs((int64_t)delta_time - (int64_t)cur_buffer_size) > (int64_t)tolerance) {
- 		printf("!!! ERROR !!! jack_frame_time seems to return incorrect values cur_buffer_size = %d, delta_time = %d tolerance %d\n", cur_buffer_size, delta_time, tolerance);
- 	}
- 
diff --git a/package/jack2/0006-fix-ftbfs-with-clang.patch b/package/jack2/0006-fix-ftbfs-with-clang.patch
deleted file mode 100644
index a73fe69e15..0000000000
--- a/package/jack2/0006-fix-ftbfs-with-clang.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d3c8e2d8d78899fba40a3e677ed4dbe388d82269 Mon Sep 17 00:00:00 2001
-From: Adrian Knoth <adi@drcomp.erfurt.thur.de>
-Date: Thu, 18 Sep 2014 18:29:23 +0200
-Subject: [PATCH] Fix FTBFS with clang++
-
-Forwarded from http://bugs.debian.org/757820
-
-Downloaded from upstream commit
-https://github.com/jackaudio/jack2/commit/d3c8e2d8d78899fba40a3e677ed4dbe388d82269
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- common/memops.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/common/memops.c b/common/memops.c
-index 27f6194a..2d416b64 100644
---- a/common/memops.c
-+++ b/common/memops.c
-@@ -198,7 +198,7 @@ static inline __m128i float_24_sse(__m128 s)
-  */
- static unsigned int seed = 22222;
- 
--inline unsigned int fast_rand() {
-+static inline unsigned int fast_rand() {
- 	seed = (seed * 96314165) + 907633515;
- 	return seed;
- }
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index ab031b9d94..54107d9bf4 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 88f1b6601b7c8950e6a2d5940b423a33ee628ae5583da40bdce3d9317d8c600d  jack2-v1.9.10.tar.gz
+sha256 deefe2f936dc32f59ad3cef7e37276c2035ef8a024ca92118f35c9a292272e33  jack2-v1.9.12.tar.gz
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index b61c5d75f7..7f4fbfbe04 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = v1.9.10
+JACK2_VERSION = v1.9.12
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
-- 
2.14.1
