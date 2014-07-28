From: steffenhoenig <s.hoenig@openthinclient.com>
Date: Mon, 28 Jul 2014 21:34:24 +0200
Subject: [Buildroot] [PATCH 1/2] aufs-utils: initial release
Message-ID: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: steffenhoenig <mail@steffenhoenig.com>
---
 package/Config.in                |  1 +
 package/aufs-utils/Config.in     |  4 ++++
 package/aufs-utils/aufs-utils.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/aufs-utils/Config.in
 create mode 100644 package/aufs-utils/aufs-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 559b895..b49908c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -136,6 +136,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs-utils/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cramfs/Config.in"
diff --git a/package/aufs-utils/Config.in b/package/aufs-utils/Config.in
new file mode 100644
index 0000000..fc77218
--- /dev/null
+++ b/package/aufs-utils/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_AUFS_UTILS
+	bool "aufs-utils"
+	help
+          Utilities for Aufs3
diff --git a/package/aufs-utils/aufs-utils.mk b/package/aufs-utils/aufs-utils.mk
new file mode 100644
index 0000000..de14e81
--- /dev/null
+++ b/package/aufs-utils/aufs-utils.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# aufs-utils
+#
+################################################################################
+
+AUFS_UTILS_VERSION = aufs3.9
+AUFS_UTILS_LICENCSE = GPLv2
+AUFS_UTILS_LICENSE_FILES = COPYING
+AUFS_UTILS_SITE = http://git.code.sf.net/p/aufs/aufs-util
+AUFS_UTILS_SITE_METHOD = git
+AUFS_UTILS_DEPENDENCIES = aufs
+
+AUFS_UTILS_SBIN = mount.aufs umount.aufs # auplink auibusy aumvdown
+AUFS_UTILS_UBIN = aubusy auchk aubrsync # auctl
+
+define AUFS_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/libau CPPFLAGS="-I$(STAGING_DIR)/usr/include" KDIR=$(LINUX_DIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" libau.so
+	$(MAKE) -C $(@D) CPPFLAGS="-I$(STAGING_DIR)/usr/include" KDIR=$(LINUX_DIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" $(AUFS_UTILS_SBIN)
+endef
+
+define AUFS_UTILS_INSTALL_TARGET_CMDS
+	$(foreach p,$(AUFS_UTILS_SBIN),$(INSTALL) -D -m 0755 $(@D)/$(p) $(TARGET_DIR)/sbin/;)
+	$(foreach p,$(AUFS_UTILS_UBIN),$(INSTALL) -D -m 0755 $(@D)/$(p) $(TARGET_DIR)/usr/bin/;)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
