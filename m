From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 20 Nov 2015 10:34:15 -0300
Subject: [Buildroot] [PATCH] squashfs: always enable xattr support
Message-ID: <1448026455-8146-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

In 785fef10 xattr support was disabled, probably because the old version
did require the xattr package to be present to support it.
In a409d76e xattr support was made optional via (lib)attr, however the
squashfs package does in fact include all of the required bits to
support xattr without the need for the attr package.

So enable xattr support by default for both the host and target
variants.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/squashfs/squashfs.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 3204d05..cdeb9c8 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -9,13 +9,7 @@ SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPLv2+
 SQUASHFS_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_ATTR),y)
-SQUASHFS_DEPENDENCIES += attr
-SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
-else
-SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
-endif
+SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
 SQUASHFS_DEPENDENCIES += lz4
@@ -54,9 +48,8 @@ endif
 
 HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
 
-# no libattr/xz in BR
 HOST_SQUASHFS_MAKE_ARGS = \
-	XATTR_SUPPORT=0 \
+	XATTR_SUPPORT=1 \
 	XZ_SUPPORT=1    \
 	GZIP_SUPPORT=1  \
 	LZ4_SUPPORT=1	\
-- 
2.4.10
