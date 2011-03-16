From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 16 Mar 2011 17:10:28 +0100
Subject: [Buildroot] [PATCH 2/2] Barebox add version selection support
In-Reply-To: <1300291828-7952-1-git-send-email-plagnioj@jcrosoft.com>
References: <1300291828-7952-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1300291828-7952-2-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 boot/barebox/Config.in  |   26 +++++++++++++++++++++++++-
 boot/barebox/barebox.mk |   27 +++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index eb7c2f9..679b1a2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -13,6 +13,20 @@ config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	  the _defconfig suffix.
 
 choice
+	prompt "Barebox Download"
+	default BR2_TARGET_BAREBOX_TARBALL
+	help
+	  Select the download method you want to use
+
+config BR2_TARGET_BAREBOX_TARBALL
+	bool "tar"
+
+config BR2_TARGET_BAREBOX_GIT
+	bool "git"
+
+endchoice
+
+choice
 	prompt "Barebox Version"
 	default BR2_TARGET_BAREBOX_2011.01
 	help
@@ -35,7 +49,12 @@ endchoice
 if BR2_TARGET_BAREBOX_CUSTOM
 
 config BR2_TARGET_BAREBOX_CUSTOM_LOCATION
-	string "URL of custom Barbox tarball"
+	string "URL of custom Barbox tarball or git"
+
+if BR2_TARGET_BAREBOX_GIT
+config BR2_TARGET_BAREBOX_CUSTOM_COMMIT
+	string "URL of custom Barbox commit"
+endif
 
 endif
 
@@ -46,6 +65,11 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2011.03.0"	if BR2_TARGET_BAREBOX_2011_03
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM
 
+config BR2_TARGET_BAREBOX_DOWNLOAD
+	string
+	default "tar"	if BR2_TARGET_BAREBOX_TARBALL
+	default "git"	if BR2_TARGET_BAREBOX_GIT
+
 config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 116cc72..5994142 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -5,7 +5,33 @@
 #############################################################
 
 BAREBOX_VERSION:=$(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
-
+BAREBOX_DOWNLOAD:=$(call qstrip,$(BR2_TARGET_BAREBOX_DOWNLOAD))
+# force Package as BAREBOX
+# needed by DOWNLOAD_GIT
+PKG=BAREBOX
+
+ifeq ($(BAREBOX_DOWNLOAD),git)
+BAREBOX_SITE_METHOD:=git
+DL_TOOLS_DEPENDENCIES += git
+ifeq ($(BAREBOX_VERSION),custom)
+BAREBOX_SITE:=$(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_LOCATION))
+BAREBOX_VERSION=$(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_COMMIT))
+# Handle custom Barebox git as specified by the configuration
+else
+BAREBOX_SITE:=http://git.pengutronix.de/git/barebox.git
+BAREBOX_VERSION:=v$(BAREBOX_VERSION)
+endif
+ifneq ($(BAREBOX_VERSION),)
+BAREBOX_BASE_NAME:=barebox-git-$(BAREBOX_VERSION)
+BAREBOX_DL_VERSION:=$(BAREBOX_VERSION)
+else
+BAREBOX_BASE_NAME:=barebox-git
+BAREBOX_DL_VERSION:=HEAD
+endif
+BAREBOX_SOURCE:=$(BAREBOX_BASE_NAME).tar.gz
+BAREBOX_CAT:=$(ZCAT)
+BAREBOX_DL_DIR=$(DL_DIR)/$(BAREBOX_BASE_NAME)
+else
 ifeq ($(BAREBOX_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
 BAREBOX_TARBALL=$(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_LOCATION))
@@ -17,6 +43,7 @@ BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
 endif
 BAREBOX_CAT:=$(BZCAT)
+endif
 
 ifneq ($(BAREBOX_VERSION),)
 BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-- 
1.7.4.1
