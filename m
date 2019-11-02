From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Nov 2019 10:53:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/glog: fix second patch
Message-ID: <20191102095339.4726-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ff7e59fdb0259a3a09ef9ef1d0e2030fcab298a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-utilities-fix-build-without-pthread.patch | 76 ++++++++++---------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/package/glog/0002-src-utilities-fix-build-without-pthread.patch b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
index 5d675820ad..503f57a697 100644
--- a/package/glog/0002-src-utilities-fix-build-without-pthread.patch
+++ b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
@@ -1,81 +1,83 @@
-From 5a1857a2b537a95234a6ad40bc382e6e75de45de Mon Sep 17 00:00:00 2001
+From 9630e0e848da22e27b346c38d9b05f0a16cbf7b3 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Oct 2019 13:52:34 +0100
+Date: Thu, 31 Oct 2019 19:27:16 +0100
 Subject: [PATCH] src/utilities: fix build without pthread
 
+- Remove is_default_thread function which is an internal and not used
+  function
+- Remove g_main_thread_id as it was used only by is_default_thread
+
 Fixes:
  - http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+[Retrieved from:
+https://github.com/google/glog/commit/9630e0e848da22e27b346c38d9b05f0a16cbf7b3]
 ---
- src/utilities.cc | 8 +++++++-
- src/utilities.h  | 2 ++
- 2 files changed, 9 insertions(+), 1 deletion(-)
+ src/utilities.cc | 16 +++-------------
+ src/utilities.h  |  2 --
+ 2 files changed, 3 insertions(+), 15 deletions(-)
 
 diff --git a/src/utilities.cc b/src/utilities.cc
-index 6562a54..8ad0319 100644
+index d463b33b..9a1e35d0 100644
 --- a/src/utilities.cc
 +++ b/src/utilities.cc
-@@ -61,7 +61,9 @@ using std::string;
+@@ -61,7 +61,6 @@ using std::string;
  _START_GOOGLE_NAMESPACE_
  
  static const char* g_program_invocation_short_name = NULL;
-+#ifdef HAVE_PTHREAD
- static pthread_t g_main_thread_id;
-+#endif
+-static pthread_t g_main_thread_id;
  
  _END_GOOGLE_NAMESPACE_
  
-@@ -181,6 +183,7 @@ bool IsGoogleLoggingInitialized() {
+@@ -181,16 +180,6 @@ bool IsGoogleLoggingInitialized() {
    return g_program_invocation_short_name != NULL;
  }
  
-+#ifdef HAVE_PTRHEAD
- bool is_default_thread() {
-   if (g_program_invocation_short_name == NULL) {
-     // InitGoogleLogging() not yet called, so unlikely to be in a different
-@@ -190,6 +193,7 @@ bool is_default_thread() {
-     return pthread_equal(pthread_self(), g_main_thread_id);
-   }
- }
-+#endif
- 
+-bool is_default_thread() {
+-  if (g_program_invocation_short_name == NULL) {
+-    // InitGoogleLogging() not yet called, so unlikely to be in a different
+-    // thread
+-    return true;
+-  } else {
+-    return pthread_equal(pthread_self(), g_main_thread_id);
+-  }
+-}
+-
  #ifdef OS_WINDOWS
  struct timeval {
-@@ -276,7 +280,7 @@ pid_t GetTID() {
+   long tv_sec, tv_usec;
+@@ -276,9 +265,11 @@ pid_t GetTID() {
    return getpid();  // Linux:  getpid returns thread ID when gettid is absent
  #elif defined OS_WINDOWS && !defined OS_CYGWIN
    return GetCurrentThreadId();
 -#else
-+#elif HAVE_PTHREAD
++#elif defined(HAVE_PTHREAD)
    // If none of the techniques above worked, we use pthread_self().
    return (pid_t)(uintptr_t)pthread_self();
++#else
++  return -1;
  #endif
-@@ -350,7 +354,9 @@ void InitGoogleLoggingUtilities(const char* argv0) {
+ }
+ 
+@@ -350,7 +341,6 @@ void InitGoogleLoggingUtilities(const char* argv0) {
    if (!slash)  slash = strrchr(argv0, '\\');
  #endif
    g_program_invocation_short_name = slash ? slash + 1 : argv0;
-+#ifdef HAVE_PTHREAD
-   g_main_thread_id = pthread_self();
-+#endif
+-  g_main_thread_id = pthread_self();
  
  #ifdef HAVE_STACKTRACE
    InstallFailureFunction(&DumpStackTraceAndExit);
 diff --git a/src/utilities.h b/src/utilities.h
-index ca21cfb..af969d3 100644
+index ca21cfb3..c66f9146 100644
 --- a/src/utilities.h
 +++ b/src/utilities.h
-@@ -163,7 +163,9 @@ const char* ProgramInvocationShortName();
+@@ -163,8 +163,6 @@ const char* ProgramInvocationShortName();
  
  bool IsGoogleLoggingInitialized();
  
-+#ifdef HAVE_PTHREAD
- bool is_default_thread();
-+#endif
- 
+-bool is_default_thread();
+-
  int64 CycleClock_Now();
  
--- 
-2.23.0
-
+ int64 UsecToCycles(int64 usec);
-- 
2.23.0
