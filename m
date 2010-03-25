From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Mar 2010 11:54:22 +0100
Subject: [Buildroot] [git commit master] Bump less to 436 and migrate to
	Makefile.autotools.in
Message-ID: <20100325105618.AFCCE7FB7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4f0361ab2ca4f25207c84b557e31319c9a417a76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1123

[Peter: get rid of redundant DISABLE_LARGEFILE]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    5 ++-
 package/less/less.mk |   61 +++++++++-----------------------------------------
 2 files changed, 14 insertions(+), 52 deletions(-)

diff --git a/CHANGES b/CHANGES
index b748c24..533a8e6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	New packages: librsync, lmbench, squid
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	freetype, iperf, libglib2, libpng, mdadm, memstat, mtd-utils,
-	nano, pppd, setserial, squashfs, wget
+	freetype, iperf, less, libglib2, libpng, mdadm, memstat,
+	mtd-utils, nano, pppd, setserial, squashfs, wget
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -19,6 +19,7 @@
 	#805: [PATCH] mdadm - version update
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
+	#1123: Bump less to 436 and migrate to Makefile.autotools.in
 	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
diff --git a/package/less/less.mk b/package/less/less.mk
index af4c2da..706a3e0 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -3,58 +3,19 @@
 # less
 #
 #############################################################
-LESS_VERSION:=394
-LESS_SOURCE:=less-$(LESS_VERSION).tar.gz
-LESS_SITE:=http://www.greenwoodsoftware.com/less
-LESS_DIR:=$(BUILD_DIR)/less-$(LESS_VERSION)
-LESS_BINARY:=less
-LESS_TARGET_BINARY:=usr/bin/less
 
-$(DL_DIR)/$(LESS_SOURCE):
-	$(call DOWNLOAD,$(LESS_SITE),$(LESS_SOURCE))
+LESS_VERSION = 436
+LESS_SITE = http://www.greenwoodsoftware.com/less
 
-$(LESS_DIR)/.source: $(DL_DIR)/$(LESS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LESS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
+$(eval $(call AUTOTARGETS,package,less))
 
-$(LESS_DIR)/.configured: $(LESS_DIR)/.source
-	(cd $(LESS_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
+$(LESS_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(LESS_DIR)/less \
+		$(TARGET_DIR)/usr/bin/less
 	touch $@
 
-$(LESS_DIR)/$(LESS_BINARY): $(LESS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LESS_DIR)
-
-$(TARGET_DIR)/$(LESS_TARGET_BINARY): $(LESS_DIR)/$(LESS_BINARY)
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LESS_DIR) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -Rf $(TARGET_DIR)/usr/man
-endif
-
-less: ncurses $(TARGET_DIR)/$(LESS_TARGET_BINARY)
-
-less-source: $(DL_DIR)/$(LESS_SOURCE)
-
-less-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LESS_DIR) uninstall
-	-$(MAKE) -C $(LESS_DIR) clean
-
-less-dirclean:
-	rm -rf $(LESS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LESS),y)
-TARGETS+=less
-endif
+$(LESS_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/less
+	rm -f $(LESS_TARGET_INSTALL_TARGET) $(LESS_HOOK_POST_INSTALL)
-- 
1.6.3.3
