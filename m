From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 23 Mar 2012 15:37:34 +0100
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host tool
Message-ID: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
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
v2: remove old parameters to GENTARGETS call, sorry.
v3: rename Config.in.host and depend on Linux (comments Arnout)

 package/Config.in.host     |   1 +
 package/dtc/Config.in.host |   8 ++++++++
 package/dtc/dtc.mk         |  14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/dtc/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
new file mode 100644
--- /dev/null
+++ b/package/dtc/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_DTC
+	bool "Device Tree Compiler (dtc)"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Device Tree Compiler for flattened-device trees.
+
+comment "The dtc device tree compiler depends on the Linux kernel sources."
+    depends on !BR2_LINUX_KERNEL
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
new file mode 100644
--- /dev/null
+++ b/package/dtc/dtc.mk
@@ -0,0 +1,14 @@
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
+$(eval $(call GENTARGETS,host))
