From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 12:27:03 +0100
Subject: [Buildroot] [git commit] package/xenomai: bfin remove inline keyword
Message-ID: <20161116112721.180F381DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75022c5270d444a6cd5f0ffe3d1c29f597d43722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xenomai user space tools fail to build for bfin target since it's
provide it's own pthread_atfork(), shm_open() and shm_unlink()
definition using the inline keyword and weak attribute.

With gcc 5+ the weak attribute is discarded by the inline keyword,
so each symbol are global and are redefined several time while
linking.

Fixes:
http://autobuild.buildroot.net/results/0c2/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: add reference to upstream commit.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/xenomai/0001-bfin-remove-inline-keyword.patch b/package/xenomai/0001-bfin-remove-inline-keyword.patch
new file mode 100644
index 0000000..376bd21
--- /dev/null
+++ b/package/xenomai/0001-bfin-remove-inline-keyword.patch
@@ -0,0 +1,62 @@
+From 2a96c8bbe19a193d9ae6d0780fc274abc4df03e3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 5 Nov 2016 19:09:00 +0100
+Subject: [PATCH] bfin: remove inline keyword
+
+Xenomai user space tools fail to build for bfin target since it's
+provide it's own pthread_atfork(), shm_open() and shm_unlink()
+definition using the inline keyword and weak attribute.
+
+With gcc 5+ the weak attribute is discarded by the inline keyword,
+so each symbol are global and are redefined several time while
+linking.
+
+Fixes:
+http://autobuild.buildroot.net/results/0c2/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140
+
+Patch status: upstream,
+https://git.xenomai.org/xenomai-2.6.git/commit/?id=917dcebb26ec492f276cdc3b55867aa90e01fa12
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/asm-blackfin/syscall.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/asm-blackfin/syscall.h b/include/asm-blackfin/syscall.h
+index 9eda8b9..b5728b5 100644
+--- a/include/asm-blackfin/syscall.h
++++ b/include/asm-blackfin/syscall.h
+@@ -132,9 +132,9 @@ static inline int __xn_interrupted_p(struct pt_regs *regs)
+ #define XENOMAI_SKINCALL5(id,op,a1,a2,a3,a4,a5) XENOMAI_DO_SYSCALL(5,id,op,a1,a2,a3,a4,a5)
+ 
+ /* uClibc does not provide pthread_atfork() for this arch; provide it
+-   here. Note: let the compiler decides whether it wants to actually
+-   inline this routine, i.e. do not force always_inline. */
+-inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
++   here.
++*/
++__attribute__((weak)) int pthread_atfork(void (*prepare)(void),
+ 						void (*parent)(void),
+ 						void (*child)(void))
+ {
+@@ -143,7 +143,7 @@ inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
+ 
+ #include <errno.h>
+ 
+-inline __attribute__((weak)) int shm_open(const char *name,
++__attribute__((weak)) int shm_open(const char *name,
+ 					  int oflag,
+ 					  mode_t mode)
+ {
+@@ -151,7 +151,7 @@ inline __attribute__((weak)) int shm_open(const char *name,
+ 	return -1;
+ }
+ 
+-inline __attribute__((weak)) int shm_unlink(const char *name)
++__attribute__((weak)) int shm_unlink(const char *name)
+ {
+ 	errno = ENOSYS;
+ 	return -1;
+-- 
+2.5.5
+
