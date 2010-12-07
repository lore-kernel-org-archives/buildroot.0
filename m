From: Mike Frysinger <vapier@gentoo.org>
Date: Tue,  7 Dec 2010 16:05:50 -0500
Subject: [Buildroot] [PATCH v3] whetstone: new benchmark package
In-Reply-To: <1290235409-31995-1-git-send-email-vapier@gentoo.org>
References: <1290235409-31995-1-git-send-email-vapier@gentoo.org>
Message-ID: <1291755950-11680-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v3
	- leverage TARGET_CONFIGURE_OPTS
	- install into /usr/bin

 package/Config.in              |    1 +
 package/whetstone/Config.in    |    6 ++++++
 package/whetstone/whetstone.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/whetstone/Config.in
 create mode 100644 package/whetstone/whetstone.mk

diff --git a/package/Config.in b/package/Config.in
index d3629ff..d6e0a55 100644
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
index 0000000..d47fbcd
--- /dev/null
+++ b/package/whetstone/whetstone.mk
@@ -0,0 +1,33 @@
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
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
+endef
+
+define WHETSTONE_CLEAN_CMDS
+	rm -f $(@D)/whetstone
+endef
+
+define WHETSTONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
+endef
+
+define WHETSTONE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/whetstone
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
