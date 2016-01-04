From: Cyril Bur <cyrilbur@gmail.com>
Date: Mon,  4 Jan 2016 11:59:32 +1100
Subject: [Buildroot] [PATCH v2] linux: Build and install kernel selftests
Message-ID: <1451869172-16621-1-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch simply adds the ability to compile and install the kernel
selftests into the target at /usr/lib/kselftests. The rationale behind
/usr/lib is that the selftests have subdirectories where they are installed
which makes them unsuitable to be placed in /usr/sbin as this would result
in /usr/sbin/kselftests/x/y/z. While the selftests aren't libraries either,
they don't achieve much as a standalone binary so they can be considered to
be a 'library of tests' making /usr/lib sensible.

The selftests require that the kernel headers be installed into the kernel
build tree as some of the selftests have a hardcoded CFLAGS to include
kernel headers (CFLAGS += -I../../../../usr/include/). This is most easily
achieved by using the make ... headers_install inside the kernel build dir.

This is likely to be a rarely used debugging/performance feature for
development and unlikely to be used in a production configuration.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
V2: Address review by Yann E. Morin.
   Fixup dependences in the Config.in
   Comment the need to use the kernel headers_install target
   Place tests in /usr/lib/kselftests in target
   Remove installing into staging

---
 linux/Config.tools.in         | 18 ++++++++++++++++++
 linux/linux-tool-selftests.mk | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 linux/linux-tool-selftests.mk

diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 24ef8cd..d975af6 100644
--- a/linux/Config.tools.in
+++ b/linux/Config.tools.in
@@ -26,4 +26,22 @@ config BR2_LINUX_KERNEL_TOOL_PERF
 
 	  https://perf.wiki.kernel.org/
 
+config BR2_LINUX_KERNEL_TOOL_SELFTESTS
+	bool"selftests"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	depends on BR2_USE_MMU  # bash
+	select BR2_PACKAGE_BASH
+	help
+	  Build and install (to /usr/lib/kselftests) kernel selftests.
+
+	  Use of this option implies you know the process using and compiling
+	  the kernel selftests. The Makefile to build and install these is very
+	  noisy and may appear to cause your build to fail for strange reasons.
+
+	  This is very much a use at your risk option and may not work for
+	  every setup or every architecture.
+
+comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
 endmenu
diff --git a/linux/linux-tool-selftests.mk b/linux/linux-tool-selftests.mk
new file mode 100644
index 0000000..b610599
--- /dev/null
+++ b/linux/linux-tool-selftests.mk
@@ -0,0 +1,42 @@
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
+SELFTESTS_MAKE_FLAGS = \
+	$(LINUX_MAKE_FLAGS) \
+	ARCH=$(SELFTESTS_ARCH)
+
+# O must be redefined here to overwrite the one used by Buildroot for
+# out of tree build. We build the selftests in $(@D)/tools/selftests and
+# not just $(@D) so that it isn't built in the root directory of the kernel
+# sources.
+#
+# The headers_install step here is important as some kernel selftests use a
+# hardcoded CFLAGS to find kernel headers e.g:
+# CFLAGS += -I../../../../usr/include/
+# The headers_install target will install the kernel headers locally inside
+# the Linux build dir
+define SELFTESTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(SELFTESTS_MAKE_FLAGS) \
+		headers_install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests
+endef
+
+define SELFTESTS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests \
+		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests install
+endef
-- 
2.6.4
