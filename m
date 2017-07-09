From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:21:55 -0700
Subject: [Buildroot] [PATCH v2 1/7] arch/xtensa: get rid of an intermediate
	blind kconfig option
In-Reply-To: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1499602921-25097-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It is not needed to have an intermediate blind option, we can just
hide the prompt behind the same dependency as the non-blind symbol.

Update our qemu-xtensa defconfig acordingly (note: it was using
different values for both options, which is not possible; the blind
option was just set to the non-blind one in the .config).

Also remove an unneeded empty default for the BR2_XTENSA_OVERLAY_DIR
string option (strings are empty by default).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 Config.in.legacy                         | 11 +++++++++++
 arch/Config.in.xtensa                    | 16 ++++++----------
 configs/qemu_xtensa_lx60_defconfig       |  3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig |  3 +--
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 12362da6f2ca..f05b63eb1c54 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -336,6 +336,17 @@ config BR2_GCC_VERSION_4_8_X
 	  Support for gcc version 4.8.x has been removed. The current
 	  default version (5.x or later) has been selected instead.
 
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
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 88dbe18feeee..00b1f6853c94 100644
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
+
 endchoice
 
-config BR2_XTENSA_CUSTOM_NAME
-	string "Custom Xtensa processor configuration name"
-	depends on BR2_XTENSA_CUSTOM
-	default ""
+config BR2_XTENSA_CORE_NAME
+	string "Custom Xtensa processor configuration name" if BR2_XTENSA_CUSTOM
+	default BR2_XTENSA_CUSTOM_NAME if BR2_XTENSA_CUSTOM_NAME != "" # legacy
 	help
 	  Name given to a custom Xtensa processor configuration.
 
-config BR2_XTENSA_CORE_NAME
-	string
-	default BR2_XTENSA_CUSTOM_NAME	if BR2_XTENSA_CUSTOM
-	default ""			if BR2_xtensa_fsf
-
 config BR2_XTENSA_OVERLAY_DIR
 	string "Overlay directory for custom configuration"
 	depends on BR2_XTENSA_CUSTOM
-	default ""
 	help
 	  Provide the directory path that contains the overlay file
 	  for a custom processor configuration. The path is relative
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 3e98222b6555..ec0c1bac51be 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CUSTOM_NAME="dc233c"
-BR2_XTENSA_CORE_NAME="lx60"
+BR2_XTENSA_CORE_NAME="dc233c"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
 # System
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 998cd2aa6bf3..d19bc5431b39 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CUSTOM_NAME="dc233c"
-BR2_XTENSA_CORE_NAME="lx60"
+BR2_XTENSA_CORE_NAME="dc233c"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
 # Toolchain
-- 
2.1.4
