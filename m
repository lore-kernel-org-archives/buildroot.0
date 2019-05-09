From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 May 2019 13:04:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/libupnp18: add upstream patch to
 fix runtime crash with musl
In-Reply-To: <20190509110438.31340-1-joerg.krause@embedded.rocks>
References: <20190509110438.31340-1-joerg.krause@embedded.rocks>
Message-ID: <20190509110438.31340-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Applications build with a musl 1.1.20+ toolchain and linked with libupnpp will
crash at runtime with `Illegal instruction` as musl is more strict with
trying to detach an already detached thread resulting in undefined
behaviour.

Upstream status:
https://github.com/mrjimenez/pupnp/issues/102

Backported from:
https://github.com/mrjimenez/pupnp/commit/04b454f693d0c71336252380d08f1d02967e133e

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...tach-detached-thread-the-result-is-u.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch

diff --git a/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch b/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch
new file mode 100644
index 0000000000..601ea89be7
--- /dev/null
+++ b/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch
@@ -0,0 +1,39 @@
+From 04b454f693d0c71336252380d08f1d02967e133e Mon Sep 17 00:00:00 2001
+From: Jean-Francois Dockes <jf@dockes.org>
+Date: Sun, 27 Jan 2019 10:44:17 +0100
+Subject: [PATCH] Do not try to detach detached thread, the result is
+ undefined. Fixes issue #102
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes runtime crash with musl 1.1.20+. The problem is that libupnp is
+calling pthread_detach() on a thread which was created in the detached state.
+
+Backported from: 04b454f693d0c71336252380d08f1d02967e133e
+
+(cherry picked from commit 386b7ed79146ecf7a3bba49f48cb8f41a9b49170)
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ upnp/src/threadutil/ThreadPool.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/upnp/src/threadutil/ThreadPool.c b/upnp/src/threadutil/ThreadPool.c
+index d272907..5e590ed 100644
+--- a/upnp/src/threadutil/ThreadPool.c
++++ b/upnp/src/threadutil/ThreadPool.c
+@@ -651,11 +651,6 @@ static int CreateWorker(
+ 	rc = ithread_create(&temp, &attr, WorkerThread, tp);
+ 	ithread_attr_destroy(&attr);
+ 	if (rc == 0) {
+-		rc = ithread_detach(temp);
+-		/* ithread_detach will return EINVAL if thread has been
+-		 successfully detached by ithread_create */
+-		if (rc == EINVAL)
+-			rc = 0;
+ 		tp->pendingWorkerThreadStart = 1;
+ 		/* wait until the new worker thread starts */
+ 		while (tp->pendingWorkerThreadStart) {
+-- 
+2.21.0
+
-- 
2.21.0
