From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:35 -0500
Subject: [Buildroot] [PATCH v5 22/24] squashfs: Add xattr support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-23-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding extended attribute support for the squashfs tools when the attr
package is selected. This is needed for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/squashfs/squashfs.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 8ca9e2e..f44ef9f 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -10,9 +10,6 @@ SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squas
 SQUASHFS_LICENSE = GPLv2+
 SQUASHFS_LICENSE_FILES = COPYING
 
-# no libattr in BR
-SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
-
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
 SQUASHFS_DEPENDENCIES += lz4
 SQUASHFS_MAKE_ARGS += LZ4_SUPPORT=1 COMP_DEFAULT=lz4
@@ -52,13 +49,20 @@ HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
 
 # no libattr/xz in BR
 HOST_SQUASHFS_MAKE_ARGS = \
-	XATTR_SUPPORT=0 \
 	XZ_SUPPORT=1    \
 	GZIP_SUPPORT=1  \
 	LZ4_SUPPORT=1	\
 	LZO_SUPPORT=1	\
 	LZMA_XZ_SUPPORT=1
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+	SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
+	HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
+else
+	SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
+	HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
+endif
+
 define SQUASHFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE)    \
 		CC="$(TARGET_CC)"           \
-- 
1.9.1
