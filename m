From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 16:57:53 +0100
Subject: [Buildroot] [PATCH 3/4] gpu-amd-bin-mx51: install examples
In-Reply-To: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415375874-17331-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-amd-bin-mx51/Config.in           | 5 +++++
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
index 86038b8..cabf84d 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/Config.in
+++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
@@ -51,4 +51,9 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "gpu-amd-bin-mx51"
 
+config BR2_PACKAGE_GPU_AMD_BIN_MX51_EXAMPLES
+	bool "install examples"
+	help
+	  Copy the examples to the target.
+
 endif
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index b4f0da4..c4ff917 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -55,8 +55,16 @@ define GPU_AMD_BIN_MX51_INSTALL_STAGING_CMDS
 	$(GPU_AMD_BIN_MX51_FIXUP_EGL_HEADERS)
 endef
 
+ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_EXAMPLES),y)
+define GPU_AMD_BIN_MX51_INSTALL_EXAMPLES
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/examples/gpu_amd_samples
+	$(INSTALL) -m 755 $(@D)/usr/bin/* $(TARGET_DIR)/usr/share/examples/gpu_amd_samples
+endef
+endif
+
 define GPU_AMD_BIN_MX51_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 $(@D)/usr/lib/lib*so* $(TARGET_DIR)/usr/lib/
+	$(GPU_AMD_BIN_MX51_INSTALL_EXAMPLES)
 endef
 
 define GPU_AMD_BIN_MX51_DEVICES
-- 
1.9.1
