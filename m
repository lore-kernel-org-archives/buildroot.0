From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 14:43:46 +0100
Subject: [Buildroot] [git commit] musl: bump to version 1.1.21
Message-ID: <20190122134726.733F38CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0c58ea5b1aed6ed578e120120322560972077f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the upstream release announcement:

"""
This release makes improvements with respect to default thread stack size,
including increasing the default from 80k to 128k, increasing the default
guard size from 4k to 8k, and allowing the default to be increased via ELF
headers so that programs that need larger stacks can be build without
source-level changes, using just LDFLAGS. Insufficient stack size for AIO
threads on kernels that don't honor the constant MINSIGSTKSZ is also fixed.

The glob core has been rewritten to fix inability to see past
searchable-but-unreadable path components, and to avoid excessive stack usage
and unnecessary syscalls. The tsearch AVL tree implementation has also been
rewritten for better size and performance. The math library adds more native
single-instruction implementations for arm, s390x, powerpc, and x86_64.

Various bugs are fixed, including several possible deadlocks, one of which was
a new regression in 1.1.20.
"""

Drop upstream patch 0002 which is included in the release.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-race-condition-in-file-locking.patch  | 55 ----------------------
 package/musl/musl.hash                             |  4 +-
 package/musl/musl.mk                               |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/package/musl/0002-fix-race-condition-in-file-locking.patch b/package/musl/0002-fix-race-condition-in-file-locking.patch
deleted file mode 100644
index f3e85e6888..0000000000
--- a/package/musl/0002-fix-race-condition-in-file-locking.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0db393d3a77bb9f300a356c6a5484fc2dddb161d Mon Sep 17 00:00:00 2001
-From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
-Date: Tue, 18 Sep 2018 10:03:27 +0300
-Subject: [PATCH] fix race condition in file locking
-
-The condition occurs when
-- thread #1 is holding the lock
-- thread #2 is waiting for it on __futexwait
-- thread #1 is about to release the lock and performs a_swap
-- thread #3 enters the __lockfile function and manages to grab the lock
-  before thread #1 calls __wake, resetting the MAYBE_WAITERS flag
-- thread #1 calls __wake
-- thread #2 wakes up but goes again to __futexwait as the lock is
-  held by thread #3
-- thread #3 releases the lock but does not call __wake as the
-  MAYBE_WAITERS flag is not set
-
-This condition results in thread #2 not being woken up. This patch fixes
-the problem by making the woken up thread ensure that the flag is
-properly set before going to sleep again.
-
-Mainainer's note: This fixes a regression introduced in commit
-c21f750727515602a9e84f2a190ee8a0a2aeb2a1.
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/stdio/__lockfile.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/stdio/__lockfile.c b/src/stdio/__lockfile.c
-index 2ff75d8a..0dcb2a42 100644
---- a/src/stdio/__lockfile.c
-+++ b/src/stdio/__lockfile.c
-@@ -8,13 +8,13 @@ int __lockfile(FILE *f)
- 	int owner = f->lock, tid = __pthread_self()->tid;
- 	if ((owner & ~MAYBE_WAITERS) == tid)
- 		return 0;
--	for (;;) {
--		owner = a_cas(&f->lock, 0, tid);
--		if (!owner) return 1;
--		if (a_cas(&f->lock, owner, owner|MAYBE_WAITERS)==owner) break;
-+	owner = a_cas(&f->lock, 0, tid);
-+	if (!owner) return 1;
-+	while ((owner = a_cas(&f->lock, 0, tid|MAYBE_WAITERS))) {
-+		if ((owner & MAYBE_WAITERS) ||
-+		    a_cas(&f->lock, owner, owner|MAYBE_WAITERS)==owner)
-+			__futexwait(&f->lock, owner|MAYBE_WAITERS, 1);
- 	}
--	while ((owner = a_cas(&f->lock, 0, tid|MAYBE_WAITERS)))
--		__futexwait(&f->lock, owner, 1);
- 	return 1;
- }
- 
--- 
-2.14.4
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index f7cc05bcce..18e011a965 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://www.musl-libc.org/releases/musl-1.1.20.tar.gz.asc
-sha256  44be8771d0e6c6b5f82dd15662eb2957c9a3173a19a8b49966ac0542bbd40d61  musl-1.1.20.tar.gz
+# http://www.musl-libc.org/releases/musl-1.1.21.tar.gz.asc
+sha256  c742b66f6f49c9e5f52f64d8b79fecb5a0f6e0203fca176c70ca20f6be285f44  musl-1.1.21.tar.gz
 sha256  15d9afbf84041872b4d840ed7d165d3eee786ff3f97e703b10467c259ff4e7d9  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 058a362922..90c753926e 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.20
+MUSL_VERSION = 1.1.21
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
