From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] distcc : convert to autotools
	infrastructure & bump to 1.1-20100428
Message-ID: <20100625103239.8D1C381DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8397a4ca1b0ff32f6517e012e3e7553c5dfe3d26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

     * Target installation is the default behaviour
     * No installation to staging is the default behaviour
     * Remove DISTCC_BINARY/DISTCC_TARGET_BINARY variables

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/distcc/distcc.mk |   70 +++++++--------------------------------------
 1 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 75cfacc..f3d13bd 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -5,67 +5,19 @@
 #############################################################
 DISTCC_VERSION:=2.18.3
 DISTCC_SOURCE:=distcc-$(DISTCC_VERSION).tar.bz2
-DISTCC_CAT:=$(BZCAT)
 DISTCC_SITE:=http://distcc.samba.org/ftp/distcc/
-DISTCC_BUILDDIR:=$(BUILD_DIR)/distcc-$(DISTCC_VERSION)
-DISTCC_BINARY:=distcc
-DISTCC_TARGET_BINARY:=usr/bin/distcc
 
-$(DL_DIR)/$(DISTCC_SOURCE):
-	$(call DOWNLOAD,$(DISTCC_SITE),$(DISTCC_SOURCE))
+DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
 
-distcc-source: $(DL_DIR)/$(CVS_SOURCE)
+define DISTCC_INSTALL_TARGET_CMDS
+	install -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
+	install -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
+endef
 
-$(DISTCC_BUILDDIR)/.unpacked: $(DL_DIR)/$(DISTCC_SOURCE)
-	$(DISTCC_CAT) $(DL_DIR)/$(DISTCC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(DISTCC_BUILDDIR)
-	touch $(DISTCC_BUILDDIR)/.unpacked
+define DISTCC_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/distcc
+	rm -f $(TARGET_DIR)/usr/bin/distccd
+	-$(MAKE) -C $(@D) clean
+endef
 
-$(DISTCC_BUILDDIR)/.configured: $(DISTCC_BUILDDIR)/.unpacked
-	(cd $(DISTCC_BUILDDIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-included-popt \
-		--without-gtk \
-		--without-gnome \
-	)
-	touch $(DISTCC_BUILDDIR)/.configured
-
-$(DISTCC_BUILDDIR)/$(DISTCC_BINARY): $(DISTCC_BUILDDIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DISTCC_BUILDDIR)
-
-$(TARGET_DIR)/$(DISTCC_TARGET_BINARY): $(DISTCC_BUILDDIR)/$(DISTCC_BINARY)
-	install -D $(DISTCC_BUILDDIR)/$(DISTCC_BINARY)d $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d
-	install -D $(DISTCC_BUILDDIR)/$(DISTCC_BINARY) $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
-
-distcc: $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
-
-distcc-clean:
-	rm -f $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d
-	-$(MAKE) -C $(DISTCC_BUILDDIR) clean
-
-distcc-dirclean:
-	rm -rf $(DISTCC_BUILDDIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DISTCC),y)
-TARGETS+=distcc
-endif
+$(eval $(call AUTOTARGETS,package,distcc))
-- 
1.7.1
