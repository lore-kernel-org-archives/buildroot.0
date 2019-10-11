From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:49:07 +0200
Subject: [Buildroot] [git commit] package/qt5tools: enable build of host qdoc
Message-ID: <20191011224542.536B5818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57c1d3be4ecadd6802414a0943185c4ab6d82937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qdoc was previously built as part of qtbase (in the pre-5.6 era), but
with qt-5.6 it is now part of qttools.

With qt-5.12, it needs libclang to build, so be it...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5tools/Config.in   | 10 ++++++++++
 package/qt5/qt5tools/qt5tools.mk | 18 +++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 20f00f6b2f..7e79a679b3 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -17,6 +17,16 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 	  This option enables the linguist host tools
 	  lconvert, lrelease and lupdate.
 
+config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
+	bool "qdoc host tool"
+	depends on !BR2_PACKAGE_QT5_VERSION_LATEST \
+		|| BR2_HOST_GCC_AT_LEAST_4_8 # host-clang
+	help
+	  This option enables the qdoc host tool.
+
+comment "qdoc host tool needs host gcc >= 4.8"
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST && !BR2_HOST_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_QT5TOOLS_PIXELTOOL
 	bool "pixeltool"
 	select BR2_PACKAGE_QT5BASE_GUI
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index a972756d3a..0d00022998 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -29,11 +29,13 @@ endif
 
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
 	linguist/lconvert linguist/lrelease linguist/lupdate
-ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
-# use install target to copy cmake module files
-define QT5TOOLS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist install
-endef
+QT5TOOLS_INSTALL_STAGING_DIR_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
+	linguist
+
+ifeq ($(BR2_PACKAGE_QT5TOOLS_QDOC_TOOL),y)
+QT5TOOLS_BUILD_DIRS_y += qdoc
+QT5TOOLS_INSTALL_STAGING_DIR_y += qdoc
+QT5TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5_VERSION_LATEST),host-clang)
 endif
 
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
@@ -58,6 +60,12 @@ define QT5TOOLS_BUILD_CMDS
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
 endef
 
+# use install target to copy cmake module files
+define QT5TOOLS_INSTALL_STAGING_CMDS
+	$(foreach p,$(QT5TOOLS_INSTALL_STAGING_DIR_y), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p) install$(sep))
+endef
+
 define QT5TOOLS_INSTALL_TARGET_CMDS
 	$(foreach p,$(QT5TOOLS_INSTALL_TARGET_y), \
 		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
