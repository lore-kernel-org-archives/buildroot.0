From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:33:20 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/opencv3: disable
 VFPv3 options
Message-ID: <20200310212109.544A090864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=167b9238ff64f85b88938b35b3f9c53df5581e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit a17402e42d8c996af239cfdb536e74188d6c6245 has conditionally
enabled NEON and VFPv3 optimizations. However, the VFPv3 logic is
causing issues on some targets such as Cortex-A5 with VFPv4-D16 but
not VFPv4.

Since the ENABLE_VFPV3=ON option only adds CFLAGS, we can always set
it to OFF, and let Buildroot pass appropriate CFLAGS.

However, the ENABLE_NEON option also adds the build of NEON-specific
code, so we keep this logic.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11996

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4d0f3dd8709f9f31a81eaa8a62cb35ef6ddddeaf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index a6d795bd85..326edc78b5 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -104,17 +104,15 @@ OPENCV3_CONF_OPTS += \
 
 # Hardware support options.
 #
-# * PowerPC support is turned off since its only effect is altering CFLAGS,
-#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+# * PowerPC and VFPv3 support are turned off since their only effects
+#   are altering CFLAGS, adding '-mcpu=G3 -mtune=G5' or '-mfpu=vfpv3'
+#   to them, which is already handled by Buildroot.
+# * NEON logic is needed as it is not only used to add CFLAGS, but
+#   also to enable additional NEON code.
 OPENCV3_CONF_OPTS += \
 	-DENABLE_POWERPC=OFF \
-	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
-
-ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
-OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
-else
-OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
-endif
+	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
+	-DENABLE_VFPV3=OFF
 
 # Cuda stuff
 OPENCV3_CONF_OPTS += \
