From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 00:09:22 +0200
Subject: [Buildroot] [git commit branch/next] sunxi-tools: new host/target
	package
Message-ID: <20130527221105.C20399A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e76dadc86ef9b7c80ae763d26d62e0bd42a24bd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: Fix Config.in wordwrap and trailing lines]
Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/Config.in.host             |    1 +
 package/sunxi-tools/Config.in      |    9 ++++++++
 package/sunxi-tools/Config.in.host |   12 +++++++++++
 package/sunxi-tools/sunxi-tools.mk |   37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8bf1652..28c2c5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/ntfs-3g/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
+source "package/sunxi-tools/Config.in"
 source "package/unionfs/Config.in"
 source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/Config.in.host b/package/Config.in.host
index 7c0dd20..54178ea 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
new file mode 100644
index 0000000..16bf2dc
--- /dev/null
+++ b/package/sunxi-tools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SUNXI_TOOLS
+	bool "sunxi nand-part"
+	depends on BR2_arm
+	help
+	  nand-part is part of sunxi-tools for Allwinner A10 (aka sun4i) and
+	  A13 (aka sun5i) based devices. It is a tool to repartition the
+	  internal NAND on sunxi devices.
+
+	  http://linux-sunxi.org/Sunxi-tools
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
new file mode 100644
index 0000000..5fab5e6
--- /dev/null
+++ b/package/sunxi-tools/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_SUNXI_TOOLS
+	bool "host sunxi-tools"
+	depends on BR2_arm
+	help
+	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
+	  based devices. This includes fex2bin which can be used to
+	  compile .fex board definition files to the binary script.bin
+	  format required by the linux-sunxi kernel. These tools are
+	  specific for linux-sunxi kernel and do not apply to the
+	  mainline Linux kernel version.
+
+	  http://linux-sunxi.org/Sunxi-tools
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
new file mode 100644
index 0000000..a97dfcb
--- /dev/null
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# sunxi-tools
+#
+#############################################################
+
+SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
+SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
+SUNXI_TOOLS_LICENSE = GPLv2+
+SUNXI_TOOLS_LICENSE_FILES = COPYING
+HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
+FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
+
+define HOST_SUNXI_TOOLS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+		-C $(@D)
+endef
+
+define HOST_SUNXI_TOOLS_INSTALL_CMDS
+	for i in fexc bin2fex fex2bin bootinfo fel pio; do \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/usr/bin/$$i ; \
+	done
+endef
+
+define SUNXI_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
+		-C $(@D) nand-part
+endef
+
+define SUNXI_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nand-part $(TARGET_DIR)/usr/bin/nand-part
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
