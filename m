From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 18:09:45 +0200
Subject: [Buildroot] [git commit branch/next] package/amd-catalyst: Add
	command line tools
Message-ID: <20160823171631.5405281F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0c3cfc2dace594a831d84a5ca05ae96cf81260b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The AMD Catalyst driver includes some command line tools for displaying
specific infos about the GL stack or to test 3D, like fglxinfo or
fgl_gears. This commit adds support to install such tools.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/Config.in       |  5 +++++
 package/amd-catalyst/amd-catalyst.mk | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 1578324..b10ed3b 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -40,6 +40,11 @@ if BR2_PACKAGE_AMD_CATALYST_XORG
 config BR2_PACKAGE_PROVIDES_LIBGL
 	default "amd-catalyst"
 
+config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
+	bool "command-line configuration tools"
+	help
+	  Build and install the AMD command line tools.
+
 endif
 
 comment "amd-catalyst kernel module needs a kernel to be built"
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index aca7781..4c1844c 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -109,12 +109,32 @@ endef
 
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
 define AMD_CATALYST_INSTALL_STAGING_CMDS
 	$(call AMD_CATALYST_INSTALL_STAGING_XORG)
 endef
 
 define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
+	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
 endef
 
 $(eval $(generic-package))
