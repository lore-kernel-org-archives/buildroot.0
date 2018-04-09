From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Apr 2018 22:04:29 +0200
Subject: [Buildroot] [PATCH v2 6/6] squashfs: add zstd support
In-Reply-To: <20180409200429.22650-1-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
Message-ID: <20180409200429.22650-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split off target zstd support (suggested by Yann E. MORIN)
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
index 67025ac68a..bec867d676 100644
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
@@ -46,6 +46,13 @@ else
 SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
 endif
 
+ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
+SQUASHFS_DEPENDENCIES += zstd
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
+else
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
+endif
+
 HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
 
 HOST_SQUASHFS_MAKE_ARGS = \
-- 
2.16.3
