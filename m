From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 17:51:37 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: bump version to 3.0.3
In-Reply-To: <20170321165137.23527-1-sikor6@gmail.com>
References: <187459>
 <20170321165137.23527-1-sikor6@gmail.com>
Message-ID: <20170321165137.23527-2-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Xenomai version to 3.0.3,
Remove patch 0001-bfin-remove-inline-keyword.patch for version 2.6.4,
as it is already included in upstream

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62 ----------------------
 package/xenomai/xenomai.hash                       |  2 +-
 package/xenomai/xenomai.mk                         |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/xenomai/0001-bfin-remove-inline-keyword.patch

diff --git a/package/xenomai/0001-bfin-remove-inline-keyword.patch b/package/xenomai/0001-bfin-remove-inline-keyword.patch
deleted file mode 100644
index 376bd21c3..000000000
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
diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 4d74472ee..e41859343 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
+sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b  xenomai-3.0.3.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 6e0e44163..28875b944 100644
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
-- 
2.12.0
