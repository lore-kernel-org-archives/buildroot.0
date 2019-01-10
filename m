From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jan 2019 18:59:54 +0100
Subject: [Buildroot] [PATCH 2/3] gnuchess: disable -O2 and -O3 for ARM
 cortex-M cpus
In-Reply-To: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
References: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
Message-ID: <20190110175955.31565-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with -O2 (or -O3), link fails on:

/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/arm-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -Wl,-elf2flt -static  -Wl,-elf2flt -static   -Wl,-elf2flt -static -o gnuchess main.o components.o  frontend/libfrontend.a adapter/libadapter.a engine/libengine.a -lreadline -lncurses
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context

To fix this, replace -O2 or -O3 by -Os

Fixes:
 - http://autobuild.buildroot.org/results/7918757b255ed41609609d2083c2d8904ff3136e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuchess/gnuchess.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 0abdab5ba5..b2fbcff864 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -13,4 +13,11 @@ GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+# Workaround a build issue with -O2 or -03 for ARM Cortex-M cpus
+ifeq ($(BR2_ARM_CPU_ARMV7M):$(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_3),y:y)
+GNUCHESS_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) -Os" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -Os"
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
