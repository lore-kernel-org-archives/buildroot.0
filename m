From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] boa: convert to autotargets
Message-ID: <20100926202614.666A78B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85fac9e0c8bfa2230ecfaa96b765adec62315ca0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on Martin's patch to convert to gentargets.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    2 +-
 package/boa/boa-config.site-i386 |    1 -
 package/boa/boa.mk               |   98 ++++++++------------------------------
 3 files changed, 21 insertions(+), 80 deletions(-)
 delete mode 100644 package/boa/boa-config.site-i386

diff --git a/CHANGES b/CHANGES
index 82e2bd1..4a0ed4f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	New packages: xz
 
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
-	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
+	bmon, boa, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
 	e2fsprogs, expat, ezxml, fbset, freetype, gawk, gvfs, haserl,
 	hostapd, ifplugd, iperf, iproute2, iptables, jpeg, kexec,
 	kismet, less, libcurl, libdnet, libevent, libglade, libgtk2,
diff --git a/package/boa/boa-config.site-i386 b/package/boa/boa-config.site-i386
deleted file mode 100644
index 425d948..0000000
--- a/package/boa/boa-config.site-i386
+++ /dev/null
@@ -1 +0,0 @@
-ac_cv_func_setvbuf_reversed=no
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index a51de96..702193d 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -3,84 +3,26 @@
 # boa
 #
 #############################################################
-
-BOA_VERSION=0.94.14rc21
-
-# Don't alter below this line unless you (think) you know
-# what you are doing! Danger, Danger!
-
-BOA_SOURCE=boa-$(BOA_VERSION).tar.gz
-BOA_CAT:=$(ZCAT)
-BOA_SITE=http://www.boa.org/
-BOA_DIR=$(BUILD_DIR)/boa-$(BOA_VERSION)
-BOA_WORKDIR=$(BUILD_DIR)/boa_workdir
-
-$(DL_DIR)/$(BOA_SOURCE):
-	$(call DOWNLOAD,$(BOA_SITE),$(BOA_SOURCE))
-
-$(BOA_DIR)/.unpacked: $(DL_DIR)/$(BOA_SOURCE)
-	$(BOA_CAT) $(DL_DIR)/$(BOA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(BOA_DIR)/.unpacked
-
-$(BOA_WORKDIR)/Makefile: $(BOA_DIR)/.unpacked
-	rm -f $(BOA_WORKDIR)/Makefile
-	mkdir -p $(BOA_WORKDIR)
-	#CONFIG_SITE=package/boa/boa-config.site-$(ARCH)
-	(cd $(BOA_WORKDIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(BOA_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
-	touch $(BOA_WORKDIR)/Makefile
-
-$(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer: $(BOA_WORKDIR)/Makefile
-	rm -f $@
-	$(MAKE) -C $(BOA_WORKDIR)
-
-$(BOA_WORKDIR)/.installed: $(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	cp -f $(BOA_WORKDIR)/src/boa $(TARGET_DIR)/usr/sbin/boa
-	mkdir -p $(TARGET_DIR)/usr/lib/boa
-	cp -f $(BOA_WORKDIR)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
-	mkdir -p $(TARGET_DIR)/etc/boa
-	cp -f package/boa/boa.conf $(TARGET_DIR)/etc/boa
-	cp -f package/boa/mime.types $(TARGET_DIR)/etc/mime.types
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/boa $(TARGET_DIR)/usr/lib/boa/boa_indexer
-	touch $(BOA_WORKDIR)/.installed
-
-boa: $(BOA_WORKDIR)/.installed
-
-boa-source: $(DL_DIR)/$(BOA_SOURCE)
-
-boa-clean:
-	-$(MAKE) -C $(BOA_WORKDIR) clean
+BOA_VERSION = 0.94.14rc21
+BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
+BOA_SITE = http://www.boa.org/
+
+define BOA_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
+	install -D -m 755 $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
+	install -D -m 644 package/boa/boa.conf $(TARGET_DIR)/etc/boa/boa.conf
+	install -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
+endef
+
+define BOA_UNINSTALL_STAGING_CMDS
+	# autotools calls uninstall-staging even if staging install
+	# isn't enabled
+endef
+
+define BOA_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/sbin/boa \
-		$(TARGET_DIR)/usr/lib/boa/boa_indexer \
+		$(TARGET_DIR)/usr/lib/boa/ \
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
+endef
 
-boa-dirclean:
-	rm -rf $(BOA_DIR) $(BOA_WORKDIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BOA),y)
-TARGETS+=boa
-endif
+$(eval $(call AUTOTARGETS,package,boa))
-- 
1.7.1
