From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  6 Nov 2012 11:50:12 +0100
Subject: [Buildroot] [PATCH] add new package fxload
Message-ID: <1352199012-7746-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
v2: Incorporated comments from Arnout,

I am not sure about the make install target line,

I would have expected prefix= to be set by the environement, but maybe it is not a standard var name for make...
---
 package/Config.in        |    1 +
 package/fxload/Config.in |    9 +++++++++
 package/fxload/fxload.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/fxload/Config.in
 create mode 100644 package/fxload/fxload.mk

diff --git a/package/Config.in b/package/Config.in
index e531c41..bcd1b47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/fmtools/Config.in"
+source "package/fxload/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
 source "package/gpsd/Config.in"
diff --git a/package/fxload/Config.in b/package/fxload/Config.in
new file mode 100644
index 0000000..ac190f0
--- /dev/null
+++ b/package/fxload/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FXLOAD
+	bool "fxload"
+	help
+	  This program is conveniently able to download firmware into FX, FX2,
+	  and FX2LP EZ-USB devices, as well as the original AnchorChips EZ-USB.
+	  It is intended to be invoked by hotplug scripts when the unprogrammed
+	  device appears on the bus.
+
+	  http://sourceforge.net/projects/linux-hotplug/
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
new file mode 100644
index 0000000..1b5e8c7
--- /dev/null
+++ b/package/fxload/fxload.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# fxload
+#
+#############################################################
+FXLOAD_VERSION = 2008_10_13
+FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)
+FXLOAD_LICENSE = GPLv2+
+FXLOAD_LICENSE_FILE = COPYING
+
+define FXLOAD_BUILD_CMDS
+    $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define FXLOAD_INSTALL_TARGET_CMDS
+    $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) prefix=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
