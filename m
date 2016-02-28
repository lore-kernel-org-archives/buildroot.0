From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:31:04 +0100
Subject: [Buildroot] [git commit] msr-tools: new package
Message-ID: <20160302202758.C5DA17FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e738967d93b190e5d1c2c46af0b9c27e6bd7ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MSR Tools project provides utilities to access x86 processor MSRs
and CPU ID directly.

https://01.org/msr-tools

Signed-off-by: Vincent Stehl?? <vincent.stehle@intel.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Thomas:
 - rewrap Config.in help text
 - use $(TARGET_MAKE_ENV) when calling $(MAKE).]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/msr-tools/Config.in      | 14 ++++++++++++++
 package/msr-tools/msr-tools.hash |  2 ++
 package/msr-tools/msr-tools.mk   | 21 +++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 67a2514..03876be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -407,6 +407,7 @@ endif
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/minicom/Config.in"
+	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
diff --git a/package/msr-tools/Config.in b/package/msr-tools/Config.in
new file mode 100644
index 0000000..dde19f7
--- /dev/null
+++ b/package/msr-tools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MSR_TOOLS
+	bool "msr-tools"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The MSR Tools project provides utilities to access x86
+	  processor MSRs and CPU ID directly.
+
+	  Those tools access the hardware through the
+	  /dev/cpu/<cpu#>/msr and /dev/cpu/<cpu#>/cpuid devices. This
+	  necessitates msr and cpuid support in the kernel, which
+	  means you need a kernel compiled with configuration options
+	  CONFIG_X86_CPUID and CONFIG_X86_MSR enabled.
+
+	  https://01.org/msr-tools
diff --git a/package/msr-tools/msr-tools.hash b/package/msr-tools/msr-tools.hash
new file mode 100644
index 0000000..18146df
--- /dev/null
+++ b/package/msr-tools/msr-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 9b87245ee091a798184e447066e9e0d7709b7c81f5e6ad55f2b958c1aa50c4a3 msr-tools-1.3.tar.gz
diff --git a/package/msr-tools/msr-tools.mk b/package/msr-tools/msr-tools.mk
new file mode 100644
index 0000000..4f84a28
--- /dev/null
+++ b/package/msr-tools/msr-tools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# msr-tools
+#
+################################################################################
+
+MSR_TOOLS_VERSION = 1.3
+MSR_TOOLS_SITE = $(call github,01org,msr-tools,msr-tools-$(MSR_TOOLS_VERSION))
+MSR_TOOLS_LICENSE = GPLv2
+MSR_TOOLS_LICENSE_FILES = cpuid.c
+
+define MSR_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define MSR_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+		sbindir="$(TARGET_DIR)/usr/sbin"
+endef
+
+$(eval $(generic-package))
