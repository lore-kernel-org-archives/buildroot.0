From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:15:29 +0200
Subject: [Buildroot] [git commit branch/next] boot/at91bootstrap3: add
 support for at91bootstrap 4.x series
Message-ID: <20210519085539.4D3D4885B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e009816c67fc1335a9b2da8687b55c5ff6aa27cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The project at https://github.com/linux4sam/at91bootstrap was until
now releasing 3.x versions, which were packaged using
boot/at91bootstrap3/ in Buildroot. Microchip has now started a new
branch of at91bootstrap, called 4.x, which will only support the
following devices: sam9x60, sama5d2, sama5d3, sama5d4, sama7g5. A
number of older devices from Microchip will only be supported by the
existing 3.x series.

Therefore, we cannot simply remove support for the 3.x series, and
allow using only the 4.x series.

So what this commit does is extend the boot/at91bootstrap3 package to
support building both 3.x and 4.x versions. In detail, this implies:

 * Having the BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION symbol point to
   the latest 4.x version. Indeed, we want
   BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION to really point to the
   latest upstream version, even if that means potential breakage for
   users. Users who want to use a fixed version of at91bootstrap
   should anyway not be using
   BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION.

 * Introduce BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X for users who
   would like to use the latest 3.x series.

 * Adjust the installation logic, as images to install are now in
   build/binaries/*.bin instead of binaries/*.bin. In order to not
   have to differentiate 3.x and 4.x, we simply use $(wildcard ...) to
   expand the list of files to install.

 * To make it clear that boot/at91bootstrap3 supports both 3.x and
   4.x, we also update the prompt of the package.

at911bootstrap does not carry a license file; so far we were using
main.c as the license file, as it carries the license blurb. Now that we
have a known alternate version, we would need a per-version hash for
that file. However, this is a bit too cumbersome to handle, so just drop
using main.c as the license file. When upstream introduces a proper
license file, we can revisit the situation.

Update the two defconfigs that were using the upstream 3.9.3 version;
all other defconfigs are using custom tarballs or custom git trees.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
[Thomas: while this patch is based on previous work by Eugen, it was
reworked quite significantly.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - drop main.c as license file, explain why
  - update the two defconfigs
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/Config.in                | 10 +++++++---
 boot/at91bootstrap3/at91bootstrap3.hash      |  2 +-
 boot/at91bootstrap3/at91bootstrap3.mk        |  5 +----
 configs/acmesystems_acqua_a5_256mb_defconfig |  1 +
 configs/acmesystems_acqua_a5_512mb_defconfig |  1 +
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 25ab30489f..ebc912e46c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,5 +1,5 @@
 config BR2_TARGET_AT91BOOTSTRAP3
-	bool "AT91 Bootstrap 3"
+	bool "AT91 Bootstrap 3+"
 	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
@@ -16,9 +16,12 @@ if BR2_TARGET_AT91BOOTSTRAP3
 
 choice
 
-	prompt "AT91 Bootstrap 3 version"
+	prompt "AT91 Bootstrap 3+ version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	bool "4.0.0-rc2"
+
+config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	bool "3.9.3"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
@@ -51,7 +54,8 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 6b6257b0ab..e4d402ee47 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
-sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
+sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index a942afcdc9..c4d7bd6106 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -20,9 +20,6 @@ AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VER
 endif
 
 AT91BOOTSTRAP3_LICENSE = Atmel License
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
-AT91BOOTSTRAP3_LICENSE_FILES = main.c
-endif
 
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
@@ -48,7 +45,7 @@ define AT91BOOTSTRAP3_BUILD_CMDS
 endef
 
 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
-	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
+	cp $(wildcard $(@D)/build/binaries/*.bin $(@D)/binaries/*.bin) $(BINARIES_DIR)
 endef
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 810c3c9782..f62b000654 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 11a7e795e0..9d2f009a5a 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
