From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:32:04 +0200
Subject: [Buildroot] [git commit] package/linux-tools: add support for
	building tmon
Message-ID: <20170719192957.3619F7FDA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1779ef23cd78b928d1d93f830bb00ac28143cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[Thomas:
 - tweak Config.in help text as provided by Markus
 - adjust commit log
 - add missing select BR2_PACKAGE_NCURSES
 - add missing dependency on host-pkgconf, used by the tmon Makefile
   to find ncurses
 - add logic to disable -fstack-protector when the toolchain doesn't
   have SSP support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/Config.in             |  8 +++++++
 package/linux-tools/linux-tool-tmon.mk.in | 37 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 9d5bf7a..e3ccd85 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -77,4 +77,12 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
+config BR2_PACKAGE_LINUX_TOOLS_TMON
+	bool "tmon"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_NCURSES
+	help
+	  tmon is a terminal-based tool (using curses) that allows the
+	  user to access thermal information about the system.
+
 endmenu
diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
new file mode 100644
index 0000000..15931c3
--- /dev/null
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -0,0 +1,37 @@
+################################################################################
+#
+# tmon
+#
+################################################################################
+
+LINUX_TOOLS += tmon
+
+TMON_DEPENDENCIES = host-pkgconf ncurses
+TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	CC=$(TARGET_CC) \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+define TMON_DISABLE_STACK_PROTECTOR
+	$(SED) 's%-fstack-protector%%' $(LINUX_DIR)/tools/thermal/tmon/Makefile
+endef
+endif
+
+define TMON_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have the tmon tool." ; \
+		echo "At least kernel 3.13 must be used." ; \
+		exit 1 ; \
+	fi
+	$(TMON_DISABLE_STACK_PROTECTOR)
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
