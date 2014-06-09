From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:27:04 +0200
Subject: [Buildroot] [git commit] uclibc: add patches to fix MIPS __SIGRTMAX
	and SIG127
Message-ID: <20140609092752.27D2F9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54ba2704b07cacacb9247540a660c667fd5ffdd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two uClibc 0.9.33.2 patches which fix issues relating to high signal
number handling on MIPS.

The first patch (0056) fixes _NSIG (and as a result __SIGRTMAX) to match
glibc. This fixes GDB on MIPS with uClibc, which cannot handle
__SIGRTMAX == 128 and emits the error:
GDB bug: target.c (gdb_signal_from_host): unrecognized real-time signal
This patch is from uClibc commit 2da958760f79 (MIPS: set _NSIG to
128, not 129. This matches glibc.) and applies without conflicts.

The second patch (0057) fixes the wait status macros to correctly
interpret status 0x007f on MIPS (other arches don't have signal 127).
This patch is from uClibc commit 4a96b9486871 (bits/waitstatus.h:
correctly interpret status 0x007f on MIPS) and applies without
conflicts.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-_NSIG-to-128-not-129.-This-matches-glibc.patch |   43 ++++++++++++++++
 ...atus.h-correctly-interpret-status-0x007f-.patch |   54 ++++++++++++++++++++
 2 files changed, 97 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch b/package/uclibc/0.9.33.2/uclibc-0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
new file mode 100644
index 0000000..c6bd051
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
@@ -0,0 +1,43 @@
+From 2da958760f798224065508431787e3a83b7fe2ae Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 28 Jun 2013 21:59:54 +0200
+Subject: [PATCH-0.9.33] MIPS: set _NSIG to 128, not 129. This matches glibc.
+
+Prompted by lkml discussion of a MIPS bug where sending
+signal 128 was found to be able to crash the machine :/
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ libc/sysdeps/linux/mips/bits/signum.h | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/libc/sysdeps/linux/mips/bits/signum.h b/libc/sysdeps/linux/mips/bits/signum.h
+index cf9b834..e83250e 100644
+--- a/libc/sysdeps/linux/mips/bits/signum.h
++++ b/libc/sysdeps/linux/mips/bits/signum.h
+@@ -53,7 +53,20 @@
+ #define SIGXCPU		30	/* CPU limit exceeded (4.2 BSD).  */
+ #define SIGXFSZ		31	/* File size limit exceeded (4.2 BSD).  */
+ 
+-/* Biggest signal number + 1 (including real-time signals).  */
+-#define _NSIG		129
++/* MIPS is special by having 128 signals.
++ * All (?) other architectures have at most 64 signals.
++ * Having 128 signals is problematic because signal nos are 1-based
++ * and last signal number is then 128.
++ * This plays havoc with WIFSIGNALED and WCOREDUMP in waitpid status word,
++ * when process dies from signal 128.
++ * Linux kernel 3.9 accepts signal 128, with awful results :/
++ * It is being fixed.
++ *
++ * glibc (accidentally?) papers over this issue by declaring _NSIG to be 128,
++ * not 129 (despite claiming that _NSIG is "biggest signal number + 1"
++ * in the comment above that definition). We follow suit.
++ * Note that this results in __SIGRTMAX == 127. It is intended.
++ */
++#define _NSIG		128
+ 
+ #endif	/* <signal.h> included.  */
+-- 
+1.8.1.2
+
diff --git a/package/uclibc/0.9.33.2/uclibc-0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch b/package/uclibc/0.9.33.2/uclibc-0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
new file mode 100644
index 0000000..d5922f6
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
@@ -0,0 +1,54 @@
+From 4a96b948687166da26a6c327e6c6733ad2336c5c Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 18 Jul 2013 21:57:06 +0200
+Subject: [PATCH-0.9.33] bits/waitstatus.h: correctly interpret status 0x007f on
+ MIPS
+
+On other architectures exit status of 0x007f is not possible,
+they don't have signal 127.
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ libc/sysdeps/linux/common/bits/waitstatus.h | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/bits/waitstatus.h b/libc/sysdeps/linux/common/bits/waitstatus.h
+index 45d0fd3..33f39a8 100644
+--- a/libc/sysdeps/linux/common/bits/waitstatus.h
++++ b/libc/sysdeps/linux/common/bits/waitstatus.h
+@@ -24,7 +24,7 @@
+ /* Everything extant so far uses these same bits.  */
+ 
+ 
+-/* If WIFEXITED(STATUS), the low-order 8 bits of the status.  */
++/* If WIFEXITED(STATUS), the low-order 8 bits of exit(N).  */
+ #define	__WEXITSTATUS(status)	(((status) & 0xff00) >> 8)
+ 
+ /* If WIFSIGNALED(STATUS), the terminating signal.  */
+@@ -36,12 +36,20 @@
+ /* Nonzero if STATUS indicates normal termination.  */
+ #define	__WIFEXITED(status)	(__WTERMSIG(status) == 0)
+ 
+-/* Nonzero if STATUS indicates termination by a signal.  */
+-#define __WIFSIGNALED(status) \
+-  (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)
++/* Nonzero if STATUS indicates termination by a signal.
++ * Note that status 0x007f is "died from signal 127", not "stopped by signal 0".
++ * This does happen on MIPS.
++ * The comparison is "< 0xff", not "< 0x7f", because WCOREDUMP bit (0x80)
++ * can be set too.
++ */
++#define	__WIFSIGNALED(status)	(((unsigned)((status) & 0xffff) - 1U) < 0xffU)
+ 
+ /* Nonzero if STATUS indicates the child is stopped.  */
++#if !defined(__mips__)
+ #define	__WIFSTOPPED(status)	(((status) & 0xff) == 0x7f)
++#else
++#define	__WIFSTOPPED(status)	(((status) & 0xff) == 0x7f && ((status) & 0xff00))
++#endif
+ 
+ /* Nonzero if STATUS indicates the child continued after a stop.  We only
+    define this if <bits/waitflags.h> provides the WCONTINUED flag bit.  */
+-- 
+1.8.1.2
+
