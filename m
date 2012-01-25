From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 12:19:40 +0100
Subject: [Buildroot] [git commit] libmms: bump version
Message-ID: <20120125112029.B452F90391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f7496e938bedbeff8d1f2e943a0a4b7d4673816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is now upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libmms-prevent-unaligned-dereferences.patch    |   84 --------------------
 package/multimedia/libmms/libmms.mk                |    4 +-
 2 files changed, 1 insertions(+), 87 deletions(-)

diff --git a/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch b/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch
deleted file mode 100644
index 9c606eb..0000000
--- a/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 4fd16633a8c379971425f7fd482152f163b09158 Mon Sep 17 00:00:00 2001
-From: Paul Burton <Paul.Burton@imgtec.com>
-Date: Fri, 17 Sep 2010 14:08:57 +0100
-Subject: [PATCH] Endianness macros should not dereference unaligned pointers
-
-The LE_*/BE_* macros previously worked by casting the pointer passed to them to a pointer to the correct integer type, then dereferencing it. This will not work on architectures which don't allow unaligned data access. Instead, access one byte at a time and shift to form the value.
----
- src/bswap.h |   59 +++++++++++++++++++++++++++++++++++++++++++----------------
- 1 files changed, 43 insertions(+), 16 deletions(-)
-
-diff --git a/src/bswap.h b/src/bswap.h
-index b731da7..59e8716 100644
---- a/src/bswap.h
-+++ b/src/bswap.h
-@@ -21,23 +21,50 @@
-  */
- 
- 
--/* Go cheap now, will rip out glib later. *Sigh* */
--#include <glib.h>
--
--/* NOTE:
-- * Now, to clear up confusion: LE_XX means "from LE to native, XX bits wide"
-- * I know it's not very clear naming (tell me about it, I
-- * misinterpreted in first version and caused bad nasty bug, *sigh*),
-- * but that's inherited code, will clean up as things go
-- * Oh, and one more thing -- they take *pointers*, not actual ints
-- */
-+#include <stdint.h>
-+
-+#define SWAP_ENDIAN_16(val) \
-+	(val[1] | (val[0] << 8))
-+#define SWAP_ENDIAN_32(val) \
-+	(val[3] | (val[2] << 8) | (val[1] << 16) | (val[0] << 24))
-+#define SWAP_ENDIAN_64(val) \
-+	(val[7] | (val[6] << 8) | (val[5] << 16) | (val[4] << 24) | \
-+	((uint64_t)val[3] << 32) | ((uint64_t)val[2] << 40) | \
-+	((uint64_t)val[1] << 48) | ((uint64_t)val[0] << 56))
-+
-+#define SAME_ENDIAN_16(val) \
-+	(val[0] | (val[1] << 8))
-+#define SAME_ENDIAN_32(val) \
-+	(val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24))
-+#define SAME_ENDIAN_64(val) \
-+	(val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24) | \
-+	((uint64_t)val[4] << 32) | ((uint64_t)val[5] << 40) | \
-+	((uint64_t)val[6] << 48) | ((uint64_t)val[7] << 56))
-+
-+#ifndef WORDS_BIGENDIAN
-+
-+/* Little endian */
-+
-+#define LE_16(val) SAME_ENDIAN_16(((uint8_t *)(val)))
-+#define LE_32(val) SAME_ENDIAN_32(((uint8_t *)(val)))
-+#define LE_64(val) SAME_ENDIAN_64(((uint8_t *)(val)))
-+#define BE_16(val) SWAP_ENDIAN_16(((uint8_t *)(val)))
-+#define BE_32(val) SWAP_ENDIAN_32(((uint8_t *)(val)))
-+#define BE_64(val) SWAP_ENDIAN_64(((uint8_t *)(val)))
-+
-+#elif WORDS_BIGENDIAN == 1
-+
-+/* Big endian */
- 
--#define LE_16(val) (GINT16_FROM_LE (*((u_int16_t*)(val))))
--#define BE_16(val) (GINT16_FROM_BE (*((u_int16_t*)(val))))
--#define LE_32(val) (GINT32_FROM_LE (*((u_int32_t*)(val))))
--#define BE_32(val) (GINT32_FROM_BE (*((u_int32_t*)(val))))
-+#define LE_16(val) SWAP_ENDIAN_16(((uint8_t *)(val)))
-+#define LE_32(val) SWAP_ENDIAN_32(((uint8_t *)(val)))
-+#define LE_64(val) SWAP_ENDIAN_64(((uint8_t *)(val)))
-+#define BE_16(val) SAME_ENDIAN_16(((uint8_t *)(val)))
-+#define BE_32(val) SAME_ENDIAN_32(((uint8_t *)(val)))
-+#define BE_64(val) SAME_ENDIAN_64(((uint8_t *)(val)))
- 
--#define LE_64(val) (GINT64_FROM_LE (*((u_int64_t*)(val))))
--#define BE_64(val) (GINT64_FROM_BE (*((u_int64_t*)(val))))
-+#else
-+#error Unknown endianness!
-+#endif
- 
- #endif /* BSWAP_H_INCLUDED */
--- 
-1.7.2.2
-
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
index 50ece53..45d1844 100644
--- a/package/multimedia/libmms/libmms.mk
+++ b/package/multimedia/libmms/libmms.mk
@@ -3,13 +3,11 @@
 # libmms
 #
 #############################################################
-LIBMMS_VERSION = 0.6
+LIBMMS_VERSION = 0.6.2
 LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
 LIBMMS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libmms
 
-LIBMMS_AUTORECONF = NO
 LIBMMS_INSTALL_STAGING = YES
-LIBMMS_INSTALL_TARGET = YES
 
 LIBMMS_DEPENDENCIES = host-pkg-config libglib2
 
