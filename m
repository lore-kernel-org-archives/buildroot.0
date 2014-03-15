From: Uwe Kindler <uwe_kindler@web.de>
Date: Sat, 15 Mar 2014 05:27:52 +0100
Subject: [Buildroot] [PATCH v4] Added support for configuration of boost
	binary names layout
Message-ID: <1394857672-512-1-git-send-email-uwe_kindler@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Uwe Kindler <uwe_kindler@web.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v3 -> v4:
  - moved config BR2_PACKAGE_BOOST_LAYOUT out of choice
  
Changes v2 -> v3:
  - removed inconsistencies in Config.in help texts and fixed typos (suggested by Thomas De Schampheleire)

Changes v1 -> v2:
  -  handle "switch statement" in Config.in file via BR2_PACKAGE_BOOST_LAYOUT (suggested by Arnout Vandecappelle)

---
 package/boost/Config.in |   34 ++++++++++++++++++++++++++++++++++
 package/boost/boost.mk  |    7 ++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 68c3909..57dd5fc 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -16,6 +16,40 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
+choice
+	prompt "Layout"
+	default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+	help
+	  Selects the layout of Boost binary names
+
+config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+	bool "system"
+	help
+	  Boost binary names do not include the Boost version number or the name and 
+	  version number of the compiler.
+
+config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
+	bool "tagged"
+	help
+	  Boost binary names include the encoded build properties such as 
+	  variant and threading, but do not include compiler name and version, or 
+	  Boost version. This option is useful if you build several variants of 
+	  Boost, using the same compiler.
+	  
+config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
+	bool "versioned"
+	help
+	  Boost binary names include the Boost version number, name and 
+	  version of the compiler and encoded build properties.
+	  
+endchoice
+
+config BR2_PACKAGE_BOOST_LAYOUT
+	string
+	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
+	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7aab614..2ae8034 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -81,6 +81,7 @@ endif
 
 BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
+BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
@@ -99,7 +100,7 @@ define BOOST_INSTALL_TARGET_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
-	--layout=system install )
+	--layout=$(BOOST_LAYOUT) install )
 endef
 
 define HOST_BOOST_BUILD_CMDS
@@ -114,7 +115,7 @@ define HOST_BOOST_INSTALL_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPT) \
 	--prefix=$(HOST_DIR)/usr \
-	--layout=system install )
+	--layout=$(BOOST_LAYOUT) install )
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
@@ -122,7 +123,7 @@ define BOOST_INSTALL_STAGING_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(STAGING_DIR)/usr \
-	--layout=system install)
+	--layout=$(BOOST_LAYOUT) install)
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
