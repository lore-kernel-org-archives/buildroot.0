From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 00:53:43 +0200
Subject: [Buildroot] [git commit] uClibc: fix 0.9.32 build on x86
Message-ID: <20110706230554.901568A3BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=920dd594ed39c982f62ca71948c63ce6d7f2c4dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from uClibc git.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...__libc_epoll_pwait-compile-failure-on-x86.patch |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch

diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch b/toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
new file mode 100644
index 0000000..8cda4f9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
@@ -0,0 +1,43 @@
+From 8245f3b4638fdff2011c2657af1bb211def704bc Mon Sep 17 00:00:00 2001
+From: Phil Blundell <pb@pbcl.net>
+Date: Sat, 11 Jun 2011 01:10:46 -0400
+Subject: [PATCH] Fix __libc_epoll_pwait compile failure on x86
+
+This prevents "memory input 7 is not directly addressable" errors.
+
+| libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
+| libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not directly addressable
+| libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not directly addressable
+| make: *** [libc/sysdeps/linux/common/epoll.o] Error 1
+| make: *** Waiting for unfinished jobs....
+
+Signed-off-by: Phil Blundell <pb@pbcl.net>
+Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/epoll.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
+index 85b0cfd..ab3e73b 100644
+--- a/libc/sysdeps/linux/common/epoll.c
++++ b/libc/sysdeps/linux/common/epoll.c
+@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
+ int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
+ 						int timeout, const sigset_t *set)
+ {
++    int nsig = _NSIG / 8;
+ 	if (SINGLE_THREAD_P)
+-		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ # ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ 	else {
+ 		int oldtype = LIBC_CANCEL_ASYNC ();
+-		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ 		LIBC_CANCEL_RESET (oldtype);
+ 		return result;
+ 	}
+-- 
+1.7.5.4
+
-- 
1.7.3.4
