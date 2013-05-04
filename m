From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 May 2013 09:22:27 -0300
Subject: [Buildroot] [PATCH] nettle: fix ARM NEON build breakage
Message-ID: <1367670147-3436-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nettle's ARM NEON optimizations use some assembly constructs that aren't
friendly with binutils < 2.21 and since we can't know for sure which
binutils version we've got when using an external toolchain just disable
NEON optimizations for now. Fixes:
http://autobuild.buildroot.net/results/3c6f91379f90d438b4da3dd330cf89e1dd746aaf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index b3d2730..9405ff7 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,19 +4,14 @@ NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = LGPLv2.1+
 NETTLE_LICENSE_FILES = COPYING.LIB
+# NEON support breaks with binutils < 2.21
+NETTLE_CONF_OPT = --disable-arm-neon
 
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
 NETTLE_CONF_OPT += --disable-assembler
 endif
 
-# ARM NEON
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-NETTLE_CONF_OPT += --enable-arm-neon
-else
-NETTLE_CONF_OPT += --disable-arm-neon
-endif
-
 define NETTLE_DITCH_DEBUGGING_CFLAGS
 	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
 endef
-- 
1.8.1.5
