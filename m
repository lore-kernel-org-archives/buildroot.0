From: Markus Mayer <code@mmayer.net>
Date: Tue,  4 Jul 2017 16:54:45 -0700
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add tmon
In-Reply-To: <20170704235445.35255-1-code@mmayer.net>
References: <20170704235445.35255-1-code@mmayer.net>
Message-ID: <20170704235445.35255-3-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

Add the tmon package to linux-tools.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/linux-tools/Config.in          |  7 +++++++
 package/linux-tools/linux-tool-tmon.mk | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-tmon.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index db9ed9f19..0fa468a4f 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -83,4 +83,11 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
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
diff --git a/package/linux-tools/linux-tool-tmon.mk b/package/linux-tools/linux-tool-tmon.mk
new file mode 100644
index 000000000..1330ea67b
--- /dev/null
+++ b/package/linux-tools/linux-tool-tmon.mk
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
2.13.0
