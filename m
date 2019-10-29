From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:19:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/glog: fix build without threads
In-Reply-To: <20191029131543.23953-2-fontaine.fabrice@gmail.com>
References: <20191029131543.23953-1-fontaine.fabrice@gmail.com>
 <20191029131543.23953-2-fontaine.fabrice@gmail.com>
Message-ID: <e3f55d0c-b37d-1190-c673-2c2a2b221aff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 14:15, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-utilities-fix-build-without-pthread.patch | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 package/glog/0002-src-utilities-fix-build-without-pthread.patch
> 
> diff --git a/package/glog/0002-src-utilities-fix-build-without-pthread.patch b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
> new file mode 100644
> index 0000000000..5d675820ad
> --- /dev/null
> +++ b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
> @@ -0,0 +1,81 @@
> +From 5a1857a2b537a95234a6ad40bc382e6e75de45de Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 29 Oct 2019 13:52:34 +0100
> +Subject: [PATCH] src/utilities: fix build without pthread
> +
> +Fixes:
> + - http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + src/utilities.cc | 8 +++++++-
> + src/utilities.h  | 2 ++
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/utilities.cc b/src/utilities.cc
> +index 6562a54..8ad0319 100644
> +--- a/src/utilities.cc
> ++++ b/src/utilities.cc
> +@@ -61,7 +61,9 @@ using std::string;
> + _START_GOOGLE_NAMESPACE_
> + 
> + static const char* g_program_invocation_short_name = NULL;
> ++#ifdef HAVE_PTHREAD
> + static pthread_t g_main_thread_id;
> ++#endif
> + 
> + _END_GOOGLE_NAMESPACE_
> + 
> +@@ -181,6 +183,7 @@ bool IsGoogleLoggingInitialized() {
> +   return g_program_invocation_short_name != NULL;
> + }
> + 
> ++#ifdef HAVE_PTRHEAD
> + bool is_default_thread() {

 This function is in fact not used, and it's supposed to be internal. So perhaps
it's better to remove it entirely?

 If not, it should probably still exist even if pthreads in disabled, and most
likely it should return true in that case.

 Removing this function also means that g_main_thread_id can be removed.

> +   if (g_program_invocation_short_name == NULL) {
> +     // InitGoogleLogging() not yet called, so unlikely to be in a different
> +@@ -190,6 +193,7 @@ bool is_default_thread() {
> +     return pthread_equal(pthread_self(), g_main_thread_id);
> +   }
> + }
> ++#endif
> + 
> + #ifdef OS_WINDOWS
> + struct timeval {
> +@@ -276,7 +280,7 @@ pid_t GetTID() {
> +   return getpid();  // Linux:  getpid returns thread ID when gettid is absent
> + #elif defined OS_WINDOWS && !defined OS_CYGWIN
> +   return GetCurrentThreadId();
> +-#else
> ++#elif HAVE_PTHREAD

 For us, this is not really essential because we'd be in the OS_LINUX branch
above. But I guess for upstream it's better like that.

 Regards,
 Arnout

> +   // If none of the techniques above worked, we use pthread_self().
> +   return (pid_t)(uintptr_t)pthread_self();
> + #endif
> +@@ -350,7 +354,9 @@ void InitGoogleLoggingUtilities(const char* argv0) {
> +   if (!slash)  slash = strrchr(argv0, '\\');
> + #endif
> +   g_program_invocation_short_name = slash ? slash + 1 : argv0;
> ++#ifdef HAVE_PTHREAD
> +   g_main_thread_id = pthread_self();
> ++#endif
> + 
> + #ifdef HAVE_STACKTRACE
> +   InstallFailureFunction(&DumpStackTraceAndExit);
> +diff --git a/src/utilities.h b/src/utilities.h
> +index ca21cfb..af969d3 100644
> +--- a/src/utilities.h
> ++++ b/src/utilities.h
> +@@ -163,7 +163,9 @@ const char* ProgramInvocationShortName();
> + 
> + bool IsGoogleLoggingInitialized();
> + 
> ++#ifdef HAVE_PTHREAD
> + bool is_default_thread();
> ++#endif
> + 
> + int64 CycleClock_Now();
> + 
> +-- 
> +2.23.0
> +
> 
