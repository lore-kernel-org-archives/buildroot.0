From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:40:13 +0100
Subject: [Buildroot] [git commit branch/next] mesa3d: fix build with
 BR2_SHARED_STATIC_LIBS
Message-ID: <20171113221622.C1FDC807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd09d500aa6972808b2549e4b8c7fa4e396ca91f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mesa3d does not allow to enable both static and shared libraries so if
BR2_SHARED_STATIC_LIBS is set, disable static

Fixes https://bugs.busybox.net/show_bug.cgi?id=10326

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9305523..5627344 100644
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
