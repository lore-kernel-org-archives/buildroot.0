From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:05:38 +0200
Subject: [Buildroot] [git commit] package/opencv3: fix aarch64 build
Message-ID: <20180731200215.2CD1F8A852@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=141cf77903764efad4238abd4cd1391260c0210d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a17402e42d8c996af239cfdb536e74188d6c6245 ("opencv3:
conditionally enable NEON and VFPv3 optimizations") broke the build on
AArch64, because the VFPv3 optimizations are not supported by OpenCV
on this architecture:

  https://github.com/opencv/opencv/blob/3.4/cmake/OpenCVCompilerOptimizations.cmake#L275

However BR2_ARM_CPU_HAS_VFPV3 is always true on AArch64, causing this
build failure for every AArch64 build of OpenCV 3. This commit fixes
that by enabling VFPV3 only on ARM, and not on AArch64.

Fixes:

  http://autobuild.buildroot.net/results/d38fb092cffe086f93b469d1181da77fba0994bd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 53b771ef25..e8afa7cccf 100644
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
