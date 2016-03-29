From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:15:14 +0200
Subject: [Buildroot] [git commit] uclibc: gcc >= 4.9 can build a
	thumb/thread uclibc
Message-ID: <20160329222011.ABE50807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d7f014517ef7c71b180f5d726d06517d6658c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older gcc were not capable of building a uClibc library, with threads
enabled, in Thumb1. However, the issues have been fixed since gcc 4.9,
so this commit narrows down the condition to just gcc 4.7 and 4.8.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c981d80..ad94494 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -75,8 +75,10 @@ define UCLIBC_ARM_ABI_CONFIG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
 endef
 
-# Thumb build is broken with threads, build in ARM mode
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+# Thumb1 build is broken with threads with old gcc versions (4.7 and
+# 4.8). Since all cores supporting Thumb1 also support ARM, we use ARM
+# code in this case.
+ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),y:yy)
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
