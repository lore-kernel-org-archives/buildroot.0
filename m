From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 20:20:55 +0200
Subject: [Buildroot] [git commit] nettle: bump to version 2.7
Message-ID: <20130428182531.BC5B49B869@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1c79ec15e724939d7ef2b2357d1f25de3a940f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nettle/nettle.mk |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

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
