From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 18 Jul 2017 15:10:31 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: add tmon
Message-ID: <1500415831-17747-1-git-send-email-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the tmon package to linux-tools.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

This patch assumes that
http://lists.busybox.net/pipermail/buildroot/2017-July/198216.html has
already been applied with the tweak mentioned in
http://lists.busybox.net/pipermail/buildroot/2017-July/198218.html

 package/linux-tools/Config.in             |  7 +++++++
 package/linux-tools/linux-tool-tmon.mk.in | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-tmon.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 9d5bf7a..a7f8056 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -77,4 +77,11 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
+config BR2_PACKAGE_LINUX_TOOLS_TMON
+	bool "tmon"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  tmon is a terminal-based tool (using curses) that allows access
+	  thermal information about the system.
+
 endmenu
diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
new file mode 100644
index 0000000..1330ea6
--- /dev/null
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -0,0 +1,30 @@
+################################################################################
+#
+# tmon
+#
+################################################################################
+
+LINUX_TOOLS += tmon
+
+TMON_DEPENDENCIES = ncurses
+TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	CC=$(TARGET_CC) \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+define TMON_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have the tmon tool." ; \
+		echo "At least kernel 3.13 must be used." ; \
+		exit 1 ; \
+	fi
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(TMON_MAKE_OPTS) \
+		tmon
+endef
+
+define TMON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(TMON_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		tmon_install
+endef
-- 
2.7.4
