From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Nov 2019 03:48:20 +0000
Subject: [Buildroot] [PATCH v1 1/1] mbpfan: new package
In-Reply-To: <20191122034820.3378-1-christian@paral.in>
References: <20191122034820.3378-1-christian@paral.in>
Message-ID: <20191122034820.3378-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the "mbpfan" fan speed controller daemon for Macbook Pro
laptops.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mbpfan/Config.in |  7 +++++++
 package/mbpfan/mbpfan.mk | 30 ++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/mbpfan/Config.in
 create mode 100644 package/mbpfan/mbpfan.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..7630312390 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -529,6 +529,7 @@ F:	package/docker-containerd/
 F:	package/docker-engine/
 F:	package/docker-proxy/
 F:	package/go/
+F:	package/mbpfan/
 F:	package/mosh/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..937e296a2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -480,6 +480,7 @@ endmenu
 	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
+	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
 	source "package/memtest86/Config.in"
diff --git a/package/mbpfan/Config.in b/package/mbpfan/Config.in
new file mode 100644
index 0000000000..b941af5fa0
--- /dev/null
+++ b/package/mbpfan/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MBPFAN
+	bool "mbpfan"
+	depends on BR2_USE_MMU
+	help
+	  mbpfan is a utility which controls the macbook pro fans.
+
+	  https://github.com/linux-on-mac/mbpfan
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
new file mode 100644
index 0000000000..0cb84603ca
--- /dev/null
+++ b/package/mbpfan/mbpfan.mk
@@ -0,0 +1,30 @@
+148  ag from [...ralin/Documents/synrobo/skiff/]: ################################################################################
+#
+# mbpfan
+#
+################################################################################
+
+MBPFAN_VERSION = 2.2.0
+MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
+MBPFAN_LICENSE = GPL-3.0+
+MBPFAN_LICENSE_FILES = COPYING
+
+define MBPFAN_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define MBPFAN_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/bin/mbpfan $(TARGET_DIR)/usr/sbin/mbpfan
+endef
+
+define MBPFAN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mbpfan.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mbpfan.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/mbpfan.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mbpfan.service
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
