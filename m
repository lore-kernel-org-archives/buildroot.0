From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 07:06:58 +0200
Subject: [Buildroot] [git commit] musl: add upstream patch to fix race
 condition in file locking
Message-ID: <20180920050744.343218860A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f90976c88f1e4a910f2fb55a331e3fc1048d62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to [1]:

  musl 1.1.20 introduced a regression in stdio FILE locking that can
  cause soft deadlocks with >2 threads contending for a
  FILE. Users/dists should apply
  https://git.musl-libc.org/cgit/musl/commit/?id=0db393d3a77bb9f300a356c6a5484fc2dddb161d.

[1] https://twitter.com/musllibc/status/1042292786568024070

This commit therefore adds the corresponding patch to the musl
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-race-condition-in-file-locking.patch  | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/musl/0002-fix-race-condition-in-file-locking.patch b/package/musl/0002-fix-race-condition-in-file-locking.patch
new file mode 100644
index 0000000000..f3e85e6888
--- /dev/null
+++ b/package/musl/0002-fix-race-condition-in-file-locking.patch
@@ -0,0 +1,55 @@
+From 0db393d3a77bb9f300a356c6a5484fc2dddb161d Mon Sep 17 00:00:00 2001
+From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
+Date: Tue, 18 Sep 2018 10:03:27 +0300
+Subject: [PATCH] fix race condition in file locking
+
+The condition occurs when
+- thread #1 is holding the lock
+- thread #2 is waiting for it on __futexwait
+- thread #1 is about to release the lock and performs a_swap
+- thread #3 enters the __lockfile function and manages to grab the lock
+  before thread #1 calls __wake, resetting the MAYBE_WAITERS flag
+- thread #1 calls __wake
+- thread #2 wakes up but goes again to __futexwait as the lock is
+  held by thread #3
+- thread #3 releases the lock but does not call __wake as the
+  MAYBE_WAITERS flag is not set
+
+This condition results in thread #2 not being woken up. This patch fixes
+the problem by making the woken up thread ensure that the flag is
+properly set before going to sleep again.
+
+Mainainer's note: This fixes a regression introduced in commit
+c21f750727515602a9e84f2a190ee8a0a2aeb2a1.
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/stdio/__lockfile.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/stdio/__lockfile.c b/src/stdio/__lockfile.c
+index 2ff75d8a..0dcb2a42 100644
+--- a/src/stdio/__lockfile.c
++++ b/src/stdio/__lockfile.c
+@@ -8,13 +8,13 @@ int __lockfile(FILE *f)
+ 	int owner = f->lock, tid = __pthread_self()->tid;
+ 	if ((owner & ~MAYBE_WAITERS) == tid)
+ 		return 0;
+-	for (;;) {
+-		owner = a_cas(&f->lock, 0, tid);
+-		if (!owner) return 1;
+-		if (a_cas(&f->lock, owner, owner|MAYBE_WAITERS)==owner) break;
++	owner = a_cas(&f->lock, 0, tid);
++	if (!owner) return 1;
++	while ((owner = a_cas(&f->lock, 0, tid|MAYBE_WAITERS))) {
++		if ((owner & MAYBE_WAITERS) ||
++		    a_cas(&f->lock, owner, owner|MAYBE_WAITERS)==owner)
++			__futexwait(&f->lock, owner|MAYBE_WAITERS, 1);
+ 	}
+-	while ((owner = a_cas(&f->lock, 0, tid|MAYBE_WAITERS)))
+-		__futexwait(&f->lock, owner, 1);
+ 	return 1;
+ }
+ 
+-- 
+2.14.4
+
