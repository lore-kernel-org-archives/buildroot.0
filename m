From: Romain Perier <romain.perier@free-electrons.com>
Date: Fri,  5 Aug 2016 16:53:59 +0200
Subject: [Buildroot] [PATCH v4 6/7] package/amd-catalyst: Add support AMD
	CCCLE
In-Reply-To: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
References: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1470408840-1509-7-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AMD Catalyst Linux driver includes a graphical controler center for AMD
graphics accelerators, called Catalyst Controler Center. This commits
adds support to install this tool by adding a separated prompt.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---
 package/amd-catalyst/Config.in       | 13 +++++++++++++
 package/amd-catalyst/amd-catalyst.mk | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 0099e91..99676d3 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -43,6 +43,19 @@ config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
 	help
 	  Build the amd command line tools
 
+comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
+	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 || BR2_PACKAGE_QT_NOPNG
+
+config BR2_PACKAGE_AMD_CATALYST_CCCLE
+	bool "Catalyst Control Center"
+	depends on BR2_USE_MMU && BR2_PACKAGE_QT && BR2_PACKAGE_QT_X11
+	select BR2_PACKAGE_PROCPS_NG # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_ACCESSIBILITY
+	help
+	  Installs the Catalyst Control Center, a Qt graphical tool to
+	  control AMD graphics accelerators.
 endif
 
 config BR2_PACKAGE_AMD_CATALYST_MODULE
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 5e1b90b..ee3c2d6 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -122,6 +122,15 @@ define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_CCCLE), y)
+define AMD_CATALYST_INSTALL_CCCLE
+	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/bin/amdcccle \
+		$(TARGET_DIR)/usr/bin/amdcccle
+	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/sbin/amdnotifyui \
+		$(TARGET_DIR)/usr/sbin/amdnotifyui
+endef
+endif
+
 define AMD_CATALYST_INSTALL_STAGING_CMDS
 	$(call AMD_CATALYST_INSTALL_STAGING_XORG)
 endef
@@ -129,6 +138,7 @@ endef
 define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
 	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
+	$(call AMD_CATALYST_INSTALL_CCCLE)
 endef
 
 $(eval $(generic-package))
-- 
2.8.1
