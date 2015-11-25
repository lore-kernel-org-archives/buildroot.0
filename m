From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 12:09:21 +0100
Subject: [Buildroot] [git commit] sunxi-tools: bump version, add hash
Message-ID: <20151201232122.452A081945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e5ec5b9074bd7732c02b891eed5d3db0a442d9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has reworked its build system, so it now supports PREFIX and 'make
install', so use those.

Notice that the tools have also gained a sunxi- prefix, so use that as well
when installing the target variant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-tools/sunxi-tools.hash |  2 ++
 package/sunxi-tools/sunxi-tools.mk   | 17 ++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
new file mode 100644
index 0000000..c0499cd
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	2aa0afc21476ee9b03acff20a19f32c522106e61bcbfa1a9463168fe90a85fc5  sunxi-tools-v1.3.tar.gz
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 049af9b..4c497c7 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 82b9c656868d99553f11b1c8853ca808c7ce41ae
+SUNXI_TOOLS_VERSION = v1.3
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
@@ -12,25 +12,24 @@ HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
 		CFLAGS="$(HOST_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
-		-C $(@D)
+		-C $(@D) tools
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-	for i in fexc bin2fex fex2bin bootinfo fel pio; do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/usr/bin/$$i ; \
-	done
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
+		-C $(@D) install-tools
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr \
 		CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
-		-C $(@D) nand-part
+		-C $(@D) sunxi-nand-part
 endef
 
 define SUNXI_TOOLS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/nand-part $(TARGET_DIR)/usr/bin/nand-part
+	$(INSTALL) -D -m 0755 $(@D)/sunxi-nand-part $(TARGET_DIR)/usr/bin/sunxi-nand-part
 endef
 
 $(eval $(generic-package))
