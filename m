From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 09:41:59 +0100
Subject: [Buildroot] [git commit] add new package fxload
Message-ID: <20121107095017.9DD8D99BD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7103905fdeb4a92e4572045e16396e53cd1bf749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/fxload/Config.in |    9 +++++++++
 package/fxload/fxload.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

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
