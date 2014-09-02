From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 02 Sep 2014 11:25:46 +0200
Subject: [Buildroot] [PATCH 2 of 2] kmod: add patches to support build on
	Redhat 5
In-Reply-To: <patchbomb.1409649944@localhost>
References: <patchbomb.1409649944@localhost>
Message-ID: <f2b8b2b5efec1b2340c4.1409649946@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
# Date 1407153133 -7200
#      Mon Aug 04 13:52:13 2014 +0200
# Node ID f2b8b2b5efec1b2340c423f14f12df11a95ceac7
# Parent  2c7735c0247a4c83a3c2ea1d58e74be613465255
kmod: add patches to support build on Redhat 5

kmod uses certain features not available on older Redhat 5 machines.
This commit imports two patches from OpenEmbedded to fix that.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/kmod/kmod-0001-fix-O_CLOEXEC.patch                    |  38 ++++++
 package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch |  41 +++++++
 2 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
new file mode 100644
--- /dev/null
+++ b/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
@@ -0,0 +1,38 @@
+From bd43367eee868059770188fd9e9db38520dc6fff Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 22 Jan 2014 01:06:40 -0500
+Subject: [PATCH] libkmod/libkmod-internal.h: check whether O_CLOEXEC is
+ defined or not
+
+O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
+it, we need check before use.
+
+This patch is much more like a workaround, since it may need fcntl() use
+FD_CLOEXEC to replace.
+
+This problem was reported by "Ting Liu <b28495@freescale.com>"
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ libkmod/libkmod-internal.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
+index 0180124..100b40f 100644
+--- a/libkmod/libkmod-internal.h
++++ b/libkmod/libkmod-internal.h
+@@ -9,6 +9,10 @@
+ #include "macro.h"
+ #include "libkmod.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ static _always_inline_ _printf_format_(2, 3) void
+ 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
+ 
+-- 
+1.7.10.4
+
diff --git a/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch b/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch
new file mode 100644
--- /dev/null
+++ b/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch
@@ -0,0 +1,41 @@
+From 0c4dbadc9db3cda1cfca64e44ea08c6e89919ea7 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Tue, 10 Sep 2013 13:44:18 +0800
+Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
+
+We can't use htobe* and be*toh functions because they are not
+available on older versions of glibc, For example, shipped on Centos 5.5.
+
+Change to directly calling bswap_* as defined in+byteswap.h.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ libkmod/libkmod-signature.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
+index 6b80caa..3544a36 100644
+--- a/libkmod/libkmod-signature.c
++++ b/libkmod/libkmod-signature.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <endian.h>
++#include <byteswap.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -121,7 +122,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
+ 			modsig->hash >= PKEY_HASH__LAST ||
+ 			modsig->id_type >= PKEY_ID_TYPE__LAST)
+ 		return false;
+-	sig_len = be32toh(get_unaligned(&modsig->sig_len));
++	sig_len = bswap_32(get_unaligned(&modsig->sig_len));
+ 	if (size < (off_t)(modsig->signer_len + modsig->key_id_len + sig_len))
+ 		return false;
+ 
+-- 
+1.7.5.4
+
