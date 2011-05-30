From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:23:17 +0200
Subject: [Buildroot] [PATCH 26/26] u-boot: allow specification of custom Git
	repo as source
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d656c5d7c123c351ed32ff011fee9c5791c48ac2.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |   14 ++++++++++++++
 boot/u-boot/u-boot.mk |    3 +++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 658a539..dde92d3 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -34,6 +34,9 @@ config BR2_BOOT_U_BOOT_2010_03
 config BR2_BOOT_U_BOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
+config BR2_BOOT_U_BOOT_CUSTOM_GIT
+        bool "Custom Git repository"
+
 endchoice
 
 if BR2_BOOT_U_BOOT_CUSTOM_TARBALL
@@ -43,6 +46,16 @@ config BR2_BOOT_U_BOOT_CUSTOM_TARBALL_LOCATION
 
 endif
 
+if BR2_BOOT_U_BOOT_CUSTOM_GIT
+
+config BR2_BOOT_U_BOOT_CUSTOM_GIT_REPO_URL
+        string "URL of custom Git repository"
+
+config BR2_BOOT_U_BOOT_CUSTOM_GIT_VERSION
+        string "Custom Git version"
+
+endif
+
 config BR2_BOOT_U_BOOT_VERSION
 	string
 	default "2011.03"	if BR2_BOOT_U_BOOT_2011_03
@@ -51,6 +64,7 @@ config BR2_BOOT_U_BOOT_VERSION
 	default "2010.06"	if BR2_BOOT_U_BOOT_2010_06
 	default "2010.03"	if BR2_BOOT_U_BOOT_2010_03
 	default "custom"	if BR2_BOOT_U_BOOT_CUSTOM_TARBALL
+	default $BR2_BOOT_U_BOOT_CUSTOM_GIT_VERSION if BR2_BOOT_U_BOOT_CUSTOM_GIT
 
 config BR2_BOOT_U_BOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 97d7921..6334fad 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -13,6 +13,9 @@ ifeq ($(U_BOOT_VERSION),custom)
 U_BOOT_TARBALL = $(call qstrip,$(BR2_BOOT_U_BOOT_CUSTOM_TARBALL_LOCATION))
 U_BOOT_SITE    = $(dir $(U_BOOT_TARBALL))
 U_BOOT_SOURCE  = $(notdir $(U_BOOT_TARBALL))
+else ifeq ($(BR2_BOOT_U_BOOT_CUSTOM_GIT),y)
+U_BOOT_SITE        = $(call qstrip,$(BR2_BOOT_U_BOOT_CUSTOM_GIT_REPO_URL))
+U_BOOT_SITE_METHOD = git
 else
 # Handle stable official U-Boot versions
 U_BOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-- 
1.7.1
