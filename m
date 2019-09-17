From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:05:37 +0200
Subject: [Buildroot] [git commit] package/grpc: fix build with glibc 2.30
Message-ID: <20190917200049.D93D28E8F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=feae32855a9c9751eac2af19c686ebb86cc2b946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/42eb63a89228d340cab05c7ab65fab9b02814689

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/0004-Fix-gettid-naming-conflict.patch | 36 ++++++++++
 package/grpc/0005-Rename-gettid-functions.patch    | 83 ++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/package/grpc/0004-Fix-gettid-naming-conflict.patch b/package/grpc/0004-Fix-gettid-naming-conflict.patch
new file mode 100644
index 0000000000..05b9f2fd5b
--- /dev/null
+++ b/package/grpc/0004-Fix-gettid-naming-conflict.patch
@@ -0,0 +1,36 @@
+From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
+From: Juanli Shen <juanlishen@google.com>
+Date: Fri, 23 Aug 2019 08:46:09 -0700
+Subject: [PATCH] Fix gettid() naming conflict
+
+[Retrieved from:
+https://github.com/grpc/grpc/commit/de6255941a5e1c2fb2d50e57f84e38c09f45023d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/lib/gpr/log_linux.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
+index 561276f0c20..81026e5689b 100644
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,7 +40,9 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-static long gettid(void) { return syscall(__NR_gettid); }
++// Not naming it as gettid() to avoid duplicate declarations when complied with
++// GCC 9.1.
++static long local_gettid(void) { return syscall(__NR_gettid); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+@@ -70,7 +72,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
+   struct tm tm;
+   static __thread long tid = 0;
+-  if (tid == 0) tid = gettid();
++  if (tid == 0) tid = local_gettid();
+ 
+   timer = static_cast<time_t>(now.tv_sec);
+   final_slash = strrchr(args->file, '/');
diff --git a/package/grpc/0005-Rename-gettid-functions.patch b/package/grpc/0005-Rename-gettid-functions.patch
new file mode 100644
index 0000000000..1de483572c
--- /dev/null
+++ b/package/grpc/0005-Rename-gettid-functions.patch
@@ -0,0 +1,83 @@
+From 57586a1ca7f17b1916aed3dea4ff8de872dbf853 Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@dropbox.com>
+Date: Fri, 3 May 2019 08:11:00 -0700
+Subject: [PATCH] Rename gettid() functions.
+
+glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
+[Retrieved from:
+https://github.com/grpc/grpc/commit/57586a1ca7f17b1916aed3dea4ff8de872dbf853]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/lib/gpr/log_linux.cc          | 6 ++----
+ src/core/lib/gpr/log_posix.cc          | 4 ++--
+ src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
+ 3 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
+index 81026e5689b..8b597b4cf2f 100644
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,9 +40,7 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-// Not naming it as gettid() to avoid duplicate declarations when complied with
+-// GCC 9.1.
+-static long local_gettid(void) { return syscall(__NR_gettid); }
++static long sys_gettid(void) { return syscall(__NR_gettid); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+@@ -72,7 +70,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
+   struct tm tm;
+   static __thread long tid = 0;
+-  if (tid == 0) tid = local_gettid();
++  if (tid == 0) tid = sys_gettid();
+ 
+   timer = static_cast<time_t>(now.tv_sec);
+   final_slash = strrchr(args->file, '/');
+diff --git a/src/core/lib/gpr/log_posix.cc b/src/core/lib/gpr/log_posix.cc
+index b6edc14ab6b..2f7c6ce3760 100644
+--- a/src/core/lib/gpr/log_posix.cc
++++ b/src/core/lib/gpr/log_posix.cc
+@@ -31,7 +31,7 @@
+ #include <string.h>
+ #include <time.h>
+ 
+-static intptr_t gettid(void) { return (intptr_t)pthread_self(); }
++static intptr_t sys_gettid(void) { return (intptr_t)pthread_self(); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+@@ -86,7 +86,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   char* prefix;
+   gpr_asprintf(&prefix, "%s%s.%09d %7" PRIdPTR " %s:%d]",
+                gpr_log_severity_string(args->severity), time_buffer,
+-               (int)(now.tv_nsec), gettid(), display_file, args->line);
++               (int)(now.tv_nsec), sys_gettid(), display_file, args->line);
+ 
+   fprintf(stderr, "%-70s %s\n", prefix, args->message);
+   gpr_free(prefix);
+diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
+index c2d80c08ddb..4a83cb6c215 100644
+--- a/src/core/lib/iomgr/ev_epollex_linux.cc
++++ b/src/core/lib/iomgr/ev_epollex_linux.cc
+@@ -1077,7 +1077,7 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
+ }
+ 
+ #ifndef NDEBUG
+-static long gettid(void) { return syscall(__NR_gettid); }
++static long sys_gettid(void) { return syscall(__NR_gettid); }
+ #endif
+ 
+ /* pollset->mu lock must be held by the caller before calling this.
+@@ -1097,7 +1097,7 @@ static grpc_error* pollset_work(grpc_pollset* pollset,
+ #define WORKER_PTR (&worker)
+ #endif
+ #ifndef NDEBUG
+-  WORKER_PTR->originator = gettid();
++  WORKER_PTR->originator = sys_gettid();
+ #endif
+   if (GRPC_TRACE_FLAG_ENABLED(grpc_polling_trace)) {
+     gpr_log(GPR_INFO,
