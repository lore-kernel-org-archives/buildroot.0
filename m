From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 17:57:17 +0100
Subject: [Buildroot] [PATCH] Add dtc (device tree compiler) as host tool
Message-ID: <68fbe51c29931a6eecc3.1331744237@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dtc is taken from the Linux kernel sources and simply copied to the host
directory.
Having dtc as a separate host tool can be useful for users that have a custom
boot scenario where the device tree is not embedded in the kernel.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Config.in.host |   1 +
 package/dtc/Config.in  |   4 ++++
 package/dtc/dtc.mk     |  15 +++++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/dtc/Config.in"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
new file mode 100644
--- /dev/null
+++ b/package/dtc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_DTC
+	bool "Device Tree Compiler (dtc)"
+	help
+	  Device Tree Compiler for flattened-device trees.
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
new file mode 100644
--- /dev/null
+++ b/package/dtc/dtc.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# dtc
+#
+#############################################################
+
+HOST_DTC_SOURCE =
+HOST_DTC_DEPENDENCIES = linux
+
+define HOST_DTC_INSTALL_CMDS
+    $(INSTALL) -D -m 0755 $(LINUX_DIR)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc
+endef
+
+$(eval $(call GENTARGETS,package,dtc,host))
+
