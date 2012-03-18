From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 22:46:56 +0100
Subject: [Buildroot] [git commit] fis: convert to gentargets
Message-ID: <20120318215010.8D73190E9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2110a29179f04983e731bc994ca01f1f699b9e84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fis/fis-002-makefile.patch |   10 ------
 package/fis/fis.mk                 |   55 +++++++++--------------------------
 2 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/package/fis/fis-002-makefile.patch b/package/fis/fis-002-makefile.patch
deleted file mode 100644
index 0b922a2..0000000
--- a/package/fis/fis-002-makefile.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- fis/Makefile0	1970-01-01 10:00:00.000000000 +1000
-+++ fis/Makefile	2007-10-18 12:08:56.000000000 +1000
-@@ -0,0 +1,7 @@
-+CFLAGS += -std=c99
-+
-+fis: fis.o crc.o
-+
-+clean:
-+	-rm -f fis *.o
-+
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 0975f3f..d2cd196 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -3,49 +3,22 @@
 # fis
 #
 #############################################################
-FIS_SOURCE:=fis.c
-FIS_SITE:=http://svn.chezphil.org/utils/trunk
-FIS_CAT:=$(ZCAT)
-FIS_DIR:=$(BUILD_DIR)/fis
-FIS_BINARY:=fis
-FIS_TARGET_BINARY:=sbin/fis
 
-$(DL_DIR)/$(FIS_SOURCE):
-	 $(call DOWNLOAD,$(FIS_SITE)/$(FIS_SOURCE))
+FIS_SITE = http://svn.chezphil.org/utils/trunk
+FIS_SITE_METHOD = svn
+FIS_VERSION = 2892
 
-fis-source: $(DL_DIR)/$(FIS_SOURCE)
+define FIS_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
+		$(@D)/fis.c $(@D)/crc.c $(TARGE_LDFLAGS)
+endef
 
-$(FIS_DIR)/.unpacked: $(DL_DIR)/$(FIS_SOURCE)
-	mkdir -p $(FIS_DIR)
-	cp -f $(DL_DIR)/$(FIS_SOURCE) $(FIS_DIR)
-	support/scripts/apply-patches.sh $(FIS_DIR) package/fis \*.patch
-	touch $@
+define FIS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fis $(TARGET_DIR)/sbin/fis
+endef
 
-$(FIS_DIR)/$(FIS_BINARY): $(FIS_DIR)/.unpacked
-	$(MAKE) -C $(FIS_DIR) \
-		CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS) -std=c99" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+define FIS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/fis
+endef
 
-$(TARGET_DIR)/$(FIS_TARGET_BINARY): $(FIS_DIR)/$(FIS_BINARY)
-	rm -f $(TARGET_DIR)/$(FIS_TARGET_BINARY)
-	$(INSTALL) -D -m 0755 $(FIS_DIR)/$(FIS_BINARY) $(TARGET_DIR)/$(FIS_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-fis: $(TARGET_DIR)/$(FIS_TARGET_BINARY)
-
-fis-clean:
-	-$(MAKE) -C $(FIS_DIR) clean
-	rm -f $(TARGET_DIR)/$(FIS_TARGET_BINARY)
-
-fis-dirclean:
-	rm -rf $(FIS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FIS),y)
-TARGETS+=fis
-endif
+$(eval $(call GENTARGETS))
