From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Dec 2010 20:25:29 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: get rid of
	BR2_PACKAGE_BUSYBOX_FULLINSTALL
Message-ID: <20101221193609.C8BE18E1B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c482c5ab6f0a08f64c31ab4bd0896f9c2882c909
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on IRC, this only needs to be disabled for very specific
configurations, and it can nowadays be done with a custom busybox
.config (CONFIG_INSTALL_APPLET_DONT), so get rid of the option.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in  |   12 ------------
 package/busybox/busybox.mk |   12 +-----------
 2 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 19c68cd..79a6341 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -42,18 +42,6 @@ config BR2_BUSYBOX_VERSION
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
 	default "1.18.1"	if BR2_BUSYBOX_VERSION_1_18_X
 
-config BR2_PACKAGE_BUSYBOX_FULLINSTALL
-	bool "Install symlinks to BusyBox applets"
-	default y
-	help
-	  If you want to run BusyBox's own full install for the
-	  configured applets, then answer Y.
-
-	  This may overwrite files from other packages if your
-	  busybox includes replacement applets for the package.
-
-	  If you wish to just install /bin/busybox, then answer N.
-
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	default "package/busybox/busybox-1.18.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1010df3..8bff1a6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -126,21 +126,11 @@ define BUSYBOX_BUILD_CMDS
 		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
 endef
 
-ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
-define BUSYBOX_INSTALL_BINARY
+define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
 		-C $(@D) install
-endef
-else
-define BUSYBOX_INSTALL_BINARY
-	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
-endef
-endif
-
-define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_INSTALL_BINARY)
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
-- 
1.7.2.2
