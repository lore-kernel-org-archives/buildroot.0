From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 22:34:37 +0100
Subject: [Buildroot] [PATCH 3/5] mtd-utils: Prepare for upcoming mtd-utils
	with included mkfs.ubifs
In-Reply-To: <1238103279-8040-1-git-send-email-mroth@nessie.de>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
Message-ID: <1238103279-8040-4-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upcoming mtd-utils have mkfs.ubifs included. So some minor
tweaks to the jffs2 root filesystem build are necessary to
distinguish it from an ubifs root filesytem build.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/mtd/1.1.0/mtd.mk    |    4 ++--
 package/mtd/1.2.0/mtd.mk    |    4 ++--
 package/mtd/20050122/mtd.mk |    4 ++--
 package/mtd/20061007/mtd.mk |    4 ++--
 target/jffs2/jffs2root.mk   |    6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/mtd/1.1.0/mtd.mk b/package/mtd/1.1.0/mtd.mk
index e89e9ce..76131a8 100644
--- a/package/mtd/1.1.0/mtd.mk
+++ b/package/mtd/1.1.0/mtd.mk
@@ -46,11 +46,11 @@ $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
 		BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) sumtool
 
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host-jffs2: $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
-mtd-host-clean:
+mtd-host-jffs2-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
 
 mtd-host-dirclean:
diff --git a/package/mtd/1.2.0/mtd.mk b/package/mtd/1.2.0/mtd.mk
index 76340e5..979075a 100644
--- a/package/mtd/1.2.0/mtd.mk
+++ b/package/mtd/1.2.0/mtd.mk
@@ -44,11 +44,11 @@ $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
 		BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) sumtool
 
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host-jffs2: $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
-mtd-host-clean:
+mtd-host-jffs2-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
 
 mtd-host-dirclean:
diff --git a/package/mtd/20050122/mtd.mk b/package/mtd/20050122/mtd.mk
index b5a9d5c..a456edd 100644
--- a/package/mtd/20050122/mtd.mk
+++ b/package/mtd/20050122/mtd.mk
@@ -40,11 +40,11 @@ $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
 	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
 		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util sumtool
 
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host-jffs2: $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
-mtd-host-clean:
+mtd-host-jffs2-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
 
 mtd-host-dirclean:
diff --git a/package/mtd/20061007/mtd.mk b/package/mtd/20061007/mtd.mk
index dfd3485..f299a60 100644
--- a/package/mtd/20061007/mtd.mk
+++ b/package/mtd/20061007/mtd.mk
@@ -38,11 +38,11 @@ $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) sumtool
 
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host-jffs2: $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
-mtd-host-clean:
+mtd-host-jffs2-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
 
 mtd-host-dirclean:
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index dc176cd..d80e89e 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -44,12 +44,12 @@ endif
 
 
 #
-# mtd-host is a dependency which builds a local copy of mkfs.jffs2 if it is needed.
+# mtd-host-jffs2 is a dependency which builds a local copy of mkfs.jffs2 if it is needed.
 # the actual build is done from package/mtd/mtd.mk and it sets the
 # value of MKFS_JFFS2 to either the previously installed copy or the one
 # just built.
 #
-$(JFFS2_TARGET): host-fakeroot makedevs mtd-host
+$(JFFS2_TARGET): host-fakeroot makedevs mtd-host-jffs2
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -99,7 +99,7 @@ endif
 
 jffs2root-source: mtd-host-source
 
-jffs2root-clean: mtd-host-clean
+jffs2root-clean: mtd-host-jffs2-clean
 	-rm -f $(JFFS2_TARGET)
 
 jffs2root-dirclean: mtd-host-dirclean
-- 
1.6.0.6
