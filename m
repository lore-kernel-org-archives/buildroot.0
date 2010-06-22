From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:21:12 +0200
Subject: [Buildroot] [PATCH 18/20] liblockfile : convert to autotools
	infrastructure & bump to 1.08-4
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6cae9983537d6f3467080cf21bd92337d6ed6ae7.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default
 * No need to strip, it's done globally

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/liblockfile/liblockfile.mk |   63 +++++++-----------------------------
 1 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index b30d356..bd14faf 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -6,66 +6,27 @@
 LIBLOCKFILE_VERSION=1.08
 LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
-LIBLOCKFILE_CAT:=$(ZCAT)
-LIBLOCKFILE_DIR:=$(BUILD_DIR)/liblockfile-$(LIBLOCKFILE_VERSION)
-LIBLOCKFILE_BINARY:=usr/lib/liblockfile.so.1.0
+LIBLOCKFILE_PATCH:=liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
-$(DL_DIR)/$(LIBLOCKFILE_SOURCE):
-	 $(call DOWNLOAD,$(LIBLOCKFILE_SITE),$(LIBLOCKFILE_SOURCE))
+LIBLOCKFILE_INSTALL_STAGING = YES
+LIBLOCKFILE_CONF_OPT = --enable-shared --mandir=/usr/share/man
 
-liblockfile-source: $(DL_DIR)/$(LIBLOCKFILE_SOURCE)
-
-$(LIBLOCKFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBLOCKFILE_SOURCE)
-	$(LIBLOCKFILE_CAT) $(DL_DIR)/$(LIBLOCKFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBLOCKFILE_DIR) package/liblockfile/ \*.patch
-	touch $@
-
-$(LIBLOCKFILE_DIR)/.configured: $(LIBLOCKFILE_DIR)/.unpacked
-	(cd $(LIBLOCKFILE_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--bindir=/usr/bin \
-		--libdir=/usr/lib \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--enable-shared \
-	)
-	touch $@
-
-$(STAGING_DIR)/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
+define LIBLOCKFILE_INSTALL_STAGING_CMDS
 	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
 	rm -f $(STAGING_DIR)/usr/lib/liblockfile.so
 	$(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
 	ln -sf liblockfile.so $(STAGING_DIR)/usr/lib/liblockfile.so.1
-	touch -c $@
+endef
 
-$(TARGET_DIR)/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/$(LIBLOCKFILE_BINARY)
-	mkdir -p $(@D)
-	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(@D)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	touch -c $@
+define LIBLOCKFILE_INSTALL_TARGET_CMDS
+	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
+endef
 
-liblockfile: $(TARGET_DIR)/$(LIBLOCKFILE_BINARY)
-
-liblockfile-clean:
+define LIBLOCKFILE_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
 	rm -f $(STAGING_DIR)/usr/lib/liblockfile*
 	rm -f $(addprefix $(STAGING_DIR)/usr/include/,lockfile.h mailfile.h)
-	-$(MAKE) -C $(LIBLOCKFILE_DIR) clean
-
-liblockfile-dirclean:
-	rm -rf $(LIBLOCKFILE_DIR)
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBLOCKFILE),y)
-TARGETS+=liblockfile
-endif
+$(eval $(call AUTOTARGETS,package,liblockfile))
-- 
1.7.0.4
