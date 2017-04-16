From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:35:12 +0200
Subject: [Buildroot] [git commit] package/xenomai: bump to version 3.0.4
Message-ID: <20170416084136.5A6F2804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8233151662b4de464fc8227feba9607aa7ace5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch 0001-testsuite-cyclictest.

Announce:
http://xenomai.org/pipermail/xenomai/2017-April/037254.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pawel Sikora <sikor6@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...atch => 0001-arm-enable-armv5tej-support.patch} |  0
 ...yclictest-silence-UMR-false-positive-with.patch | 56 ----------------------
 package/xenomai/xenomai.hash                       |  2 +-
 package/xenomai/xenomai.mk                         |  2 +-
 4 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/xenomai/0002-arm-enable-armv5tej-support.patch b/package/xenomai/0001-arm-enable-armv5tej-support.patch
similarity index 100%
rename from package/xenomai/0002-arm-enable-armv5tej-support.patch
rename to package/xenomai/0001-arm-enable-armv5tej-support.patch
diff --git a/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch b/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch
deleted file mode 100644
index bc115b4..0000000
--- a/package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3fa7c63c33920aa89490ae42538944d81815bf05 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Maciej=20Sumi=C5=84ski?= <maciej.suminski@cern.ch>
-Date: Fri, 2 Dec 2016 09:59:00 +0100
-Subject: [PATCH] testsuite/cyclictest: silence UMR false-positive with GCC 6.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-cyclictest.c: In function ???timerthread???:
-cyclictest.c:347:30: error: ???*((void *)&stop+8)??? may be used
-uninitialized in this function [-Werror=maybe-uninitialized]
-  diff += ((int) t1.tv_nsec - (int) t2.tv_nsec) / 1000;
-                              ^~~~~~~~~~~~~~~~
-cyclictest.c:760:39: note: ???*((void *)&stop+8)??? was declared here
-  struct timespec now, next, interval, stop;
-                                       ^~~~
-cyclictest.c:346:54: error: ???stop.tv_sec??? may be used uninitialized in
-this function [-Werror=maybe-uninitialized]
-  diff = USEC_PER_SEC * (long long)((int) t1.tv_sec - (int) t2.tv_sec);
-                                                      ^~~~~~~~~~~~~~~
-cyclictest.c:760:39: note: ???stop.tv_sec??? was declared here
-  struct timespec now, next, interval, stop;
-                                       ^~~~
-[Thomas: needed to fix a gcc 6.x build failure.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- demo/posix/cyclictest/cyclictest.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/demo/posix/cyclictest/cyclictest.c b/demo/posix/cyclictest/cyclictest.c
-index 3bb4386..31d9e5d 100644
---- a/demo/posix/cyclictest/cyclictest.c
-+++ b/demo/posix/cyclictest/cyclictest.c
-@@ -734,7 +734,7 @@ static inline void barrier_wait(struct thread_barrier *barrier)
- 		while (barrier->count > 0)
- 			pthread_cond_wait(&barrier->wait, &barrier->lock);
- 	}
--	
-+
- 	pthread_mutex_unlock(&barrier->lock);
- }
- 
-@@ -832,8 +832,9 @@ void *timerthread(void *param)
- 	next.tv_nsec += interval.tv_nsec;
- 	tsnorm(&next);
- 
-+	memset(&stop, 0, sizeof(stop)); /* grrr */
-+
- 	if (duration) {
--		memset(&stop, 0, sizeof(stop)); /* grrr */
- 		stop = now;
- 		stop.tv_sec += duration;
- 	}
--- 
-2.7.4
-
diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index e418593..a6c43ed 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b  xenomai-3.0.3.tar.bz2
+sha256  8a03e150d80ebf5935f97804881095d2d5d7509de22f7b8791776688a29d7110  xenomai-3.0.4.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 4ae045a..8a512ac 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.3
+XENOMAI_VERSION = 3.0.4
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
