From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:40:59 +0100
Subject: [Buildroot] [git commit] package/amd-catalyst: remove control
 center option
Message-ID: <20190206145216.CB556800AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef8427927568410693aa2f0ed611e0e771efad58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The control center option uses the obsolete qt4 package, which we are about
to remove, so remote the cccle option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                     |  6 ++++++
 package/amd-catalyst/Config.in       | 16 ----------------
 package/amd-catalyst/amd-catalyst.mk | 10 ----------
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0eb69361cc..dbd7450741 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_AMD_CATALYST_CCCLE
+	bool "catalyst control center option removed"
+	select BR2_LEGACY
+	help
+	  The AMD Catalyst Control Center option was removed.
+
 config BR2_PACKAGE_SDL_QTOPIA
 	bool "sdl qtopia video driver option removed"
 	select BR2_LEGACY
diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 85551ed803..1a5bf02953 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -45,22 +45,6 @@ config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
 	help
 	  Build and install the AMD command line tools.
 
-comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
-	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 \
-		|| BR2_PACKAGE_QT_NOPNG
-
-config BR2_PACKAGE_AMD_CATALYST_CCCLE
-	bool "Catalyst Control Center"
-	depends on BR2_PACKAGE_QT
-	depends on BR2_PACKAGE_QT_X11
-	depends on !BR2_PACKAGE_QT_NOPNG
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
-	select BR2_PACKAGE_PROCPS_NG # runtime
-	select BR2_PACKAGE_QT_ACCESSIBILITY
-	help
-	  Installs the Catalyst Control Center, a Qt graphical tool to
-	  control AMD graphics accelerators.
-
 endif
 
 comment "amd-catalyst kernel module needs a kernel to be built"
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index d864095c31..fe8aa850f0 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -149,15 +149,6 @@ define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_AMD_CATALYST_CCCLE), y)
-define AMD_CATALYST_INSTALL_CCCLE
-	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/bin/amdcccle \
-		$(TARGET_DIR)/usr/bin/amdcccle
-	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/sbin/amdnotifyui \
-		$(TARGET_DIR)/usr/sbin/amdnotifyui
-endef
-endif
-
 define AMD_CATALYST_INSTALL_STAGING_CMDS
 	$(call AMD_CATALYST_INSTALL_STAGING_XORG)
 endef
@@ -165,7 +156,6 @@ endef
 define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
 	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
-	$(call AMD_CATALYST_INSTALL_CCCLE)
 	$(call AMD_CATALYST_INSTALL_OPENCL)
 endef
 
