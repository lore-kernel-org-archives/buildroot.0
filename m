From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Thu, 18 Apr 2019 18:53:31 +0530
Subject: [Buildroot] [PATCH 2/2] boot/uboot: Add python pyelftools library
 as uboot dependency
In-Reply-To: <20190418132331.14213-1-shyam.saini@amarulasolutions.com>
References: <20190418132331.14213-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190418132331.14213-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rockchip rk3399 SOC based boards require python pyelftools library for
parsing dtb files, so lets add it as uboot dependency.

This commit introduces new a variable BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
to achieve this.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d4a93615ee..33b7e67ff7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -151,6 +151,14 @@ config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
 	  Select this option if your U-Boot board configuration
 	  requires the Python libfdt library to be available.
 
+config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
+	bool "U-Boot needs pyelftools"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires the Python pyelftools library to be available.
+	  This is used by some rockchip SOCs for elf parsing.
+	  For example: rk3399 soc boards.
+
 config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	bool "U-Boot needs OpenSSL"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3c070b41b3..ae09c37d84 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -152,6 +152,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
 UBOOT_DEPENDENCIES += host-python host-swig
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
+UBOOT_DEPENDENCIES += host-python-pyelftools
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
 UBOOT_DEPENDENCIES += host-openssl
 endif
-- 
2.11.0
