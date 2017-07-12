From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 12 Jul 2017 21:29:03 +0200
Subject: [Buildroot] [PATCH] uboot: bump to version 2017.07
Message-ID: <20170712192903.20486-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new config option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT for U-Boot
targets, like sunxi, needing the Python libfdt library.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/Config.in  | 12 ++++++++++--
 boot/uboot/uboot.hash |  2 +-
 boot/uboot/uboot.mk   |  4 ++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 52f3a326c6..ec77791fad 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2017.05"
+	bool "2017.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2017.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2017.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -138,6 +138,14 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	bool "U-Boot needs pylibfdt"
+	select BR2_PACKAGE_HOST_PYTHON
+	select BR2_PACKAGE_HOST_SWIG
+	help
+	  Select this option if your U-Boot board configuration
+	  requires the Python libfdt library to be available.
+
 config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	bool "U-Boot needs OpenSSL"
 	help
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index e11d92ff15..3ba8e34ba0 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c8373949d7f0de1059e507b83a655d4cea539f75dc66ccdbb27adbd38d83095e  u-boot-2017.05.tar.bz2
+sha256  5374bfdc8acb9a38c025371b1ff20f45e7533668e84e685d0df5d9e7c0e4feff  u-boot-2017.07.tar.bz2
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 73d72630b2..14a8cc949a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -138,6 +138,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
+UBOOT_DEPENDENCIES += host-python host-swig
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
 UBOOT_DEPENDENCIES += host-openssl
 endif
-- 
2.13.2
