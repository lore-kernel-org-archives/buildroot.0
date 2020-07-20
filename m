From: christoph.muellner at theobroma-systems.com <christoph.muellner@theobroma-systems.com>
Date: Mon, 20 Jul 2020 17:20:10 +0200
Subject: [Buildroot] [PATCH] package/urandom-scripts: new package
Message-ID: <20200720152010.292703-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christoph M?llner <christoph.muellner@theobroma-systems.com>

The init script S20urandom is used to preserve the kernel's RNG
seed between reboots. This functionality is not required for the
package "initscripts". Further there are use-cases where this script
should not be installed at all (e.g. systems that only have read-only
partitions), but that's currently not possible as the script is
a mandatory part of the package "initscripts".

Let's move the script into its own package "urandom-scripts" and select it,
if the default skeleton is enabled. This maintains backward-compatibility
and allows to deselect it.

Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
---
 package/Config.in                                    |  1 +
 package/urandom-scripts/Config.in                    |  6 ++++++
 .../init.d => urandom-scripts}/S20urandom            |  0
 package/urandom-scripts/urandom-scripts.mk           | 12 ++++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 package/urandom-scripts/Config.in
 rename package/{initscripts/init.d => urandom-scripts}/S20urandom (100%)
 create mode 100644 package/urandom-scripts/urandom-scripts.mk

diff --git a/package/Config.in b/package/Config.in
index 22531d4fb5..89bcafc398 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2290,6 +2290,7 @@ menu "Security"
 	source "package/selinux-python/Config.in"
 	source "package/semodule-utils/Config.in"
 	source "package/setools/Config.in"
+	source "package/urandom-scripts/Config.in"
 endmenu
 
 menu "Shell and utilities"
diff --git a/package/urandom-scripts/Config.in b/package/urandom-scripts/Config.in
new file mode 100644
index 0000000000..5451206bd2
--- /dev/null
+++ b/package/urandom-scripts/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_URANDOM_SCRIPTS
+	bool "urandom-initscripts"
+	default y if BR2_ROOTFS_SKELETON_DEFAULT
+	depends on BR2_PACKAGE_INITSCRIPTS
+	help
+	  Initscript to preserve the random seed between reboots.
diff --git a/package/initscripts/init.d/S20urandom b/package/urandom-scripts/S20urandom
similarity index 100%
rename from package/initscripts/init.d/S20urandom
rename to package/urandom-scripts/S20urandom
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
new file mode 100644
index 0000000000..2c09728c46
--- /dev/null
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# urandom-scripts
+#
+################################################################################
+
+define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20urandom \
+		$(TARGET_DIR)/etc/init.d/S20urandom
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
