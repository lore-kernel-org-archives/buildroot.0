From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 18:55:05 +0100
Subject: [Buildroot] [PATCH v2,1/1] gnuchess: needs -fPIC
Message-ID: <20190112175505.14348-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with -O2 (or -O3) on ARM cortex-M cpus, link fails on:

/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/arm-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -Wl,-elf2flt -static  -Wl,-elf2flt -static   -Wl,-elf2flt -static -o gnuchess main.o components.o  frontend/libfrontend.a adapter/libadapter.a engine/libengine.a -lreadline -lncurses
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context

To fix this, pas -fPIC unconditionnally

Fixes:
 - http://autobuild.buildroot.org/results/7918757b255ed41609609d2083c2d8904ff3136e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Use -fPIC instead of replacing -O2/O3 by -Os

 package/gnuchess/gnuchess.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 4d91706de4..1bbbeb4b1b 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -13,4 +13,8 @@ GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+GNUCHESS_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"
+
 $(eval $(autotools-package))
-- 
2.14.1
