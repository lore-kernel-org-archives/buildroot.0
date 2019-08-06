From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 6 Aug 2019 09:35:25 +0200
Subject: [Buildroot] [PATCH] package/qt5tools: enable build of host qdoc
Message-ID: <28738_1565076937_5D492DC9_28738_415_6_1c814794-eadf-4330-8cba-ab0686d724e0@OPEXCNORMAE.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

qdoc was previously built as part of qtbase (in the pre-5.6 era), but
with qt-5.6 it is now part of qttools.

With qt-5.12, it needs libclang to build, so be it...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
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
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
