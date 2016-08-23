From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 19:15:09 +0200
Subject: [Buildroot] [git commit branch/next] package/amd-catalyst: Add
	support AMD CCCLE
Message-ID: <20160823171631.60F1F81F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f196d9cdc7f1e825d012bd1e8a3fe2de7319869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The AMD Catalyst Linux driver includes a graphical controler center for AMD
graphics accelerators, called Catalyst Controler Center. This commits
adds support to install this tool by adding a separated prompt.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
[Thomas:
 - As noticed by Yann, fixed the dependency of the comment related to
   the Qt PNG functionality.
 - Also add the Qt PNG dependency to the BR2_PACKAGE_AMD_CATALYST_CCCLE
   option itself, noticed by Yann.
 - Add an empty line, also noticed by Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/Config.in       | 17 +++++++++++++++++
 package/amd-catalyst/amd-catalyst.mk | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index b10ed3b..55099ac 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -45,6 +45,23 @@ config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
 	help
 	  Build and install the AMD command line tools.
 
+comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
+	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 \
+		|| BR2_PACKAGE_QT_NOPNG
+
+config BR2_PACKAGE_AMD_CATALYST_CCCLE
+	bool "Catalyst Control Center"
+	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT_X11
+	depends on !BR2_PACKAGE_QT_NOPNG
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
+	select BR2_PACKAGE_PROCPS_NG # runtime
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_ACCESSIBILITY
+	help
+	  Installs the Catalyst Control Center, a Qt graphical tool to
+	  control AMD graphics accelerators.
+
 endif
 
 comment "amd-catalyst kernel module needs a kernel to be built"
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 4c1844c..07eb0fa 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -128,6 +128,15 @@ define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
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
@@ -135,6 +144,7 @@ endef
 define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
 	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
+	$(call AMD_CATALYST_INSTALL_CCCLE)
 endef
 
 $(eval $(generic-package))
