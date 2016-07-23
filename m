From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 23 Jul 2016 11:18:50 -0300
Subject: [Buildroot] [PATCH] tunctl: new package
Message-ID: <1469283530-24618-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tunctl is a tool for controlling the TUN/TAP driver in Linux.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/Config.in          |  1 +
 package/tunctl/Config.in   |  6 ++++++
 package/tunctl/tunctl.hash |  2 ++
 package/tunctl/tunctl.mk   | 22 ++++++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/tunctl/Config.in
 create mode 100644 package/tunctl/tunctl.hash
 create mode 100644 package/tunctl/tunctl.mk

diff --git a/package/Config.in b/package/Config.in
index 6b5b011a817c..46ad2768f44e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1575,6 +1575,7 @@ endif
 	source "package/tn5250/Config.in"
 	source "package/tor/Config.in"
 	source "package/transmission/Config.in"
+	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
 	source "package/ulogd/Config.in"
diff --git a/package/tunctl/Config.in b/package/tunctl/Config.in
new file mode 100644
index 000000000000..26eed4c31e7a
--- /dev/null
+++ b/package/tunctl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TUNCTL
+	bool "tunctl"
+	help
+	  Tunctl is a tool for controlling the TUN/TAP driver in Linux.
+
+	  https://sourceforge.net/projects/tunctl/
diff --git a/package/tunctl/tunctl.hash b/package/tunctl/tunctl.hash
new file mode 100644
index 000000000000..d3aaeecef8b9
--- /dev/null
+++ b/package/tunctl/tunctl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff  tunctl-1.5.tar.gz
diff --git a/package/tunctl/tunctl.mk b/package/tunctl/tunctl.mk
new file mode 100644
index 000000000000..5011144b1753
--- /dev/null
+++ b/package/tunctl/tunctl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tunctl
+#
+################################################################################
+
+TUNCTL_VERSION = 1.5
+TUNCTL_SOURCE = tunctl-$(TUNCTL_VERSION).tar.gz
+TUNCTL_SITE = http://downloads.sourceforge.net/project/tunctl/tunctl/$(TUNCTL_VERSION)
+
+TUNCTL_LICENSE = GPLv2
+TUNCTL_LICENSE_FILES = tunctl.c
+
+define TUNCTL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) tunctl
+endef
+
+define TUNCTL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/tunctl $(TARGET_DIR)/usr/sbin/tunctl
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
