From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  5 Nov 2017 11:49:58 +0100
Subject: [Buildroot] [PATCH 1/1] mesa3d: fix build with
 BR2_SHARED_STATIC_LIBS
Message-ID: <20171105104958.28634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d does not allow to enable both static and shared libraries so if
BR2_SHARED_STATIC_LIBS is set, disable static

Fixes https://bugs.busybox.net/show_bug.cgi?id=10326

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9305523bd..5627344f0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -26,6 +26,12 @@ MESA3D_DEPENDENCIES = \
 # Disable assembly usage.
 MESA3D_CONF_OPTS = --disable-asm
 
+# Disable static, otherwise configure will fail with: "Cannot enable both static
+# and shared."
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MESA3D_CONF_OPTS += --disable-static
+endif
+
 # The Sourcery MIPS toolchain has a special (non-upstream) feature to
 # have "compact exception handling", which unfortunately breaks with
 # mesa3d, so we disable it here by passing -mno-compact-eh.
-- 
2.14.1
