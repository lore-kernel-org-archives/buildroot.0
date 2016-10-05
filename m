From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 09:59:58 +0200
Subject: [Buildroot] [git commit] sunxi-tools: bump to latest git revision
Message-ID: <20161005080004.550C682235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb5cc2a7002673a0680885c8ce88126883cbee23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Major changes since v1.3:
- A64/A80 support
- H3 fel speedup
- Fel readl/writel/sid/reset64 commands
- Fel progress bar support
- Nand-image-builder tool
- Linaro toolchain compatibility workaround
- Portability fixes

The build system has been reworked somewhat and extra compiler flags now
have to be passed in EXTRA_CFLAGS instead of CFLAGS, so we cannot use
{TARGET,HOST}_CONFIGURE_OPTS.
Instead explicitly pass the needed variables (CC and LDFLAGS).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-tools/sunxi-tools.hash |  2 +-
 package/sunxi-tools/sunxi-tools.mk   | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index c0499cd..90991a3 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2aa0afc21476ee9b03acff20a19f32c522106e61bcbfa1a9463168fe90a85fc5  sunxi-tools-v1.3.tar.gz
+sha256	8b5defeaabec99b6c759ed1d99d91e4d23188431868d17cf6ed144f37e42bee5  sunxi-tools-89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6.tar.gz
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 4c497c7..23e3135 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = v1.3
+SUNXI_TOOLS_VERSION = 89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
@@ -12,19 +12,19 @@ HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
-		CFLAGS="$(HOST_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR)/usr \
+		EXTRA_CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
 		-C $(@D) tools
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR)/usr \
 		-C $(@D) install-tools
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr \
-		CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" PREFIX=/usr \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		-C $(@D) sunxi-nand-part
 endef
 
