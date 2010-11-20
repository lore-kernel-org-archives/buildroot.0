From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 01:43:29 -0500
Subject: [Buildroot] [PATCH v2] whetstone: new benchmark package
In-Reply-To: <1290233458-23229-1-git-send-email-vapier@gentoo.org>
References: <1290233458-23229-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290235409-31995-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- tweak flag passing when building

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
index 0000000..ab3c147
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
+	CFLAGS="$(TARGET_CFLAGS) -Wall -DNO_PROTOTYPES=1" \
+	$(MAKE) \
+		CC="$(TARGET_CC)" \
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
