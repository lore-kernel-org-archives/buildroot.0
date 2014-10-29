From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 29 Oct 2014 10:18:41 +0100
Subject: [Buildroot] [PATCH v2] unzip: Use the "-q" option to silence
	unzipping of source files
Message-ID: <1414574321-16399-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add and use the "UNZIP" variable instead of calling directly unzip
because the variable contains the "-q" option to silence "unzip" so it
doesn't show the list of files extracted just like when tar files are
being unpacked.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---

Notes:
    v2:
     - remove the "-d" option from the "UNZIP" variable (Arnout)

 boot/at91bootstrap/at91bootstrap.mk            | 2 +-
 package/Makefile.in                            | 1 +
 package/espeak/espeak.mk                       | 2 +-
 package/explorercanvas/explorercanvas.mk       | 2 +-
 package/gtest/gtest.mk                         | 2 +-
 package/jquery-mobile/jquery-mobile.mk         | 2 +-
 package/jquery-ui-themes/jquery-ui-themes.mk   | 2 +-
 package/jquery-ui/jquery-ui.mk                 | 2 +-
 package/jquery-validation/jquery-validation.mk | 2 +-
 package/libjson/libjson.mk                     | 2 +-
 package/opentyrian-data/opentyrian-data.mk     | 2 +-
 package/python-keyring/python-keyring.mk       | 2 +-
 package/rapidjson/rapidjson.mk                 | 2 +-
 package/sam-ba/sam-ba.mk                       | 2 +-
 package/urg/urg.mk                             | 2 +-
 package/zxing/zxing.mk                         | 2 +-
 16 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index e3f9dc0..50bbc26 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -17,7 +17,7 @@ AT91BOOTSTRAP_INSTALL_IMAGES = YES
 AT91BOOTSTRAP_INSTALL_TARGET = NO
 
 define AT91BOOTSTRAP_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
 	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
 endef
diff --git a/package/Makefile.in b/package/Makefile.in
index ff2ee2d..df39afd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -221,6 +221,7 @@ INSTALL := $(shell which install || type -p install)
 FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 SED := $(shell which sed || type -p sed) -i -e
+UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 9a83d4f..bb9a247 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -21,7 +21,7 @@ ESPEAK_DEPENDENCIES = pulseaudio
 endif
 
 define ESPEAK_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
 	mv $(@D)/espeak-$(ESPEAK_VERSION)-source/* $(@D)
 	$(RM) -r $(@D)/espeak-$(ESPEAK_VERSION)-source
 endef
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index e45621b..083d9a3 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -11,7 +11,7 @@ EXPLORERCANVAS_LICENSE = Apache-2.0
 EXPLORERCANVAS_LICENSE_FILES = COPYING
 
 define EXPLORERCANVAS_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
 endef
 
 define EXPLORERCANVAS_INSTALL_TARGET_CMDS
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 6a95350..3f3e889 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -22,7 +22,7 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
 define GTEST_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
+	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
 endef
 
 define GTEST_INSTALL_STAGING_CMDS
diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
index 3a634ed..1067952 100644
--- a/package/jquery-mobile/jquery-mobile.mk
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -10,7 +10,7 @@ JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
 JQUERY_MOBILE_LICENSE = MIT
 
 define JQUERY_MOBILE_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
 endef
 
 JQUERY_MOBILE_INSTALLED_FILES = \
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index 269ef69..cd3dab6 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -12,7 +12,7 @@ JQUERY_UI_THEMES_LICENSE_FILES = MIT-LICENSE.txt
 JQUERY_UI_THEMES_DEPENDENCIES = jquery-ui
 
 define JQUERY_UI_THEMES_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
 	mv $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)/* $(@D)
 	$(RM) -r $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)
 endef
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index d40158b..e4d3370 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -14,7 +14,7 @@ JQUERY_UI_LICENSE = MIT
 JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt
 
 define JQUERY_UI_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
 	mv $(@D)/jquery-ui-$(JQUERY_UI_VERSION)/* $(@D)
 	$(RM) -r $(@D)/jquery-ui-$(JQUERY_UI_VERSION)
 endef
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index ca8cbdc..b496b0a 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -11,7 +11,7 @@ JQUERY_VALIDATION_LICENSE = MIT
 JQUERY_VALIDATION_LICENSE_FILES = README.md
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
 endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index cfb839d..17a1e9a 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -23,7 +23,7 @@ endif
 LIBJSON_MAKE_OPTS += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
 
 define LIBJSON_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
 	mv $(@D)/libjson/* $(@D)
 	$(RM) -r $(@D)/libjson
 	$(SED) '/ldconfig/d' $(@D)/makefile
diff --git a/package/opentyrian-data/opentyrian-data.mk b/package/opentyrian-data/opentyrian-data.mk
index aa3bd69..4b879df 100644
--- a/package/opentyrian-data/opentyrian-data.mk
+++ b/package/opentyrian-data/opentyrian-data.mk
@@ -10,7 +10,7 @@ OPENTYRIAN_DATA_SOURCE = tyrian21.zip
 OPENTYRIAN_DATA_LICENSE = Freeware
 
 define OPENTYRIAN_DATA_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(OPENTYRIAN_DATA_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(OPENTYRIAN_DATA_SOURCE)
 endef
 
 define OPENTYRIAN_DATA_INSTALL_TARGET_CMDS
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index a2e0af8..ef8b8af 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -11,7 +11,7 @@ PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = python software foundation license
 
 define PYTHON_KEYRING_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(PYTHON_KEYRING_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(PYTHON_KEYRING_SOURCE)
 	mv $(@D)/keyring-$(PYTHON_KEYRING_VERSION)/* $(@D)
 	$(RM) -r $(@D)/keyring-$(PYTHON_KEYRING_VERSION)
 endef
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 5e5d8f6..68e010e 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -13,7 +13,7 @@ RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
 define RAPIDJSON_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(RAPIDJSON_SOURCE)
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDJSON_SOURCE)
 	mv $(@D)/rapidjson/* $(@D)
 	$(RM) -r $(@D)/rapidjson
 endef
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 905a6cb..f46cbce 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -12,7 +12,7 @@ SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
 define HOST_SAM_BA_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
 	mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
 	rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
 endef
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 2db96d5..f831f74 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -25,7 +25,7 @@ URG_CONFIG_SCRIPTS = c_urg-config urg-config
 
 define URG_EXTRACT_CMDS
 	$(RM) -rf $(URG_DIR)
-	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(URG_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR)/ $(DL_DIR)/$(URG_SOURCE)
 	test -d $(URG_DIR) || \
 		mv $(BUILD_DIR)/$(subst .zip,,$(URG_SOURCE)) $(URG_DIR)
 endef
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 234f780..94e8b1f 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -22,7 +22,7 @@ endif
 endif
 
 define ZXING_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
 endef
 
 define ZXING_BUILD_CMDS
-- 
2.1.1
