From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Mar 2010 11:54:22 +0100
Subject: [Buildroot] [git commit master] Bump nano to 2.2.3 and migrate to
	Makefile.autotools.in
Message-ID: <20100325105618.7B72E7FB7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=19f1506ac880135e210f3533b291d7f66feec0cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1117

[Peter: get rid of redundant DISABLE_LARGEFILE, trailing spaces]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    3 +-
 package/editors/nano/Config.in |    2 +-
 package/editors/nano/nano.mk   |   63 +++++++++-------------------------------
 3 files changed, 17 insertions(+), 51 deletions(-)

diff --git a/CHANGES b/CHANGES
index da17e0d..b748c24 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, libglib2, libpng, mdadm, memstat, mtd-utils,
-	pppd, setserial, squashfs, wget
+	nano, pppd, setserial, squashfs, wget
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -18,6 +18,7 @@
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
+	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
 	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
diff --git a/package/editors/nano/Config.in b/package/editors/nano/Config.in
index e902757..8c78096 100644
--- a/package/editors/nano/Config.in
+++ b/package/editors/nano/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_NANO
 	bool "nano"
 	select BR2_PACKAGE_NCURSES
 	help
-	  A nice ncurses-based editor.  Started out as a clone of pico.
+	  A nice ncurses-based editor. Started out as a clone of pico.
 	  Great editor for new users.
 
 	  http://www.nano-editor.org/
diff --git a/package/editors/nano/nano.mk b/package/editors/nano/nano.mk
index 2ee76d1..3e8ba50 100644
--- a/package/editors/nano/nano.mk
+++ b/package/editors/nano/nano.mk
@@ -3,57 +3,22 @@
 # nano
 #
 #############################################################
-NANO_VERSION:=1.3.12
-NANO_SOURCE:=nano-$(NANO_VERSION).tar.gz
-NANO_SITE:=http://www.nano-editor.org/dist/v1.3/
-NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
-NANO_CAT:=$(ZCAT)
-NANO_BINARY:=src/nano
-NANO_TARGET_BINARY:=usr/bin/nano
 
-$(DL_DIR)/$(NANO_SOURCE):
-	$(call DOWNLOAD,$(NANO_SITE),$(NANO_SOURCE))
+NANO_VERSION = 2.2.3
+NANO_SITE = http://www.nano-editor.org/dist/v2.2
+NANO_MAKE_ENV = CURSES_LIB="-lncurses"
+NANO_CONF_OPT = --without-slang --enable-tiny
+NANO_DEPENDENCIES = ncurses
 
-nano-source: $(DL_DIR)/$(NANO_SOURCE)
+$(eval $(call AUTOTARGETS,package,nano))
 
-$(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
-	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(NANO_DIR)
+$(NANO_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(NANO_DIR)/src/nano \
+		$(TARGET_DIR)/usr/bin/nano
 	touch $@
 
-$(NANO_DIR)/.configured: $(NANO_DIR)/.unpacked
-	(cd $(NANO_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_header_regex_h=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--enable-tiny \
-	)
-	touch $@
-
-$(NANO_DIR)/$(NANO_BINARY): $(NANO_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NANO_DIR)
-
-$(TARGET_DIR)/$(NANO_TARGET_BINARY): $(NANO_DIR)/$(NANO_BINARY)
-	install -D $(NANO_DIR)/$(NANO_BINARY) $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-
-nano: ncurses $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-
-nano-clean:
-	rm -f $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-	-$(MAKE) -C $(NANO_DIR) clean
-
-nano-dirclean:
-	rm -rf $(NANO_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NANO),y)
-TARGETS+=nano
-endif
+$(NANO_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/nano
+	rm -f $(NANO_TARGET_INSTALL_TARGET) $(NANO_HOOK_POST_INSTALL)
-- 
1.6.3.3
