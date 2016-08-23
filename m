From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 23 Aug 2016 14:19:48 +0200
Subject: [Buildroot] [PATCH v5 5/7] package/amd-catalyst: Add AMD cmdline
	tools
In-Reply-To: <20160823121950.16826-1-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
Message-ID: <20160823121950.16826-6-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AMD Catalyst driver includes some cmdline tools for displaying
specific infos about the GL stack or to test 3D, like fglxinfo
or fgl_gears. This commit adds support to install such tools.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---

Changes in v5:
 - Added Reviewed-by Tag

 package/amd-catalyst/Config.in       |  5 +++++
 package/amd-catalyst/amd-catalyst.mk | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 1578324..1d889f6 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -40,6 +40,11 @@ if BR2_PACKAGE_AMD_CATALYST_XORG
 config BR2_PACKAGE_PROVIDES_LIBGL
 	default "amd-catalyst"
 
+config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
+	bool "command-line configuration tools and utilities"
+	help
+	  Build the amd command line tools
+
 endif
 
 comment "amd-catalyst kernel module needs a kernel to be built"
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 812135d..7fbe6b3 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -107,6 +107,25 @@ endef
 
 endif
 
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS), y)
+AMD_CATALYST_CMDLINE_TOOLS_FILES = \
+	atiode \
+	atiodcli \
+	fgl_glxgears \
+	aticonfig \
+	amd-console-helper \
+	fglrxinfo
+
+define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
+	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/sbin/atieventsd \
+		$(TARGET_DIR)/usr/sbin
+	$(foreach f,$(AMD_CATALYST_CMDLINE_TOOLS_FILES), \
+		$(INSTALL) -D -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/bin/$(f) \
+			$(TARGET_DIR)/usr/bin/$(f)
+	)
+endef
+endif
+
 define AMD_CATALYST_CONFIGURE_CMDS
 	$(call AMD_CATALYST_PREPARE_MODULE)
 endef
@@ -117,6 +136,7 @@ endef
 
 define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
+	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
