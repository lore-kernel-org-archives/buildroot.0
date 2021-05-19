From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:21:00 +0200
Subject: [Buildroot] [git commit branch/next] boot/at91bootstrap3: add
 BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
Message-ID: <20210519085539.6330388541@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d98b5df418d6ba428205a37f5e4beb95f6f3dc01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some at91bootstrap3 configurations now use Python scripts on the host
for NAND/PMEC related utilities. In order to be able to use those
scripts, this commit adds a new
BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3 which allows to express the
need for host-python3 as a dependency to build at91bootstrap3.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
[Thomas: this was extracted from a patch from Eugen adding
at91bootstrap 4.x support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/Config.in         | 8 ++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 18301a0dc0..966e393db5 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -101,3 +101,11 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
 	  Path to the at91bootstrap3 configuration file
 
 endif # BR2_TARGET_AT91BOOTSTRAP3
+
+config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
+	bool "needs host-python3"
+	help
+	  Enable this option if the at91bootstrap build process needs
+	  Python 3.x to be available on the host. This is needed in
+	  some at91bootstrap configurations to use NAND/PMECC Python
+	  scripts.
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index c4d7bd6106..b253129dfb 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -27,6 +27,10 @@ AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
 
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
+AT91BOOTSTRAP3_DEPENDENCIES += host-python3
+endif
+
 AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
 	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
 
