From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:57:16 +0100
Subject: [Buildroot] [git commit] e2fsprogs: fix posix_fadvise() signature
	mismatch
Message-ID: <20140103195803.5AFB69C380@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3d690166c4533bc83500a22a43783193fbc27f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/79c/79cdb149d349ce9fe2dffbf53e3ff127a050ed24/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...g-fix-build-when-posix_fadvise-is-missing.patch |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch b/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
new file mode 100644
index 0000000..2fa828f
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
@@ -0,0 +1,42 @@
+From 33245e3808058c72b66931ac14aea8d5dc6d1ba5 Mon Sep 17 00:00:00 2001
+Message-Id: <33245e3808058c72b66931ac14aea8d5dc6d1ba5.1388571601.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 1 Jan 2014 08:48:17 +0200
+Subject: [PATCH] e4defrag: fix build when posix_fadvise is missing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc declares posix_fadvise() even when the architecture does not provide
+one. The static posix_fadvise() signature is not compatible with POSIX. Rename
+the internal implementation to fix this. Fixes the following build failure
+when building against uClibc:
+
+e4defrag.c:189:2: warning: #warning Using locally defined posix_fadvise interface. [-Wcpp]
+e4defrag.c:203:12: error: conflicting types for ???posix_fadvise???
+
+Patch status: sent upstream 
+(http://marc.info/?l=linux-ext4&m=138857218522054&w=2)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ misc/e4defrag.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc/e4defrag.c b/misc/e4defrag.c
+index c6a5f0d..4e84a74 100644
+--- a/misc/e4defrag.c
++++ b/misc/e4defrag.c
+@@ -200,7 +200,8 @@ static struct frag_statistic_ino	frag_rank[SHOW_FRAG_FILES];
+  * @len:		area length.
+  * @advise:		process flag.
+  */
+-static int posix_fadvise(int fd, loff_t offset, size_t len, int advise)
++#define posix_fadvise	__posix_fadvise
++static int __posix_fadvise(int fd, loff_t offset, size_t len, int advise)
+ {
+ 	return syscall(__NR_fadvise64_64, fd, offset, len, advise);
+ }
+-- 
+1.8.5.2
+
