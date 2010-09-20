From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 22:05:39 +0200
Subject: [Buildroot] [git commit master 1/1] squashfs: add lzma support
Message-ID: <20100920200707.36B9D8B4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed4ca35a1a5996569b1a1d769cb080c5f1fd62c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And try to select a sane default compression algorithm.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/squashfs/Config.in        |    3 +++
 fs/squashfs/squashfs.mk      |    4 ++++
 package/squashfs/Config.in   |    6 ++++++
 package/squashfs/squashfs.mk |   29 ++++++++++++++++++++---------
 4 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 20aac08..85416be 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -31,6 +31,9 @@ choice
 config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
        bool "gzip"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_LZMA
+       bool "lzma"
+
 config BR2_TARGET_ROOTFS_SQUASHFS4_LZO
        bool "lzo"
 
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 311a3ee..7efe979 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -10,8 +10,12 @@ ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
+ROOTFS_SQUASHFS_ARGS += -comp lzma
+else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
+endif
 
 else
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index e975185..39cb7f3 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -15,6 +15,12 @@ config BR2_PACKAGE_SQUASHFS_GZIP
        help
          Support GZIP compression algorithm
 
+config BR2_PACKAGE_SQUASHFS_LZMA
+       bool "lzma support"
+       select BR2_PACKAGE_XZ
+       help
+         Support LZMA compression algorithm
+
 config BR2_PACKAGE_SQUASHFS_LZO
        bool "lzo support"
        select BR2_PACKAGE_LZO
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 0332d60..7cbec32 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -3,30 +3,41 @@ SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
 # no libattr/xz in BR
-SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0 XZ_SUPPORT=0
+SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
-# we need atleast one compresser, so use gzip if lzo isn't enabled
-ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP)$(if $(BR2_PACKAGE_SQUASHFS_LZO),,y),y)
-SQUASHFS_DEPENDENCIES += zlib
-SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=1
+# we need atleast one compresser, so use gzip if none are enabled
+ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP)$(BR2_PACKAGE_SQUASHFS_LZO)$(BR2_PACKAGE_SQUASHFS_LZMA),)
+BR2_PACKAGE_SQUASHFS_GZIP=y
+endif
+
+ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
+SQUASHFS_DEPENDENCIES += xz
+SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=lzma
 else
-SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0 COMP_DEFAULT=lzo
+SQUASHFS_MAKE_ARGS += XZ_SUPPORT=0
 endif
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZO),y)
 SQUASHFS_DEPENDENCIES += lzo
-SQUASHFS_MAKE_ARGS += LZO_SUPPORT=1
+SQUASHFS_MAKE_ARGS += LZO_SUPPORT=1 COMP_DEFAULT=lzo
 else
 SQUASHFS_MAKE_ARGS += LZO_SUPPORT=0
 endif
 
+ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP),y)
+SQUASHFS_DEPENDENCIES += zlib
+SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=1 COMP_DEFAULT=gzip
+else
+SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
+endif
+
 
-HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo host-xz
 
 # no libattr/xz in BR
 HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=0 \
-	XZ_SUPPORT=0    \
+	XZ_SUPPORT=1    \
 	GZIP_SUPPORT=1  \
 	LZO_SUPPORT=1
 
-- 
1.7.1
