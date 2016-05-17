From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:19:57 +0200
Subject: [Buildroot] [git commit] package/jack2: fix build WRT backtrace
	support
Message-ID: <20160517132503.9478181ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7b9426ccc9bc854e337fec8bcfdda150762bcf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch checking for the presence of execinfo.h header
and enabling the backtrace support depending on the check result.

Fixes:
  http://autobuild.buildroot.org/results/415/415e2100dc59d35e58646c07f7cdccabecdda966/
  http://autobuild.buildroot.org/results/43c/43ca1b103434ae582fdf93cb5912b311960f303b/
  http://autobuild.buildroot.org/results/391/391e71a988250ea66ec4dbee6f60fdce9eaf2766/
  ...

Adapted from the PR:
  https://github.com/jackaudio/jack2/pull/206

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ace-support-depends-on-execinfo.h-existen.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/jack2/0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch b/package/jack2/0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch
new file mode 100644
index 0000000..719c6a8
--- /dev/null
+++ b/package/jack2/0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch
@@ -0,0 +1,67 @@
+From 4b2c73ad056aa327dc3b505410da68cf384317ba Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 16 May 2016 22:26:05 +0200
+Subject: [PATCH] Make backtrace support depends on execinfo.h existence
+
+In some C-libraries (like uclibc), backtrace support is optional, so the
+execinfo.h file may not exist.
+
+This change adds the check for execinfo.h header and conditionnaly enable
+backtrace support.
+
+This issue has been triggered by Buildroot farms:
+  http://autobuild.buildroot.org/results/391/391e71a988250ea66ec4dbee6f60fdce9eaf2766/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ dbus/sigsegv.c | 8 +++++++-
+ wscript        | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
+index ee12f91..0b31d89 100644
+--- a/dbus/sigsegv.c
++++ b/dbus/sigsegv.c
+@@ -27,7 +27,9 @@
+ #include <stdio.h>
+ #include <signal.h>
+ #include <dlfcn.h>
+-#include <execinfo.h>
++#if defined(HAVE_EXECINFO_H)
++# include <execinfo.h>
++#endif /* defined(HAVE_EXECINFO_H) */
+ #include <errno.h>
+ #ifndef NO_CPP_DEMANGLE
+ char * __cxa_demangle(const char * __mangled_name, char * __output_buffer, size_t * __length, int * __status);
+@@ -161,12 +163,16 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+         bp = (void**)bp[0];
+     }
+ #else
++# if defined(HAVE_EXECINFO_H)
+     jack_error("Stack trace (non-dedicated):");
+     sz = backtrace(bt, 20);
+     strings = backtrace_symbols(bt, sz);
+ 
+     for(i = 0; i < sz; ++i)
+         jack_error("%s", strings[i]);
++# else /* defined(HAVE_EXECINFO_H) */
++    jack_error("Stack trace not available");
++# endif /* defined(HAVE_EXECINFO_H) */
+ #endif
+     jack_error("End of stack trace");
+     exit (-1);
+diff --git a/wscript b/wscript
+index aef4bd8..63ba3aa 100644
+--- a/wscript
++++ b/wscript
+@@ -166,6 +166,7 @@ def configure(conf):
+         if conf.env['BUILD_JACKDBUS'] != True:
+             conf.fatal('jackdbus was explicitly requested but cannot be built')
+ 
++    conf.check_cc(header_name='execinfo.h', define_name="HAVE_EXECINFO_H", mandatory=False)
+     conf.check_cc(header_name='samplerate.h', define_name="HAVE_SAMPLERATE")
+ 
+     if conf.is_defined('HAVE_SAMPLERATE'):
+-- 
+2.8.2
+
