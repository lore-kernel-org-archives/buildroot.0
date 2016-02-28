From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Date: Sun, 28 Feb 2016 22:12:58 +0100
Subject: [Buildroot] [PATCH v3] msr-tools: new package
In-Reply-To: <56CBA62E.1040200@mind.be>
References: <56CBA62E.1040200@mind.be>
Message-ID: <1456693978-12086-1-git-send-email-vincent.stehle@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The MSR Tools project provides utilities to access x86 processor MSRs
and CPU ID directly.

https://01.org/msr-tools

Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---


Hi Arnout,

Thank you for your review.

All the items you pointed out should be addressed now. Do not hesitate to let
me know if you spot anything else.

Best regards,

Vincent.

Changes in v3:
- Drop comments in Config.in that msr-tools runs only on x86 after all
- Mention the necessary kernel options explicitly in Config.in help.
- Change license to GPLv2 as per cpuid.c
- Change makefile commands to be more in line with common usage.

Changes in v2:
- Add comments in Config.in that msr-tools runs only on x86
- Drop redundant _SOURCE specification in msr-tools.mk


 package/Config.in                |  1 +
 package/msr-tools/Config.in      | 13 +++++++++++++
 package/msr-tools/msr-tools.hash |  2 ++
 package/msr-tools/msr-tools.mk   | 21 +++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/msr-tools/Config.in
 create mode 100644 package/msr-tools/msr-tools.hash
 create mode 100644 package/msr-tools/msr-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..f468b46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ endif
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/minicom/Config.in"
+	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
diff --git a/package/msr-tools/Config.in b/package/msr-tools/Config.in
new file mode 100644
index 0000000..50ae505
--- /dev/null
+++ b/package/msr-tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MSR_TOOLS
+	bool "msr-tools"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The MSR Tools project provides utilities to access x86 processor MSRs
+	  and CPU ID directly.
+
+	  Those tools access the hardware through the /dev/cpu/<cpu#>/msr and
+	  /dev/cpu/<cpu#>/cpuid devices. This necessitates msr and cpuid
+	  support in the kernel, which means you need a kernel compiled with
+	  configuration options CONFIG_X86_CPUID and CONFIG_X86_MSR enabled.
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
index 0000000..a5fc8a8
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
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define MSR_TOOLS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+		sbindir="$(TARGET_DIR)/usr/sbin"
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
