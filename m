From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:47:09 +0200
Subject: [Buildroot] [git commit] bridge-utils: normalize package name
Message-ID: <20110920205935.964A98D72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53b26022965cdbeafe5e584d77354c68d229805b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bridge-utils/Config.in                     |    2 +-
 package/bridge-utils/bridge-utils.mk               |   18 ++++++++++++++++++
 .../{bridge.patch => bridge-utils.patch}           |    0
 package/bridge-utils/bridge.mk                     |   18 ------------------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index c2e8ca0..537eb1f 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_BRIDGE
+config BR2_PACKAGE_BRIDGE_UTILS
 	bool "bridge-utils"
 	help
 	  Manage ethernet bridging; a way to connect networks together to
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
new file mode 100644
index 0000000..6807493
--- /dev/null
+++ b/package/bridge-utils/bridge-utils.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# bridge-utils
+#
+#############################################################
+
+BRIDGE_UTILS_VERSION = 1.5
+BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.gz
+BRIDGE_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge
+BRIDGE_UTILS_AUTORECONF = YES
+BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
+
+define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
+		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
+endef
+
+$(eval $(call AUTOTARGETS,package,bridge-utils))
diff --git a/package/bridge-utils/bridge.patch b/package/bridge-utils/bridge-utils.patch
similarity index 100%
rename from package/bridge-utils/bridge.patch
rename to package/bridge-utils/bridge-utils.patch
diff --git a/package/bridge-utils/bridge.mk b/package/bridge-utils/bridge.mk
deleted file mode 100644
index 8f3f741..0000000
--- a/package/bridge-utils/bridge.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-#############################################################
-#
-# bridge-utils
-#
-#############################################################
-
-BRIDGE_VERSION = 1.5
-BRIDGE_SOURCE = bridge-utils-$(BRIDGE_VERSION).tar.gz
-BRIDGE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge
-BRIDGE_AUTORECONF = YES
-BRIDGE_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
-
-define BRIDGE_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
-		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
-endef
-
-$(eval $(call AUTOTARGETS,package,bridge))
