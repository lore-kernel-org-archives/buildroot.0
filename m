From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 19:15:45 +0100
Subject: [Buildroot] [git commit] xenomai: bump version to 3.0.3
Message-ID: <20170325181551.035B88226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=472b07ea8ff1cd341c5f97508e5c29266146fa51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Xenomai version to 3.0.3

- Remove patch 0001-bfin-remove-inline-keyword.patch for version
  2.6.4, as it is already included in upstream

- Add upstream patch fixing gcc 6.x build issue of cyclictest.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
[Thomas: add patch fixing gcc 6.x build issue.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62 ----------------------
 ...yclictest-silence-UMR-false-positive-with.patch | 56 +++++++++++++++++++
 package/xenomai/xenomai.hash                       |  2 +-
 package/xenomai/xenomai.mk                         |  2 +-
 4 files changed, 58 insertions(+), 64 deletions(-)

diff --git a/package/xenomai/0001-bfin-remove-inline-keyword.patch b/package/xenomai/0001-bfin-remove-inline-keyword.patch
deleted file mode 100644
index 376bd21..0000000
--- a/package/xenomai/0001-bfin-remove-inline-keyword.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 2a96c8bbe19a193d9ae6d0780fc274abc4df03e3 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 5 Nov 2016 19:09:00 +0100
-Subject: [PATCH] bfin: remove inline keyword
-
-Xenomai user space tools fail to build for bfin target since it's
-provide it's own pthread_atfork(), shm_open() and shm_unlink()
-definition using the inline keyword and weak attribute.
-
-With gcc 5+ the weak attribute is discarded by the inline keyword,
-so each symbol are global and are redefined several time while
-linking.
-
-Fixes:
-http://autobuild.buildroot.net/results/0c2/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140
-
-Patch status: upstream,
-https://git.xenomai.org/xenomai-2.6.git/commit/?id=917dcebb26ec492f276cdc3b55867aa90e01fa12
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- include/asm-blackfin/syscall.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/include/asm-blackfin/syscall.h b/include/asm-blackfin/syscall.h
-index 9eda8b9..b5728b5 100644
---- a/include/asm-blackfin/syscall.h
-+++ b/include/asm-blackfin/syscall.h
-@@ -132,9 +132,9 @@ static inline int __xn_interrupted_p(struct pt_regs *regs)
- #define XENOMAI_SKINCALL5(id,op,a1,a2,a3,a4,a5) XENOMAI_DO_SYSCALL(5,id,op,a1,a2,a3,a4,a5)
- 
- /* uClibc does not provide pthread_atfork() for this arch; provide it
--   here. Note: let the compiler decides whether it wants to actually
--   inline this routine, i.e. do not force always_inline. */
--inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
-+   here.
-+*/
-+__attribute__((weak)) int pthread_atfork(void (*prepare)(void),
- 						void (*parent)(void),
- 						void (*child)(void))
- {
-@@ -143,7 +143,7 @@ inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
- 
- #include <errno.h>
- 
--inline __attribute__((weak)) int shm_open(const char *name,
-+__attribute__((weak)) int shm_open(const char *name,
- 					  int oflag,
- 					  mode_t mode)
- {
-@@ -151,7 +151,7 @@ inline __attribute__((weak)) int shm_open(const char *name,
- 	return -1;
- }
- 
--inline __attribute__((weak)) int shm_unlink(const char *name)
-+__attribute__((weak)) int shm_unlink(const char *name)
- {
- 	errno = ENOSYS;
- 	return -1;
--- 
-2.5.5
-
diff --git a/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch b/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch
new file mode 100644
index 0000000..bc115b4
--- /dev/null
+++ b/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch
@@ -0,0 +1,56 @@
+From 3fa7c63c33920aa89490ae42538944d81815bf05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Maciej=20Sumi=C5=84ski?= <maciej.suminski@cern.ch>
+Date: Fri, 2 Dec 2016 09:59:00 +0100
+Subject: [PATCH] testsuite/cyclictest: silence UMR false-positive with GCC 6.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+cyclictest.c: In function ???timerthread???:
+cyclictest.c:347:30: error: ???*((void *)&stop+8)??? may be used
+uninitialized in this function [-Werror=maybe-uninitialized]
+  diff += ((int) t1.tv_nsec - (int) t2.tv_nsec) / 1000;
+                              ^~~~~~~~~~~~~~~~
+cyclictest.c:760:39: note: ???*((void *)&stop+8)??? was declared here
+  struct timespec now, next, interval, stop;
+                                       ^~~~
+cyclictest.c:346:54: error: ???stop.tv_sec??? may be used uninitialized in
+this function [-Werror=maybe-uninitialized]
+  diff = USEC_PER_SEC * (long long)((int) t1.tv_sec - (int) t2.tv_sec);
+                                                      ^~~~~~~~~~~~~~~
+cyclictest.c:760:39: note: ???stop.tv_sec??? was declared here
+  struct timespec now, next, interval, stop;
+                                       ^~~~
+[Thomas: needed to fix a gcc 6.x build failure.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ demo/posix/cyclictest/cyclictest.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/demo/posix/cyclictest/cyclictest.c b/demo/posix/cyclictest/cyclictest.c
+index 3bb4386..31d9e5d 100644
+--- a/demo/posix/cyclictest/cyclictest.c
++++ b/demo/posix/cyclictest/cyclictest.c
+@@ -734,7 +734,7 @@ static inline void barrier_wait(struct thread_barrier *barrier)
+ 		while (barrier->count > 0)
+ 			pthread_cond_wait(&barrier->wait, &barrier->lock);
+ 	}
+-	
++
+ 	pthread_mutex_unlock(&barrier->lock);
+ }
+ 
+@@ -832,8 +832,9 @@ void *timerthread(void *param)
+ 	next.tv_nsec += interval.tv_nsec;
+ 	tsnorm(&next);
+ 
++	memset(&stop, 0, sizeof(stop)); /* grrr */
++
+ 	if (duration) {
+-		memset(&stop, 0, sizeof(stop)); /* grrr */
+ 		stop = now;
+ 		stop.tv_sec += duration;
+ 	}
+-- 
+2.7.4
+
diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 4d74472..e418593 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
+sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b  xenomai-3.0.3.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 6e0e441..28875b9 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.6.4
+XENOMAI_VERSION = 3.0.3
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
