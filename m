From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:17 +0100
Subject: [Buildroot] [PATCH 47/51] arc/xtensa: get rid of an intermediate
	blind kconfig option
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <ca0bd8d831179771a1c3f02768128f8c237d36f3.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not needed to have an intermediate blind option, we can just
hide the prompt behind the same dependency as the non-blind symbol.

Update our qemu-xtensa defconfig acordingly (note: it was using
different values for both options, which is not possible; the blind
option was just set to the non-blind one in the .config).

Also remove an unneeded empty default for the BR2_XTENSA_OVERLAY_DIR
string option (strings are empty by default).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Chris Zankel <chris@zankel.net>
---
 Config.in.legacy                   | 14 ++++++++++++++
 arch/Config.in.xtensa              | 18 +++++++-----------
 configs/qemu_xtensa_lx60_defconfig |  3 +--
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c5b8223..b892f38 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -105,6 +105,20 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2016.02"
+
+config BR2_XTENSA_CUSTOM_NAME
+	string "The BR2_XTENSA_CUSTOM_NAME option has been renamed"
+	help
+	  The BR2_XTENSA_CUSTOM_NAME option has been renamed
+	  to BR2_XTENSA_CORE_NAME.
+
+config BR2_XTENSA_CUSTOM_NAME_WRAP
+	bool
+	default y if BR2_XTENSA_CUSTOM_NAME != ""
+	select BR2_LEGACY
+
+###############################################################################
 comment "Legacy options removed in 2015.11"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index a0e18f1..c1c4fa1 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -2,30 +2,26 @@ choice
 	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
 	default BR2_xtensa_fsf
+
 config BR2_XTENSA_CUSTOM
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	bool "Custom Xtensa processor configuration"
+
 config BR2_xtensa_fsf
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	bool "fsf - Default configuration"
-endchoice
 
-config BR2_XTENSA_CUSTOM_NAME
-	string "Custom Xtensa processor configuration name"
-	depends on BR2_XTENSA_CUSTOM
-	default ""
-	help
-	  Name given to a custom Xtensa processor configuration.
+endchoice
 
 config BR2_XTENSA_CORE_NAME
-	string
-	default BR2_XTENSA_CUSTOM_NAME	if BR2_XTENSA_CUSTOM
-	default ""			if BR2_xtensa_fsf
+	string "Custom Xtensa processor configuration name" if BR2_XTENSA_CUSTOM
+	default BR2_XTENSA_CUSTOM_NAME if BR2_XTENSA_CUSTOM_NAME != "" # legacy
+	help
+	  Name given to a custom Xtensa processor configuration.
 
 config BR2_XTENSA_OVERLAY_DIR
 	string "Overlay directory for custom configuration"
 	depends on BR2_XTENSA_CUSTOM
-	default ""
 	help
 	  Provide the directory path that contains the overlay file
 	  for a custom processor configuration. The path is relative
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 42b844c..8326381 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CUSTOM_NAME="dc232b"
-BR2_XTENSA_CORE_NAME="lx60"
+BR2_XTENSA_CORE_NAME="dc232b"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
 # Patches
-- 
1.9.1
