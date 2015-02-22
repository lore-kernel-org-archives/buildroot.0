From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 11:31:08 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: move
	architecture-specific block
Message-ID: <20150222111227.2580B803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d081d51bf97f3ec303b039b779cee5aabb90f0ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Move the arch-spcific block up, so it does not interfere with followup
patches (mostly to ease review).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |   32 ++++++++++++++++----------------
 1 files changed, 16 insertions(+), 16 deletions(-)

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
