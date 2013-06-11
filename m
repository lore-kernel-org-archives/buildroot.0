From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 11 Jun 2013 12:18:39 +0200
Subject: [Buildroot] [PATCHv3 1/3] Add on2-8170 kernel modules
Message-ID: <1370945921-23444-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/on2-8170-modules/Config.in           | 11 +++++++++++
 package/on2-8170-modules/on2-8170-modules.mk | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/on2-8170-modules/Config.in
 create mode 100644 package/on2-8170-modules/on2-8170-modules.mk

diff --git a/package/Config.in b/package/Config.in
index ce82e99..e915abe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -272,6 +272,7 @@ source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
 source "package/neard/Config.in"
 source "package/ofono/Config.in"
+source "package/on2-8170-modules/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/owl-linux/Config.in"
diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
new file mode 100644
index 0000000..0c13b8c
--- /dev/null
+++ b/package/on2-8170-modules/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ON2_8170_MODULES
+	bool "on2-8170 modules"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm926t
+	help
+	  Kernel modules for the Hantro x170 hardware video decompression.
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
+comment "on2-8170 modules requires a linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
new file mode 100644
index 0000000..800abc7
--- /dev/null
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# on2-8170-modules
+#
+################################################################################
+
+ON2_8170_MODULES_VERSION = 73b0806
+ON2_8170_MODULES_SITE    = http://github.com/alexandrebelloni/on2-8170-modules/tarball/$(ON2_8170_MODULES_VERSION)
+
+ON2_8170_MODULES_DEPENDENCIES = linux
+
+ON2_8170_MODULES_LICENSE = GPLv2+
+#There is no license file
+
+define ON2_8170_MODULES_BUILD_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
+endef
+
+define ON2_8170_MODULES_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
