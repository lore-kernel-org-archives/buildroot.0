From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 25 Nov 2015 10:53:42 +1100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
Message-ID: <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch simply adds the ability to compile and install the kernel
selftests into the target.

This is likely to be a rarely used debugging/performance feature for
development and unlikely to be used in a production configuration.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 linux/Config.tools.in         | 12 ++++++++++++
 linux/linux-tool-selftests.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 linux/linux-tool-selftests.mk

diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 24ef8cd..68655dc 100644
--- a/linux/Config.tools.in
+++ b/linux/Config.tools.in
@@ -26,4 +26,16 @@ config BR2_LINUX_KERNEL_TOOL_PERF
 
 	  https://perf.wiki.kernel.org/
 
+config BR2_LINUX_KERNEL_TOOL_SELFTESTS
+	bool "selftests"
+	help
+	  Build and install (to /usr/lib/selftests) kernel selftests.
+
+	  Use of this option implies you know the process using and compiling
+	  the kernel selftests. The Makefile to build and install these is very
+	  noisy and may appear to cause your build to fail for strange reasons.
+
+	  This is very much a use at your risk option and may not work for
+	  every setup or every architecture.
+
 endmenu
diff --git a/linux/linux-tool-selftests.mk b/linux/linux-tool-selftests.mk
new file mode 100644
index 0000000..573ba0c
--- /dev/null
+++ b/linux/linux-tool-selftests.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# selftests
+#
+################################################################################
+
+LINUX_TOOLS += selftests
+
+ifeq ($(KERNEL_ARCH),x86_64)
+SELFTESTS_ARCH=x86
+else
+SELFTESTS_ARCH=$(KERNEL_ARCH)
+endif
+
+SELFTESTS_DEPENDENCIES = bash
+
+SELFTESTS_INSTALL_STAGING = YES
+SELFTESTS_MAKE_FLAGS = \
+	$(LINUX_MAKE_FLAGS) \
+	ARCH=$(SELFTESTS_ARCH)
+
+# O must be redefined here to overwrite the one used by Buildroot for
+# out of tree build. We build the selftests in $(@D)/tools/selftests and
+# not just $(@D) so that it isn't built in the root directory of the kernel
+# sources.
+define SELFTESTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) headers_install
+	$(TARGET_MAKE_ENV) $(MAKE1) $(SELFTESTS_MAKE_FLAGS) \
+		-C $(@D)/tools/testing/selftests O=$(@D)/tools/testing/selftests
+endef
+
+define SELFTESTS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) INSTALL_PATH=$(STAGING_DIR)/usr/lib/selftests $(SELFTESTS_MAKE_FLAGS) \
+		-C $(@D)/tools/testing/selftests install
+endef
+
+define SELFTESTS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) INSTALL_PATH=$(TARGET_DIR)/usr/lib/selftests $(SELFTESTS_MAKE_FLAGS) \
+		-C $(@D)/tools/testing/selftests install
+endef
-- 
2.6.2
