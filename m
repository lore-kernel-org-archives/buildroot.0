From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:13:37 +0200
Subject: [Buildroot] [git commit] package/sam-ba: bump to version 3.3.1
Message-ID: <20200805131517.205FA82A14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b26a62236f015ee723206c6a6da431799e8866da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sam-ba tool moved to github, changed license to GPLv2 and dropped x86
support.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sam-ba/Config.in.host |  2 +-
 package/sam-ba/sam-ba.hash    |  6 ++----
 package/sam-ba/sam-ba.mk      | 26 ++++++--------------------
 3 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 6093865e4c..2236b5f48a 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Atmel SAM-BA software provides an open set of tools for
diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index ae1fb5eece..1bc14f3fd7 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,5 +1,3 @@
 # sha256 locally computed
-sha256  40d5e66b77261d83780fe2b38633b8d9f5c9a26718c2b9de1d5877e853e35e96  sam-ba_cdc_linux.zip
-sha256  f9cac240acadbfd8f4f1c0d65132f85427384697bd6337da6444c531138d56ee  doc/license.txt
-sha256  255564ff8953ea95c11a4ab1d56f1edf332298faad209ca80daf745c7ed95124  tcl_lib/boards.tcl
-sha256  74ae62858139cb4e18acc3448483be80ea6b36fdb87260b665f43762ca354ede  applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
+sha256  dc32c49688bbfab5aa687042caae5f611fe3d9e722098a561f8f5d2fbc57249d  sam-ba_3.3.1-linux_x86_64.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 49505589d0..3082d49192 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,36 +4,22 @@
 #
 ################################################################################
 
-SAM_BA_SITE = http://ww1.microchip.com/downloads/en/DeviceDoc
-SAM_BA_VERSION = 2.18
-SAM_BA_SOURCE = sam-ba_cdc_linux.zip
-SAM_BA_LICENSE = SAM-BA license (sam-ba executable), \
-		BSD-2-Clause like, BSD-4-Clause (TCL and applets code)
-SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
-		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
-
-define HOST_SAM_BA_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(HOST_SAM_BA_DL_DIR)/$(SAM_BA_SOURCE)
-	mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
-	rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
-endef
+SAM_BA_VERSION = 3.3.1
+SAM_BA_SITE = https://github.com/atmelcorp/sam-ba/releases/download/v$(SAM_BA_VERSION)
+SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
+SAM_BA_LICENSE = GPLv2
+SAM_BA_LICENSE_FILES = LICENSE.txt
 
 # Since it's a prebuilt application and it does not conform to the
 # usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
 # then create a symbolic link from $(HOST_DIR)/bin to the
 # application binary, for easier usage.
 
-ifeq ($(HOSTARCH),x86_64)
-SAM_BA_BIN_NAME = sam-ba_64
-else
-SAM_BA_BIN_NAME = sam-ba
-endif
-
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
 	mkdir -p $(HOST_DIR)/bin/
-	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba
+	ln -sf ../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
