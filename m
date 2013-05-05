From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 May 2013 09:35:08 -0300
Subject: [Buildroot] [PATCHv2] nettle: fix ARM NEON breakage
Message-ID: <1367757308-18176-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nettle's ARM NEON optimizations use some assembly constructs that aren't
friendly with binutils < 2.21, so just disable it for external
toolchains or internal with an unsupported version.
http://autobuild.buildroot.net/results/3c6f91379f90d438b4da3dd330cf89e1dd746aaf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index b3d2730..131826e 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -10,8 +10,8 @@ ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(B
 NETTLE_CONF_OPT += --disable-assembler
 endif
 
-# ARM NEON
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+# ARM NEON, requires binutils 2.21+
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_BINUTILS_VERSION_2_20_1),yy)
 NETTLE_CONF_OPT += --enable-arm-neon
 else
 NETTLE_CONF_OPT += --disable-arm-neon
-- 
1.8.1.5
