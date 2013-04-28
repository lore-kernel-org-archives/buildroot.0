From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Apr 2013 09:31:24 -0300
Subject: [Buildroot] [PATCH] nettle: bump to version 2.7
Message-ID: <1367152284-26830-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 5080fab..b3d2730 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -1,10 +1,22 @@
-NETTLE_VERSION = 2.6
+NETTLE_VERSION = 2.7
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = LGPLv2.1+
 NETTLE_LICENSE_FILES = COPYING.LIB
 
+# ARM assembly requires v6+ ISA
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
+NETTLE_CONF_OPT += --disable-assembler
+endif
+
+# ARM NEON
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+NETTLE_CONF_OPT += --enable-arm-neon
+else
+NETTLE_CONF_OPT += --disable-arm-neon
+endif
+
 define NETTLE_DITCH_DEBUGGING_CFLAGS
 	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
 endef
-- 
1.8.1.5
