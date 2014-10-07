From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 07 Oct 2014 15:42:32 +0200
Subject: [Buildroot] [PATCH v2] kmod: add patches to support build on RHEL 5
Message-ID: <763624c4511eae62667b.1412689352@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kmod uses certain features not available on older RHEL 5 machines (RedHat
Enterprise Linux). This commit adds two patches to fix that.

Both patches have been proposed upstream, the second one being accepted, the
first rejected with the suggestion to add the patch in Buildroot instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/kmod/kmod-0001-fix-O_CLOEXEC.patch                        |  45 ++++++
 package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch |  72 ++++++++++
 2 files changed, 117 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
new file mode 100644
--- /dev/null
+++ b/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
@@ -0,0 +1,45 @@
+From b39a62f6682463bcd47480348fac3dcd209a19a5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 22 Jan 2014 01:06:40 -0500
+Subject: [PATCH] Add dummy definition of O_CLOEXEC
+
+O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
+it, we need check before use.
+
+This patch is much more like a workaround, since it may need fcntl() use
+FD_CLOEXEC to replace.
+
+This problem was reported by "Ting Liu <b28495@freescale.com>"
+
+[Thomas De Schampheleire <thomas.de.schampheleire at gmail.com:
+ - move dummy definition from libkmod-internal.h to missing.h
+ - update commit title]
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+Upstream-status: rejected, suggests to add in buildroot instead [1]
+
+[1] http://news.gmane.org/find-root.php?message_id=1412062906%2d27378%2d1%2dgit%2dsend%2demail%2dpatrickdepinguin%40gmail.com
+
+---
+ libkmod/missing.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/libkmod/missing.h b/libkmod/missing.h
+index 4c0d136..e123e98 100644
+--- a/libkmod/missing.h
++++ b/libkmod/missing.h
+@@ -19,6 +19,10 @@
+ # define __NR_finit_module -1
+ #endif
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ #ifndef HAVE_FINIT_MODULE
+ #include <errno.h>
+ 
+-- 
+1.7.1
+
diff --git a/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch b/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch
new file mode 100644
--- /dev/null
+++ b/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch
@@ -0,0 +1,72 @@
+From bda1ed2aefee23b0eedbcd9f82e73c2547908438 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Mon, 29 Sep 2014 12:32:20 +0200
+Subject: [PATCH] Add back-up implementation of be32toh()
+
+Older systems may not have the be32toh function defined. Check for this
+and fall back to checking the endianness and calling bswap_32 directly
+if needed.  This works on both old and new systems.
+
+[Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>:
+address comments raised by Lucas De Marchi [1], update commit message]
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+Upstream-status: accepted [2]
+
+[1] http://www.spinics.net/lists/linux-modules/msg01129.html
+[2] https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=9b34db1ae63427269f918b2868b4cfcb50e6259b
+
+---
+ configure.ac                |    3 +++
+ libkmod/libkmod-signature.c |    1 +
+ libkmod/missing.h           |   10 ++++++++++
+ 3 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7781ce1..cd676bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,6 +53,9 @@ AC_CHECK_MEMBERS([struct stat.st_mtim], [], [], [#include <sys/stat.h>])
+ # musl 1.0 and bionic 4.4 don't have strndupa
+ AC_CHECK_DECLS_ONCE([strndupa])
+ 
++# RHEL 5 and older do not have be32toh
++AC_CHECK_DECLS_ONCE([be32toh])
++
+ # Check kernel headers
+ AC_CHECK_HEADERS_ONCE([linux/module.h])
+ 
+diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
+index a3ac15e..28f993e 100644
+--- a/libkmod/libkmod-signature.c
++++ b/libkmod/libkmod-signature.c
+@@ -25,6 +25,7 @@
+ #include <stdio.h>
+ 
+ #include "libkmod-internal.h"
++#include "missing.h"
+ 
+ /* These types and tables were copied from the 3.7 kernel sources.
+  * As this is just description of the signature format, it should not be
+diff --git a/libkmod/missing.h b/libkmod/missing.h
+index 8d47af8..4c0d136 100644
+--- a/libkmod/missing.h
++++ b/libkmod/missing.h
+@@ -43,3 +43,13 @@ static inline int finit_module(int fd, const char *uargs, int flags)
+ 		memcpy(__new, __old, __len);				\
+ 	 })
+ #endif
++
++#if !HAVE_DECL_BE32TOH
++#include <endian.h>
++#include <byteswap.h>
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++#define be32toh(x) bswap_32 (x)
++#else
++#define be32toh(x) (x)
++#endif
++#endif
+-- 
+1.7.1
+
