From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 01:10:58 -0500
Subject: [Buildroot] [PATCH] whetstone: new benchmark package
Message-ID: <1290233458-23229-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Config.in              |    1 +
 package/whetstone/Config.in    |    6 ++++++
 package/whetstone/whetstone.mk |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/whetstone/Config.in
 create mode 100644 package/whetstone/whetstone.mk

diff --git a/package/Config.in b/package/Config.in
index 0b131a0..407facc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/strace/Config.in"
+source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 endmenu
 
diff --git a/package/whetstone/Config.in b/package/whetstone/Config.in
new file mode 100644
index 0000000..7a68160
--- /dev/null
+++ b/package/whetstone/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_WHETSTONE
+	bool "whetstone"
+	help
+	  C Converted Whetstone Double Precision Benchmark
+
+	  http://www.netlib.org/benchmark/
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
new file mode 100644
index 0000000..e043f3c
--- /dev/null
+++ b/package/whetstone/whetstone.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# whetstone
+#
+#############################################################
+
+WHETSTONE_VERSION = 1.2
+WHETSTONE_SOURCE = whetstone.c
+WHETSTONE_SITE = http://www.netlib.org/benchmark/
+
+define WHETSTONE_BUILD_CMDS
+	$(MAKE) \
+		CC="$(TARGET_CC)" 
+		CFLAGS="$(TARGET_CFLAGS) -Wall -DNO_PROTOTYPES=1"
+		LDLIBS="-lm" \
+		-C $(@D) whetstone
+endef
+
+define WHETSTONE_CLEAN_CMDS
+	rm -f $(@D)/whetstone
+endef
+
+define WHETSTONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/bin/whetstone
+endef
+
+define WHETSTONE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/bin/whetstone
+endef
+
+$(eval $(call GENTARGETS,package,whetstone))
+
+$(BUILD_DIR)/whetstone-$(WHETSTONE_VERSION)/.stamp_extracted:
+	@$(call MESSAGE,"Extracting")
+	$(Q)mkdir -p $(@D)
+	$(Q)cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	$(Q)touch $@
-- 
1.7.3.2
