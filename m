From: Simon Rowe <simon.rowe@citrix.com>
Date: Fri, 6 Dec 2019 13:31:11 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: add support for
 Hyper-V tools
Message-ID: <1575639071-32764-1-git-send-email-simon.rowe@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for selection and compiling the Hyper-V tools on buildroot.

These tools are available to be compiled since kernel 3.15 but only had
an install target since 4.16.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/linux-tools/Config.in           |  8 ++++++++
 package/linux-tools/linux-tool-hv.mk.in | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-hv.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ab8cc38..947ef05 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -25,6 +25,14 @@ config BR2_PACKAGE_LINUX_TOOLS_GPIO
 
 	  These tools are available only from kernel version 4.8.
 
+config BR2_PACKAGE_LINUX_TOOLS_HV
+	bool "hv"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  hv is a collection of tools to interact with Hyper-V.
+
+	  These tools are available only from kernel version 4.16.
+
 config BR2_PACKAGE_LINUX_TOOLS_IIO
 	bool "iio"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
new file mode 100644
index 0000000..803eb7e
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -0,0 +1,29 @@
+################################################################################
+#
+# hv
+#
+################################################################################
+
+LINUX_TOOLS += hv
+
+HV_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define HV_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/hv/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the hv tools." ; \
+		echo "At least kernel 4.16 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_MAKE_OPTS)
+endef
+
+# DESTDIR used since kernel version 4.14
+define HV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
-- 
1.8.3.1
