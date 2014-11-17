From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Nov 2014 16:59:36 +0000
Subject: [Buildroot] [PATCH] kmod: bump to version 19
Message-ID: <1416243576-42474-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 19
- Rename 0001 patch to follow the new name convention
- Adapt the 0001 patch to the new version
- Remove the already-upstreamed 0002 patch
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...ix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch} |   12 ++-
 ...0002-add-backup-implementation-of-be32toh.patch |   72 --------------------
 package/kmod/kmod.hash                             |    2 +-
 package/kmod/kmod.mk                               |    2 +-
 4 files changed, 10 insertions(+), 78 deletions(-)
 rename package/kmod/{kmod-0001-fix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch} (83%)
 delete mode 100644 package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch

diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
similarity index 83%
rename from package/kmod/kmod-0001-fix-O_CLOEXEC.patch
rename to package/kmod/0001-fix-O_CLOEXEC.patch
index 4861c57..e09372c 100644
--- a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
+++ b/package/kmod/0001-fix-O_CLOEXEC.patch
@@ -1,3 +1,7 @@
+Adapt this patch to version 19
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
 From b39a62f6682463bcd47480348fac3dcd209a19a5 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 22 Jan 2014 01:06:40 -0500
@@ -22,13 +26,13 @@ Upstream-status: rejected, suggests to add in buildroot instead [1]
 [1] http://news.gmane.org/find-root.php?message_id=1412062906%2d27378%2d1%2dgit%2dsend%2demail%2dpatrickdepinguin%40gmail.com
 
 ---
- libkmod/missing.h |    4 ++++
+ shared/missing.h |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
 
-diff --git a/libkmod/missing.h b/libkmod/missing.h
+diff --git a/shared/missing.h b/shared/missing.h
 index 4c0d136..e123e98 100644
---- a/libkmod/missing.h
-+++ b/libkmod/missing.h
+--- a/shared/missing.h
++++ b/shared/missing.h
 @@ -19,6 +19,10 @@
  # define __NR_finit_module -1
  #endif
diff --git a/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch b/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch
deleted file mode 100644
index 869c569..0000000
--- a/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From bda1ed2aefee23b0eedbcd9f82e73c2547908438 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Mon, 29 Sep 2014 12:32:20 +0200
-Subject: [PATCH] Add back-up implementation of be32toh()
-
-Older systems may not have the be32toh function defined. Check for this
-and fall back to checking the endianness and calling bswap_32 directly
-if needed.  This works on both old and new systems.
-
-[Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>:
-address comments raised by Lucas De Marchi [1], update commit message]
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
-Upstream-status: accepted [2]
-
-[1] http://www.spinics.net/lists/linux-modules/msg01129.html
-[2] https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=9b34db1ae63427269f918b2868b4cfcb50e6259b
-
----
- configure.ac                |    3 +++
- libkmod/libkmod-signature.c |    1 +
- libkmod/missing.h           |   10 ++++++++++
- 3 files changed, 14 insertions(+), 0 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7781ce1..cd676bc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,6 +53,9 @@ AC_CHECK_MEMBERS([struct stat.st_mtim], [], [], [#include <sys/stat.h>])
- # musl 1.0 and bionic 4.4 don't have strndupa
- AC_CHECK_DECLS_ONCE([strndupa])
- 
-+# RHEL 5 and older do not have be32toh
-+AC_CHECK_DECLS_ONCE([be32toh])
-+
- # Check kernel headers
- AC_CHECK_HEADERS_ONCE([linux/module.h])
- 
-diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
-index a3ac15e..28f993e 100644
---- a/libkmod/libkmod-signature.c
-+++ b/libkmod/libkmod-signature.c
-@@ -25,6 +25,7 @@
- #include <stdio.h>
- 
- #include "libkmod-internal.h"
-+#include "missing.h"
- 
- /* These types and tables were copied from the 3.7 kernel sources.
-  * As this is just description of the signature format, it should not be
-diff --git a/libkmod/missing.h b/libkmod/missing.h
-index 8d47af8..4c0d136 100644
---- a/libkmod/missing.h
-+++ b/libkmod/missing.h
-@@ -43,3 +43,13 @@ static inline int finit_module(int fd, const char *uargs, int flags)
- 		memcpy(__new, __old, __len);				\
- 	 })
- #endif
-+
-+#if !HAVE_DECL_BE32TOH
-+#include <endian.h>
-+#include <byteswap.h>
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+#define be32toh(x) bswap_32 (x)
-+#else
-+#define be32toh(x) (x)
-+#endif
-+#endif
--- 
-1.7.1
-
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 8244fd9..28f1ca1 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256	e16e57272b54acb219c465b334715cfdddb5d97ff5d8948d4830ca1a372a868e	kmod-18.tar.xz
+sha256  3e7fee6eeff5435848b2dcc852bc8959066478d687d232284d67300c071e7b14  kmod-19.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 99ab387..cc185c8 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 18
+KMOD_VERSION = 19
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
1.7.1
