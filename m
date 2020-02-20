From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Feb 2020 23:49:38 +0100
Subject: [Buildroot] [RFC v1] WIP: package/qt5webengine: fix compile flags
 for rpi zero
Message-ID: <20200220224938.13945-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
chromium compiler flags resulting in wrong defaults for the rpi
zero case (resulting in illegal instruction failure), e.g.:
	-march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16

Add patch to overwrite the chromium settings with suitable values
for the rpi zero case in the file rc/3rdparty/chromium/build/config/arm.gni.

Fixes:

  $ /usr/lib/qt/examples/webengine/minimal/minimal
  Illegal instruction

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - Work-In-Progress patch to test the prinziple of chromium configuration
    for the rpi zero case, do not apply. A real fix should set the
    values in arm.gni determined from the buildroot configuration.
---
 .../0002-force-rpi-zero-compile-flags.patch   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.7/0002-force-rpi-zero-compile-flags.patch

diff --git a/package/qt5/qt5webengine/5.12.7/0002-force-rpi-zero-compile-flags.patch b/package/qt5/qt5webengine/5.12.7/0002-force-rpi-zero-compile-flags.patch
new file mode 100644
index 0000000000..fd74376f11
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.7/0002-force-rpi-zero-compile-flags.patch
@@ -0,0 +1,60 @@
+From b1fb963cfc5c164663e78d948eb8482d0ab80edb Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 20 Feb 2020 20:16:53 +0100
+Subject: [PATCH] force rpi zero compile flags
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/chromium/build/config/arm.gni | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/3rdparty/chromium/build/config/arm.gni b/src/3rdparty/chromium/build/config/arm.gni
+index abd4dd02f..8c0f4c979 100644
+--- a/src/3rdparty/chromium/build/config/arm.gni
++++ b/src/3rdparty/chromium/build/config/arm.gni
+@@ -13,35 +13,35 @@ if (current_cpu == "arm" || v8_current_cpu == "arm") {
+   declare_args() {
+     # Version of the ARM processor when compiling on ARM. Ignored on non-ARM
+     # platforms.
+-    arm_version = 7
++    arm_version = 6
+ 
+     # The ARM architecture. This will be a string like "armv6" or "armv7-a".
+     # An empty string means to use the default for the arm_version.
+-    arm_arch = ""
++    arm_arch = "armv6kz+fp"
+ 
+     # The ARM floating point hardware. This will be a string like "neon" or
+     # "vfpv3". An empty string means to use the default for the arm_version.
+-    arm_fpu = ""
++    arm_fpu = "vfp"
+ 
+     # The ARM floating point mode. This is either the string "hard", "soft", or
+     # "softfp". An empty string means to use the default one for the
+     # arm_version.
+-    arm_float_abi = ""
++    arm_float_abi = "hard"
+ 
+     # The ARM variant-specific tuning mode. This will be a string like "armv6"
+     # or "cortex-a15". An empty string means to use the default for the
+     # arm_version.
+-    arm_tune = ""
++    arm_tune = "arm1176jzf-s"
+ 
+     # Whether to use the neon FPU instruction set or not.
+-    arm_use_neon = ""
++    arm_use_neon = "false"
+ 
+     # Whether to enable optional NEON code paths.
+     arm_optionally_use_neon = false
+ 
+     # Thumb is a reduced instruction set available on some ARM processors that
+     # has increased code density.
+-    arm_use_thumb = true
++    arm_use_thumb = false
+   }
+ 
+   assert(arm_float_abi == "" || arm_float_abi == "hard" ||
+-- 
+2.25.0
+
-- 
2.25.0
