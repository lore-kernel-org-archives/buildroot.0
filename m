From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Jul 2018 18:08:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/opencv3: fix aarch64 build
In-Reply-To: <20180730160836.21016-1-bernd.kuhls@t-online.de>
References: <20180730160836.21016-1-bernd.kuhls@t-online.de>
Message-ID: <20180730160836.21016-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/opencv3?id=a17402e42d8c996af239cfdb536e74188d6c6245

enabled CMake option ENABLE_VFPV3 in OpenCV3 for all aarch64 CPUs
because for them BR2_ARM_CPU_HAS_VFPV3 is always true:

BR2_ARM_CPU_HAS_FP_ARMV8 selects BR2_ARM_CPU_HAS_VFPV4 which in turn
selects BR2_ARM_CPU_HAS_VFPV3.

OpenCV3 however supports vfpv3 only on !aarch64:
https://github.com/opencv/opencv/blob/3.4/cmake/OpenCVCompilerOptimizations.cmake#L275

Fixes
http://autobuild.buildroot.net/results/d38/d38fb092cffe086f93b469d1181da77fba0994bd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencv3/opencv3.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 2fb49e3fb2..09455d61b2 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -100,8 +100,13 @@ OPENCV3_CONF_OPTS += \
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
 OPENCV3_CONF_OPTS += \
 	-DENABLE_POWERPC=OFF \
-	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
-	-DENABLE_VFPV3=$(if $(BR2_ARM_CPU_HAS_VFPV3),ON,OFF)
+	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
+
+ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
+OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
+else
+OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
+endif
 
 # Cuda stuff
 OPENCV3_CONF_OPTS += \
-- 
2.18.0
