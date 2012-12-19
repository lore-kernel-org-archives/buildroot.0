From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Dec 2012 00:37:31 +0100
Subject: [Buildroot] [PATCH RFC 1/6] imx-lib: new package
In-Reply-To: <1355960256-10786-1-git-send-email-arnout@mind.be>
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
Message-ID: <1355960256-10786-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in          |    1 +
 package/imx-lib/Config.in  |   53 ++++++++++++++++++++++++++++++++++++++++++++
 package/imx-lib/imx-lib.mk |   41 ++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 package/imx-lib/Config.in
 create mode 100644 package/imx-lib/imx-lib.mk

diff --git a/package/Config.in b/package/Config.in
index 66445ff..def4b20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,6 +421,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
+source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
diff --git a/package/imx-lib/Config.in b/package/imx-lib/Config.in
new file mode 100644
index 0000000..1617009
--- /dev/null
+++ b/package/imx-lib/Config.in
@@ -0,0 +1,53 @@
+comment "imx-lib needs an imx-specific kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_IMX_LIB
+	bool "imx-lib"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Library of userspace helpers specific for the Freescale i.MX
+	  platform. It wraps the kernel interfaces for some i.MX platform
+	  specific drivers. It requires a kernel that includes the i.MX
+	  specific headers to be built.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
+if BR2_PACKAGE_IMX_LIB
+choice
+	prompt "i.MX platform"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
+	bool "imx25-3stack"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
+	bool "imx27ads"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
+	bool "imx37-3stack"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
+	bool "imx50"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
+	bool "imx51"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
+	bool "imx53"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
+	bool "imx6q"
+
+endchoice
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM
+	string
+	default "IMX25_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
+	default "IMX27ADS" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
+	default "IMX37_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
+	default "IMX50" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
+	default "IMX51" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
+	default "IMX53" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
+	default "IMX6Q" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
+endif
diff --git a/package/imx-lib/imx-lib.mk b/package/imx-lib/imx-lib.mk
new file mode 100644
index 0000000..c168c80
--- /dev/null
+++ b/package/imx-lib/imx-lib.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# imx-lib
+#
+#############################################################
+
+IMX_LIB_VERSION = 12.09.01
+# No official download site from freescale, just this mirror
+IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
+IMX_LIB_LICENSE = LGPLv2.1+
+# No license file included
+
+IMX_LIB_INSTALL_STAGING = YES
+
+# imx-lib needs access to imx-specific kernel headers
+IMX_LIB_DEPENDENCIES += linux
+IMX_LIB_INCLUDE = \
+	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
+	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
+	-idirafter $(LINUX_DIR)/include
+
+IMX_LIB_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
+	INCLUDE="$(IMX_LIB_INCLUDE)"
+
+define IMX_LIB_BUILD_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_LIB_INSTALL_STAGING_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
+endef
+
+define IMX_LIB_INSTALL_TARGET_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
