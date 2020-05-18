From: Christian Stewart <christian@paral.in>
Date: Sun, 17 May 2020 20:48:58 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/mbpfan: new package
Message-ID: <20200518034858.115510-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding mbpfan, a fan control daemon for MacBook laptops.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in        |  1 +
 package/mbpfan/Config.in |  9 +++++++++
 package/mbpfan/mbpfan.mk | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/mbpfan/Config.in
 create mode 100644 package/mbpfan/mbpfan.mk

diff --git a/package/Config.in b/package/Config.in
index c245abbc42..dd5951228b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -488,6 +488,7 @@ endmenu
 	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
+	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
 	source "package/memtest86/Config.in"
diff --git a/package/mbpfan/Config.in b/package/mbpfan/Config.in
new file mode 100644
index 0000000000..231faa2b15
--- /dev/null
+++ b/package/mbpfan/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MBPFAN
+	bool "mbpfan"
+	depends on BR2_USE_MMU
+	help
+	  Mbpfan is a daemon for MacBook laptops which monitors the
+	  CPU temperature with the coretemp module, and sets the fan
+	  speeds with the applesmc module.
+
+	  https://github.com/linux-on-mac/mbpfan
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
new file mode 100644
index 0000000000..e3f3a23377
--- /dev/null
+++ b/package/mbpfan/mbpfan.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# mbpfan
+#
+################################################################################
+
+MBPFAN_VERSION = 2.2.1
+MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
+MBPFAN_LICENSE = GPL-3.0+
+MBPFAN_LICENSE_FILES = COPYING
+
+define MBPFAN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define MBPFAN_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/mbpfan.conf \
+		$(TARGET_DIR)/etc/mbpfan.conf
+	$(INSTALL) -m 0755 $(@D)/bin/mbpfan $(TARGET_DIR)/usr/sbin/mbpfan
+endef
+
+define MOTION_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/mbpfan.init.debian \
+		$(TARGET_DIR)/etc/init.d/S99mbpfan
+endef
+
+define MBPFAN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mbpfan.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mbpfan.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/mbpfan.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mbpfan.service
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
