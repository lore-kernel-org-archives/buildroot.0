From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Aug 2019 20:40:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: disable NEON and VFPv3
 options
Message-ID: <20190820184039.28611-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a17402e42d8c996af239cfdb536e74188d6c6245 has conditionally
enabled NEON and VFPv3 optimizations. However these options are passing
-mfpu=neon or -mfpu=vfpv3 to the compiler which raise issues on some
targets such as Cortex-A5 with VFPv4-D16 enabled but without NEON and
VFPv4.

So disable these options as buildroot is already passing -mfpu

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11996

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 91efa5c912..d3e795aae1 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -109,17 +109,13 @@ OPENCV3_CONF_OPTS += \
 
 # Hardware support options.
 #
-# * PowerPC support is turned off since its only effect is altering CFLAGS,
-#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+# * PowerPC, NEON and VFPv3 support are turned off since their only effects are
+#   altering CFLAGS, adding '-mcpu=G3 -mtune=G5', '-mfpu=neon' or '-mfpu=vfpv3'
+#   to them, which is already handled by Buildroot.
 OPENCV3_CONF_OPTS += \
 	-DENABLE_POWERPC=OFF \
-	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
-
-ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
-OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
-else
-OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
-endif
+	-DENABLE_NEON=OFF \
+	-DENABLE_VFPV3=OFF
 
 # Cuda stuff
 OPENCV3_CONF_OPTS += \
-- 
2.20.1
