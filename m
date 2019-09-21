From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 21 Sep 2019 18:00:05 +0300
Subject: [Buildroot] [PATCH 1/5] binaries-marvell: bump version and switch
 to common firmware
In-Reply-To: <20190921150009.3267612-1-geomatsi@gmail.com>
References: <20190921150009.3267612-1-geomatsi@gmail.com>
Message-ID: <20190921150009.3267612-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since release 18.12 binaries-marvell repository provides
common firmware supporting both A7K and A8K SoC families.

This commit bumps package version to 18.12 and removes
platform specific binary selections from Config.in.
Single firmware image suitable for both A7K and A8K
platforms is now specified in mk file explicitely.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 boot/binaries-marvell/Config.in             | 22 +--------------------
 boot/binaries-marvell/binaries-marvell.hash |  4 ++--
 boot/binaries-marvell/binaries-marvell.mk   |  6 +++---
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/boot/binaries-marvell/Config.in b/boot/binaries-marvell/Config.in
index 63052070bd..80fbecb270 100644
--- a/boot/binaries-marvell/Config.in
+++ b/boot/binaries-marvell/Config.in
@@ -7,26 +7,6 @@ config BR2_TARGET_BINARIES_MARVELL
 	  reset and system control. ATF Boot Loader stage 2 (BL2) loads
 	  optional SCP_BL2 image into a platform-specific region
 	  of secure memory. This package downloads and installs such
-	  firmwares, which are needed to build ATF.
+	  firmware, which is needed to build ATF.
 
 	  https://github.com/MarvellEmbeddedProcessors/binaries-marvell/
-
-if BR2_TARGET_BINARIES_MARVELL
-
-choice
-	prompt "Marvell Armada platform"
-
-config BR2_TARGET_BINARIES_MARVELL_7040
-	bool "7040"
-
-config BR2_TARGET_BINARIES_MARVELL_8040
-	bool "8040"
-
-endchoice
-
-config BR2_TARGET_BINARIES_MARVELL_IMAGE
-	string
-	default "mrvl_scp_bl2_mss_ap_cp1_a8040.img" if BR2_TARGET_BINARIES_MARVELL_8040
-	default "mrvl_scp_bl2_mss_ap_cp1_a7040.img" if BR2_TARGET_BINARIES_MARVELL_7040
-
-endif
diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
index 0d214502a7..a7d5928a5d 100644
--- a/boot/binaries-marvell/binaries-marvell.hash
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 45c348d7a62fd147e7c6a59211a77876ce5dd26de690bd45ab79c8ff891acedf binaries-marvell-14481806e699dcc6f7025dbe3e46cf26bb787791.tar.gz
-sha256 509a36bb6faa106bbc9730c23038a361ee0c860e53a4cdf9e8605c0174fe45f7	README.md
+sha256 d818c95bcd4d5c026238d6e554151184ed7fea15bce1f861f9068b97b4cd320a binaries-marvell-c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee.tar.gz
+sha256 e6d08ef60068ee72c68835001a24eb832dcba27cac0dde0f179dfb428be050ca README.md
diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
index 6c70148540..49fd8b7704 100644
--- a/boot/binaries-marvell/binaries-marvell.mk
+++ b/boot/binaries-marvell/binaries-marvell.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-# This is version binaries-marvell-armada-18.06
-BINARIES_MARVELL_VERSION = 14481806e699dcc6f7025dbe3e46cf26bb787791
+# This is version binaries-marvell-armada-18.12
+BINARIES_MARVELL_VERSION = c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee
 BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
 
 BINARIES_MARVELL_LICENSE = GPL-2.0 with freertos-exception-2.0
 BINARIES_MARVELL_LICENSE_FILES = README.md
 
-BINARIES_MARVELL_IMAGE = $(call qstrip,$(BR2_TARGET_BINARIES_MARVELL_IMAGE))
+BINARIES_MARVELL_IMAGE = mrvl_scp_bl2.img
 BINARIES_MARVELL_INSTALL_IMAGES  = YES
 
 define BINARIES_MARVELL_INSTALL_IMAGES_CMDS
-- 
2.23.0
