From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 May 2019 00:17:12 +0200
Subject: [Buildroot] [PATCH 3/3] package/intel-microcode: make target
 installation optional
In-Reply-To: <20190520221712.22564-1-peter@korsgaard.com>
References: <20190520221712.22564-1-peter@korsgaard.com>
Message-ID: <20190520221712.22564-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For early microcode loading, there is no need to install the individual
microcode files to /lib/firmware - So make that optional.

Let the option default to y for backwards compatibility, and select it from
iucode-tool as the init script relies on the /lib/firmware files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/Config.in          | 9 +++++++++
 package/intel-microcode/intel-microcode.mk | 4 ++++
 package/iucode-tool/Config.in              | 1 +
 3 files changed, 14 insertions(+)

diff --git a/package/intel-microcode/Config.in b/package/intel-microcode/Config.in
index 3f9199ec93..4a45aa1ef3 100644
--- a/package/intel-microcode/Config.in
+++ b/package/intel-microcode/Config.in
@@ -7,3 +7,12 @@ config BR2_PACKAGE_INTEL_MICROCODE
 	  proper kernel support are required to upload the microcode.
 
 	  https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files
+
+config BR2_PACKAGE_INTEL_MICROCODE_INSTALL_TARGET
+	bool "install microcode files to /lib/firmware in target"
+	default y
+	depends on BR2_PACKAGE_INTEL_MICROCODE
+	help
+	  Select this option to have the microcode files installed to
+	  /lib/firmware/intel-ucode in the target root filesystem, in
+	  addition to the images directory.
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 43cdc3d0b8..dacb619a14 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -17,10 +17,14 @@ define INTEL_MICROCODE_INSTALL_IMAGES_CMDS
 		$(@D)/intel-ucode/*
 endef
 
+ifeq ($(BR2_PACKAGE_INTEL_MICROCODE_INSTALL_TARGET),y)
 define INTEL_MICROCODE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/intel-ucode
 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
 		$(@D)/intel-ucode/*
 endef
+else
+INTEL_MICROCODE_INSTALL_TARGET = NO
+endif
 
 $(eval $(generic-package))
diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index d81dabb196..f9f2521a42 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IUCODE_TOOL
 	bool "iucode-tool"
 	depends on BR2_x86_64 || BR2_i386
 	select BR2_PACKAGE_INTEL_MICROCODE
+	select BR2_PACKAGE_INTEL_MICROCODE_INSTALL_TARGET
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
-- 
2.11.0
