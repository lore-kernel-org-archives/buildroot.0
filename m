From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:20 +0100
Subject: [Buildroot] [PATCH 07/11 v5] package/freerdp: move
	architecture-specific block
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <2e9d60ec1d82bf03d818f67f396634f210078fa6.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the arch-spcific block up, so it does not interfere with followup
patches (mostly to ease review).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/freerdp/freerdp.mk | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0dbf8a4..cf96ff4 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -48,6 +48,22 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+FREERDP_CONF_OPTS += -DWITH_NEON=ON
+else
+FREERDP_CONF_OPTS += -DWITH_NEON=OFF
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+FREERDP_CONF_OPTS += -DWITH_SSE2=ON
+else
+FREERDP_CONF_OPTS += -DWITH_SSE2=OFF
+endif
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
 FREERDP_DEPENDENCIES += xlib_libXext
 FREERDP_CONF_OPTS += -DWITH_X11=ON
@@ -97,20 +113,4 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-FREERDP_CONF_OPTS += -DWITH_NEON=ON
-else
-FREERDP_CONF_OPTS += -DWITH_NEON=OFF
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-FREERDP_CONF_OPTS += -DWITH_SSE2=ON
-else
-FREERDP_CONF_OPTS += -DWITH_SSE2=OFF
-endif
-
-ifeq ($(BR2_arm)$(BR2_armeb),y)
-FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-endif
-
 $(eval $(cmake-package))
-- 
1.9.1
