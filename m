From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:29 +0200
Subject: [Buildroot] [PATCH 04/12] ntp: fix build failure
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <442e4122dcf102c52f347817f455419955659eda.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a patch to NTP to fix the following build failure,
using a workaround patch found on the Fedora bugzilla:

ntp_loopfilter.c: In function 'local_clock':
ntp_loopfilter.c:571: error: 'MOD_NANO' undeclared (first use in this function)
ntp_loopfilter.c:571: error: (Each undeclared identifier is reported only once
ntp_loopfilter.c:571: error: for each function it appears in.)
ntp_loopfilter.c: In function 'loop_config':
ntp_loopfilter.c:896: error: 'MOD_NANO' undeclared (first use in this function)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp-4.2.4_p5-nano.patch |   36 +++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/ntp/ntp-4.2.4_p5-nano.patch

diff --git a/package/ntp/ntp-4.2.4_p5-nano.patch b/package/ntp/ntp-4.2.4_p5-nano.patch
new file mode 100644
index 0000000..f4097ee
--- /dev/null
+++ b/package/ntp/ntp-4.2.4_p5-nano.patch
@@ -0,0 +1,36 @@
+Fixes the MOD_NANO build failure
+
+ntp_loopfilter.c: In function 'local_clock':
+ntp_loopfilter.c:571: error: 'MOD_NANO' undeclared (first use in this function)
+ntp_loopfilter.c:571: error: (Each undeclared identifier is reported only once
+ntp_loopfilter.c:571: error: for each function it appears in.)
+ntp_loopfilter.c: In function 'loop_config':
+ntp_loopfilter.c:896: error: 'MOD_NANO' undeclared (first use in this function)
+
+Taken from
+http://cvs.fedoraproject.org/viewvc/devel/ntp/ntp-4.2.4p7-nano.patch?revision=1.1&content-type=text/plain&view=co
+
+See the discussion at
+https://bugs.launchpad.net/ubuntu/+source/ntp/+bug/412242 for more
+details and links. The below fix is not a correct fix, but only a
+workaround. The real fix required changes to kernel/libc headers.
+
+Index: ntp-4.2.4p5/include/ntp_syscall.h
+===================================================================
+--- ntp-4.2.4p5.orig/include/ntp_syscall.h	2010-05-14 17:34:48.000000000 +0200
++++ ntp-4.2.4p5/include/ntp_syscall.h	2010-05-14 17:35:13.000000000 +0200
+@@ -14,6 +14,14 @@
+ # include <sys/timex.h>
+ #endif
+ 
++#if defined(ADJ_NANO) && !defined(MOD_NANO)
++#define MOD_NANO ADJ_NANO
++#endif
++
++#if defined(ADJ_TAI) && !defined(MOD_TAI)
++#define MOD_TAI ADJ_TAI
++#endif
++
+ #ifndef NTP_SYSCALLS_LIBC
+ #ifdef NTP_SYSCALLS_STD
+ # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
-- 
1.6.3.3
