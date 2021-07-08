From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  8 Jul 2021 14:15:57 -0600
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: add support for bpftool
Message-ID: <20210708201557.3833871-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tool is available to be compiled since kernel 4.15.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-tools/Config.in                | 11 ++++++
 package/linux-tools/linux-tool-bpftool.mk.in | 37 ++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-bpftool.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ceb58c668a..87806bc75e 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -5,6 +5,17 @@ menu "Linux Kernel Tools"
 config BR2_PACKAGE_LINUX_TOOLS
 	bool
 
+config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
+	bool "bpftool"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  bpftool is a tool for for inspection and simple manipulation
+	  of eBPF programs and maps.
+
+	  These tools are available only from kernel version 4.15.
+
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
new file mode 100644
index 0000000000..0c4d3693a3
--- /dev/null
+++ b/package/linux-tools/linux-tool-bpftool.mk.in
@@ -0,0 +1,37 @@
+################################################################################
+#
+# bpftool
+#
+################################################################################
+
+LINUX_TOOLS += bpftool
+
+BPFTOOL_DEPENDENCIES = binutils elfutils
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BPFTOOL_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BPFTOOL_DEPENDENCIES += zlib
+endif
+
+BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define BPFTOOL_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
+		echo "At least kernel 4.15 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
+		$(BPFTOOL_MAKE_OPTS)
+endef
+
+define BPFTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
+		$(BPFTOOL_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
-- 
2.25.1
