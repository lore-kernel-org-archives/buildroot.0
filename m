From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:17 +0100
Subject: [Buildroot] [RFC v1 08/14] mtd: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index eafce45..3123581 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -9,6 +9,8 @@ MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPLv2
 MTD_LICENSE_FILES = COPYING
 
+MTD_SUPPORTS_OUT_OF_TREE = YES
+
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
@@ -21,11 +23,11 @@ HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) \
-		CROSS= BUILDDIR=$(@D) WITHOUT_XATTR=1 -C $(@D)
+		CROSS= BUILDDIR=$(@D) WITHOUT_XATTR=1 -C $(MTD_SRCDIR)
 endef
 
 define HOST_MTD_INSTALL_CMDS
-	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
+	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(MTD_SRCDIR) install
 endef
 
 MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
@@ -77,7 +79,7 @@ ifneq ($(MTD_TARGETS_y),)
 
 define MTD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
-		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
+		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(MTD_SRCDIR) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y))
 endef
 
-- 
1.7.9.5
