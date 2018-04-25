From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:48:49 +0200
Subject: [Buildroot] [git commit] squashfs: add zstd support
Message-ID: <20180425214909.CC71488E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2254a327200220f8f2722957db4cb6ece54590bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squashfs/Config.in   | 6 ++++++
 package/squashfs/squashfs.mk | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 70c0fc9808..c16ebbf27f 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -41,6 +41,12 @@ config BR2_PACKAGE_SQUASHFS_XZ
 	help
 	  Support XZ compression algorithm
 
+config BR2_PACKAGE_SQUASHFS_ZSTD
+	bool "zstd support"
+	select BR2_PACKAGE_ZSTD
+	help
+	  Support ZSTD compression algorithm
+
 endif
 
 comment "squashfs needs a toolchain w/ threads"
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 67025ac68a..7467342c48 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -9,7 +9,7 @@ SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 SQUASHFS_SITE_METHOD = git
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
-SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1 ZSTD_SUPPORT=0
+SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
 SQUASHFS_DEPENDENCIES += lz4
@@ -39,6 +39,13 @@ else
 SQUASHFS_MAKE_ARGS += LZO_SUPPORT=0
 endif
 
+ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
+SQUASHFS_DEPENDENCIES += zstd
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
+else
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
+endif
+
 ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP),y)
 SQUASHFS_DEPENDENCIES += zlib
 SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=1 COMP_DEFAULT=gzip
