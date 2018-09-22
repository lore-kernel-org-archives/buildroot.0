From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 23 Sep 2018 02:53:31 +0300
Subject: [Buildroot] [PATCH 3/5] webkitgtk: enable package for aarch64
In-Reply-To: <20180922235333.85642-1-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
Message-ID: <20180922235333.85642-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

64-bit ARM is well supported, particularly in little-endian
configurations, where JIT can be enabled as well.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 96a7ab0c94..ac6f57e2ad 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f28417ac73..f0293fc225 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,9 +27,10 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF
 
-# ARM needs NEON for JIT
+# 32-bit ARM needs NEON for JIT, AArch64 is supported but not well tested
+# on big endian hence the missing $(BR2_aarch64_be).
 # i386 & x86_64 don't seem to have any special requirements
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64)$(BR2_aarch64),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
-- 
2.19.0
