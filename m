From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] mtd: host support cleanup
Message-ID: <20100203151849.8E6BB77531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d34b1d0589ce2a9c15bf95c83effafc85ef62c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build host version in build/mtd-utils-<VERSION>-host like other host
packages, and install into host/usr/sbin.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |   33 +++++++++++++++++++++------------
 1 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 99bdfa7..e4f5917 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,9 +6,8 @@
 MTD_VERSION:=1.3.1
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
-MTD_NAME:=mtd-utils-$(MTD_VERSION)
-MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/$(MTD_NAME)
-MTD_DIR:=$(BUILD_DIR)/$(MTD_NAME)
+MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_HOST_DIR:= $(MTD_DIR)-host
 MTD_CAT:=$(BZCAT)
 
 #############################################################
@@ -17,25 +16,34 @@ MTD_CAT:=$(BZCAT)
 # needed by target/jffs2root.
 #
 #############################################################
-MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
-SUMTOOL := $(MTD_HOST_DIR)/sumtool
+MKFS_JFFS2 := $(HOST_DIR)/usr/sbin/mkfs.jffs2
+SUMTOOL := $(HOST_DIR)/usr/sbin/sumtool
 
 $(DL_DIR)/$(MTD_SOURCE):
 	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(@D)
+	$(MTD_CAT) $^ | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
 		package/mtd/ mtd-utils-\*.patch
 	touch $@
 
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
-		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $(MTD_HOST_DIR)/mkfs.jffs2
+$(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
+		CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
+		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $@
 
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
-		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $(MTD_HOST_DIR)/sumtool
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/mkfs.jffs2
+	install -m 0755 -D $^ $@
+
+$(MTD_HOST_DIR)/sumtool: $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
+		CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
+		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $@
+
+$(SUMTOOL): $(MTD_HOST_DIR)/sumtool
+	install -m 0755 $^ $@
 
 mtd-host: host-lzo $(MKFS_JFFS2) $(SUMTOOL)
 
@@ -43,6 +51,7 @@ mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
 mtd-host-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
+	rm -f $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-dirclean:
 	rm -rf $(MTD_HOST_DIR)
-- 
1.6.3.3
