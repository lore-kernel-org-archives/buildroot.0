From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 08:26:14 +0200
Subject: [Buildroot] [PATCH v2 3/3] Revert "e2fsprogs: fix posix_fadvise()
	signature mismatch"
In-Reply-To: <cover.1389594195.git.baruch@tkos.co.il>
References: <cover.1389594195.git.baruch@tkos.co.il>
Message-ID: <10f996cb2545050f65e8a108573e9ee7bfd9e41c.1389594195.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit c3d690166c4533bc83500a22a43783193fbc27f9.

The real cause of problem is missing posix_fadvise() implementation in uClibc
for xtensa. This has now been fixed with the uclibc version bump. The internal
e2fsprogs posix_fadvise() implementation is broken on 32bit systems anyway, and
upstream has removed it.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...g-fix-build-when-posix_fadvise-is-missing.patch | 42 ----------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch

diff --git a/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch b/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
deleted file mode 100644
index 2fa828ff6be2..000000000000
--- a/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 33245e3808058c72b66931ac14aea8d5dc6d1ba5 Mon Sep 17 00:00:00 2001
-Message-Id: <33245e3808058c72b66931ac14aea8d5dc6d1ba5.1388571601.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 1 Jan 2014 08:48:17 +0200
-Subject: [PATCH] e4defrag: fix build when posix_fadvise is missing
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-uClibc declares posix_fadvise() even when the architecture does not provide
-one. The static posix_fadvise() signature is not compatible with POSIX. Rename
-the internal implementation to fix this. Fixes the following build failure
-when building against uClibc:
-
-e4defrag.c:189:2: warning: #warning Using locally defined posix_fadvise interface. [-Wcpp]
-e4defrag.c:203:12: error: conflicting types for ?posix_fadvise?
-
-Patch status: sent upstream 
-(http://marc.info/?l=linux-ext4&m=138857218522054&w=2)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- misc/e4defrag.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/misc/e4defrag.c b/misc/e4defrag.c
-index c6a5f0d..4e84a74 100644
---- a/misc/e4defrag.c
-+++ b/misc/e4defrag.c
-@@ -200,7 +200,8 @@ static struct frag_statistic_ino	frag_rank[SHOW_FRAG_FILES];
-  * @len:		area length.
-  * @advise:		process flag.
-  */
--static int posix_fadvise(int fd, loff_t offset, size_t len, int advise)
-+#define posix_fadvise	__posix_fadvise
-+static int __posix_fadvise(int fd, loff_t offset, size_t len, int advise)
- {
- 	return syscall(__NR_fadvise64_64, fd, offset, len, advise);
- }
--- 
-1.8.5.2
-
-- 
1.8.5.2
