From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 15 Jan 2014 13:55:54 +0100
Subject: [Buildroot] [PATCH 1/1] mmc-utils: new package
Message-ID: <1389790554-24337-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mmc-utils provides tools to manipulate mmc device registers.
It is under "Hardware handling".

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/Config.in              |  1 +
 package/mmc-utils/Config.in    | 10 ++++++++++
 package/mmc-utils/mmc-utils.mk | 23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/mmc-utils/Config.in
 create mode 100644 package/mmc-utils/mmc-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 78c0e06..058c1e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -312,6 +312,7 @@ source "package/mdadm/Config.in"
 source "package/media-ctl/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
+source "package/mmc-utils/Config.in"
 source "package/nanocom/Config.in"
 source "package/neard/Config.in"
 source "package/ofono/Config.in"
diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
new file mode 100644
index 0000000..07650c8
--- /dev/null
+++ b/package/mmc-utils/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MMC_UTILS
+	bool "mmc-utils"
+	depends on BR2_LARGEFILE
+	help
+	  MMC utils
+
+	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
+
+comment "mmc-utils needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
new file mode 100644
index 0000000..857d9ac
--- /dev/null
+++ b/package/mmc-utils/mmc-utils.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# mmc-utils
+#
+################################################################################
+
+MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
+MMC_UTILS_SITE    = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_LICENSE = GPLv2
+
+define MMC_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define MMC_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
+endef
+
+define MMC_UTILS_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/bin/mmc
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
