From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Apr 2021 10:42:07 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: fix build with FIT
Message-ID: <20210425082211.271567FCFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8eef7d2e62aba92fbab3906862c6422410c8677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with FIT is broken since bump to version 2021.04 in commit
a4c38ae470e6c472f0e0cdfbfb8e2e76f1e8047c

Fake a generated/autoconf.h with just the needed stuff as suggested by
Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20210422210559.707845-1-fontaine.fabrice at gmail.com

It seems that an empty file is enough as make options are still
interpreted

As a side-effect, drop third patch

Fixes:
 - http://autobuild.buildroot.org/results/5771a7413c98ec202c9623672787a1eee74da5e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-drop-autoconf.h-from-tools.patch          | 36 ----------------------
 package/uboot-tools/uboot-tools.mk                 |  4 +++
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/uboot-tools/0003-drop-autoconf.h-from-tools.patch b/package/uboot-tools/0003-drop-autoconf.h-from-tools.patch
deleted file mode 100644
index 09ee40bec0..0000000000
--- a/package/uboot-tools/0003-drop-autoconf.h-from-tools.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0552a8ffdfbb9807fcef4498011907caa5de2ace Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 9 Jan 2020 15:11:32 +0100
-Subject: [PATCH] drop autoconf.h from tools
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We need to build u-boot tools without a board configuration for the target.
-
-imximage uses the DCD address from Kconfig to display this information
-to the user. The default value for all i.MX platforms is 0x00910000,
-except for i.MX7ULP, which has a DCD address of 0x2f010000.
-
-The default value printed before version 2020.01 was 0x00910000.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- tools/imximage.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tools/imximage.c b/tools/imximage.c
-index d7edd3c52f..f8d21fa06a 100644
---- a/tools/imximage.c
-+++ b/tools/imximage.c
-@@ -11,7 +11,6 @@
- #include "imagetool.h"
- #include <image.h>
- #include "imximage.h"
--#include <generated/autoconf.h>
- 
- #define UNDEFINED 0xFFFFFFFF
- 
--- 
-2.25.0
-
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 179e39f9c0..8963d6182e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -20,6 +20,8 @@ HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
+	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 endef
 
 UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -94,6 +96,8 @@ endef
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
+	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 endef
 
 HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
