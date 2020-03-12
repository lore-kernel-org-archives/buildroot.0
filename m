From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 12 Mar 2020 08:47:59 -0300
Subject: [Buildroot] [PATCH] package/util-linux: fix build for riscv64 and
 powerpc64le
Message-ID: <20200312114759.31764-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Pull two upstream patches that fix the declaration of pidfd_open and
pidfd_send_signal.

Fixes:
  http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205/
  http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...-types.h-before-checking-SYS_pidfd_s.patch | 61 +++++++++++++++++++
 .../0007-include-cleanup-pidfd-inckudes.patch | 39 ++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
 create mode 100644 package/util-linux/0007-include-cleanup-pidfd-inckudes.patch

diff --git a/package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch b/package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
new file mode 100644
index 0000000000..a892298faf
--- /dev/null
+++ b/package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
@@ -0,0 +1,61 @@
+From 3cfde0370d3a8949df0c5bcf447cec6692910ed2 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 15 Feb 2020 21:12:50 +0000
+Subject: [PATCH] kill: include sys/types.h before checking
+ SYS_pidfd_send_signal
+
+Including sys/types.h must happen before SYS_pidfd_send_signal is checked,
+because that header defines variable in normal conditions.  When sys/types.h
+does not have SYS_pidfd_send_signal then fallback is defined in config.h
+that is included by default, and has therefore worked fine before and after
+this change.
+
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+---
+ include/pidfd-utils.h | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 593346576..0baedd2c9 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -1,26 +1,28 @@
+ #ifndef UTIL_LINUX_PIDFD_UTILS
+ #define UTIL_LINUX_PIDFD_UTILS
+ 
+-#if defined(__linux__) && defined(SYS_pidfd_send_signal)
+-# include <sys/types.h>
++#if defined(__linux__)
+ # include <sys/syscall.h>
++# if defined(SYS_pidfd_send_signal)
++#  include <sys/types.h>
+ 
+-# ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_send_signal, pidfd, sig, info, flags);
+ }
+-# endif
++#  endif
+ 
+-# ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+ }
+-# endif
++#  endif
+ 
+-# define UL_HAVE_PIDFD 1
++#  define UL_HAVE_PIDFD 1
+ 
+-#endif /* __linux__ && SYS_pidfd_send_signal */
++# endif	/* SYS_pidfd_send_signal */
++#endif /* __linux__ */
+ #endif /* UTIL_LINUX_PIDFD_UTILS */
+-- 
+2.18.2
+
diff --git a/package/util-linux/0007-include-cleanup-pidfd-inckudes.patch b/package/util-linux/0007-include-cleanup-pidfd-inckudes.patch
new file mode 100644
index 0000000000..4d4cc1f20d
--- /dev/null
+++ b/package/util-linux/0007-include-cleanup-pidfd-inckudes.patch
@@ -0,0 +1,39 @@
+From 0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 10 Mar 2020 11:43:16 +0100
+Subject: [PATCH] include: cleanup pidfd inckudes
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ include/pidfd-utils.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 0baedd2c9..4a6c3a604 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -3,10 +3,10 @@
+ 
+ #if defined(__linux__)
+ # include <sys/syscall.h>
+-# if defined(SYS_pidfd_send_signal)
++# if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
+ #  include <sys/types.h>
+ 
+-#  ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+@@ -14,7 +14,7 @@ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ }
+ #  endif
+ 
+-#  ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+-- 
+2.18.2
+
-- 
2.18.2
