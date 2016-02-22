From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Date: Mon, 22 Feb 2016 23:31:59 +0100
Subject: [Buildroot] [PATCH v2] msr-tools: new package
In-Reply-To: <20160222222152.GA22228@jazz.nc.intel.com>
References: <20160222222152.GA22228@jazz.nc.intel.com>
Message-ID: <1456180319-23117-1-git-send-email-vincent.stehle@intel.com>
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

---

Changes since v1:
- Add comments in Config.in that msr-tools runs only on x86
- Drop redundant _SOURCE specification in msr-tools.mk

 package/Config.in                |  1 +
 package/msr-tools/Config.in      | 15 +++++++++++++++
 package/msr-tools/msr-tools.hash |  2 ++
 package/msr-tools/msr-tools.mk   | 21 +++++++++++++++++++++
 4 files changed, 39 insertions(+)
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
index 0000000..b348499
--- /dev/null
+++ b/package/msr-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MSR_TOOLS
+	bool "msr-tools"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  The MSR Tools project provides utilities to access x86 processor MSRs
+	  and CPU ID directly.
+
+	  Those tools access the hardware through the /dev/cpu/<cpu#>/msr and
+	  /dev/cpu/<cpu#>/cpuid devices. This necessitates msr and cpuid
+	  support in the kernel.
+
+	  https://01.org/msr-tools
+
+comment "msr-tools runs only on x86 CPUs"
+	depends on !BR2_i386 && !BR2_x86_64
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
index 0000000..f14684f
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
+MSR_TOOLS_LICENSE = GPLv2+
+
+define MSR_TOOLS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) CC="$(CCACHE) $(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define MSR_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) install sbindir="$(TARGET_DIR)/usr/sbin"
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
