From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Apr 2012 11:04:56 +0200
Subject: [Buildroot] [git commit] lttng-libust: fix build with modern uClibc
	versions
Message-ID: <20120426090604.2862696BD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04bd5067a2689e86a1928afac0aa3703114cd782
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc got sched_getcpu in 0.9.33, so the compat workaround should only
be used for older uClibc versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../lttng-libust-uclibc-sched_getcpu.patch         |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch b/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch
new file mode 100644
index 0000000..6536185
--- /dev/null
+++ b/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch
@@ -0,0 +1,32 @@
+[PATCH] fix build with modern uClibc
+
+uClibc has sched_getcpu since 0.9.33, so the compat workaround should only
+be used for older uClibc versions.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ liblttng-ust/compat.h |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+Index: lttng-ust-1.9.2/liblttng-ust/compat.h
+===================================================================
+--- lttng-ust-1.9.2.orig/liblttng-ust/compat.h
++++ lttng-ust-1.9.2/liblttng-ust/compat.h
+@@ -17,6 +17,10 @@
+ #include <sys/syscall.h>
+ 
+ #ifdef __UCLIBC__
++/* old uClibc versions didn't have sched_getcpu */
++#if __UCLIBC_MAJOR__ == 0 && \
++	(__UCLIBC_MINOR__ < 9 || \
++	 (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32))
+ #define __getcpu(cpu, node, cache)	syscall(__NR_getcpu, cpu, node, cache)
+ static inline
+ int sched_getcpu(void)
+@@ -26,5 +30,6 @@
+ 	s = __getcpu(&c, NULL, NULL);
+ 	return (s == -1) ? s : c;
+ }
++#endif /* <= 0.9.32 */
+ #endif	/* __UCLIBC__ */
+ #endif /* _UST_COMPAT_H */
