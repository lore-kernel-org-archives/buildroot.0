From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 May 2014 18:31:35 -0300
Subject: [Buildroot] [PATCH 2/3] squashfs: bump to version 4.3
In-Reply-To: <1400189496-29633-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400189496-29633-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400189496-29633-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add optional lz4 support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squashfs/Config.in                      |  6 ++++++
 package/squashfs/squashfs-4.2-no-gzip-fix.patch | 26 -------------------------
 package/squashfs/squashfs.mk                    | 13 ++++++++++---
 3 files changed, 16 insertions(+), 29 deletions(-)
 delete mode 100644 package/squashfs/squashfs-4.2-no-gzip-fix.patch

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 385df1a..79ebf57 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -18,6 +18,12 @@ config BR2_PACKAGE_SQUASHFS_GZIP
 	help
 	  Support GZIP compression algorithm
 
+config BR2_PACKAGE_SQUASHFS_LZ4
+	bool "lz4 support"
+	select BR2_PACKAGE_LZ4
+	help
+	  Support LZ4 compression algorithm
+
 config BR2_PACKAGE_SQUASHFS_LZMA
 	bool "lzma support"
 	select BR2_PACKAGE_XZ
diff --git a/package/squashfs/squashfs-4.2-no-gzip-fix.patch b/package/squashfs/squashfs-4.2-no-gzip-fix.patch
deleted file mode 100644
index 4cb5f50..0000000
--- a/package/squashfs/squashfs-4.2-no-gzip-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] squashfs-tools: unbreak builds without gzip support
-
-The initialization of gzip_comp_ops if gzip support is disabled is
-missing 2 null pointers, causing the id element to be initialized to 0
-rather than ZLIB_COMPRESSION, which breaks all the compressor functions
-as they loop until finding the correct element or id = 0.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- squashfs-tools/compressor.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: squashfs4.2/squashfs-tools/compressor.c
-===================================================================
---- squashfs4.2.orig/squashfs-tools/compressor.c
-+++ squashfs4.2/squashfs-tools/compressor.c
-@@ -27,7 +27,8 @@
- 
- #ifndef GZIP_SUPPORT
- static struct compressor gzip_comp_ops =  {
--	NULL, NULL, NULL, NULL, NULL, NULL, ZLIB_COMPRESSION, "gzip", 0
-+	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ZLIB_COMPRESSION,
-+	"gzip", 0
- };
- #else
- extern struct compressor gzip_comp_ops;
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index bff308c..aaf568c 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.2
+SQUASHFS_VERSION = 4.3
 SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
+ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
+SQUASHFS_DEPENDENCIES += lz4
+SQUASHFS_MAKE_ARGS += LZ4_SUPPORT=1 COMP_DEFAULT=lz4
+else
+SQUASHFS_MAKE_ARGS += LZ4_SUPPORT=0
+endif
+
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
 SQUASHFS_DEPENDENCIES += xz
 SQUASHFS_MAKE_ARGS += LZMA_XZ_SUPPORT=1 COMP_DEFAULT=lzma
@@ -39,14 +46,14 @@ else
 SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
 endif
 
-
-HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo host-xz
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
 
 # no libattr/xz in BR
 HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=0 \
 	XZ_SUPPORT=1    \
 	GZIP_SUPPORT=1  \
+	LZ4_SUPPORT=1	\
 	LZO_SUPPORT=1	\
 	LZMA_XZ_SUPPORT=1
 
-- 
1.8.5.5
