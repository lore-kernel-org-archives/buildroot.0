From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Thu, 26 Jul 2018 12:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180726103630.8643-1-david.degrave@mind.be>
References: <20180726103630.8643-1-david.degrave@mind.be>
Message-ID: <20180726103630.8643-2-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot's build system (at least in 2018.01) does not use $(HOST_DIR)/bin/dtc to
compile dts files. Instead it tries to use it's internal dtc who is not
compiled by default and result in a build failure:

  DTC     arch/arm/dts/foo.dtb
/bin/sh: ./scripts/dtc/dtc: No such file or directory
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127

To reproduce this error, use a uboot config that contains the following:

CONFIG_MULTI_DTB_FIT=y
CONFIG_OF_LIST="foo"

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bf227f2893..e877de221e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -141,6 +141,7 @@ UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
+UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
-- 
2.13.6
