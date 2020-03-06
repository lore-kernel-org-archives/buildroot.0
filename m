From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  6 Mar 2020 21:34:09 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/qt5webengine: fix compile flags
 for arm
Message-ID: <20200306203410.25008-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
chromium compiler flags and uses some hard coded ARMv7 default values
for the compiler command line: '... -march=armv7-a -mfloat-abi=hard
-mtune=generic-armv7-a -mfpu=vfpv3-d16 ...'.

This results e.g. in an illegal instruction failure for rpi zero
(reported on the mailing list, see [1]).

Disable all arm custom cpu flags (march/mfloat-abi/mtune/mfpu/mthumb) as
these are already set by the compiler wrapper (via a patch to the chromium
GN build system BUILD.gn file).

Despite the patch set all known values in the chromium GN build
system config file chromium/build/config/arm.gni to not disturb
the compile defines settings logic.

Fixes:

  $ /usr/lib/qt/examples/webengine/minimal/minimal
  Illegal instruction

[1] http://lists.busybox.net/pipermail/buildroot/2020-February/274587.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use new introduced BR2_GCC_TARGET_ARCH for arm_arch as the
    previous simple approach did not work (alternative would
    be to extract the arch at runtime via gcc invocation)

Changes v2 -> v3:
  - disable all custom arm cpu flags (suggested by Thomas Petazzoni)

Notes:

  - patches tested on top of the following two patches from
    Nathan Ford

    https://patchwork.ozlabs.org/patch/1246679/
    https://patchwork.ozlabs.org/patch/1246678/

  - to prevent OOM compiled with reduced PARALLEL_JOBS via the following patch:

    --- a/package/qt5/qt5webengine/qt5webengine.mk
    +++ b/package/qt5/qt5webengine/qt5webengine.mk
    @@ -98,7 +98,8 @@ define QT5WEBENGINE_PYTHON2_SYMLINK
     endef
     QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK

    -QT5WEBENGINE_ENV += NINJAFLAGS="-j$(PARALLEL_JOBS)"
    +# limit to 2/3 PARALLEL_JOBS to prevent OOM situation
    +QT5WEBENGINE_ENV += NINJAFLAGS="-j$(shell echo $(PARALLEL_JOBS)*2/3+1 | bc )"

     ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
     define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG

  - to check the compiler inokations enabeld ninja verbose mode via the
    following patch:

    --- a/package/qt5/qt5webengine/qt5webengine.mk
    +++ b/package/qt5/qt5webengine/qt5webengine.mk
    @@ -99,7 +99,7 @@ endef
     QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK

     # limit to 2/3 PARALLEL_JOBS to prevent OOM situation
    -QT5WEBENGINE_ENV += NINJAFLAGS="-j$(shell echo $(PARALLEL_JOBS)*2/3+1 | bc )"
    +QT5WEBENGINE_ENV += NINJAFLAGS="-v -j$(shell echo $(PARALLEL_JOBS)*2/3+1 | bc )"

     ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
     define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
---
 ...n-disable-all-custom-arm-cpu-compile.patch | 79 +++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.mk      | 69 ++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.7/0002-chromium-BUILD.gn-disable-all-custom-arm-cpu-compile.patch

diff --git a/package/qt5/qt5webengine/5.12.7/0002-chromium-BUILD.gn-disable-all-custom-arm-cpu-compile.patch b/package/qt5/qt5webengine/5.12.7/0002-chromium-BUILD.gn-disable-all-custom-arm-cpu-compile.patch
new file mode 100644
index 0000000000..e69ce40696
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.7/0002-chromium-BUILD.gn-disable-all-custom-arm-cpu-compile.patch
@@ -0,0 +1,79 @@
+From 51e83c5619cedecabcce41f9d2a1e0016ea72e00 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 2 Mar 2020 21:29:58 +0100
+Subject: [PATCH] chromium/BUILD.gn: disable all custom arm cpu compiler flags
+
+Disable all custom arm cpu compiler flags as these are already set
+by the buildroot compiler wrapper:
+
+  - march
+  - mfloat-abi
+  - mtune
+  - mfpu
+  - mthumb
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../chromium/build/config/compiler/BUILD.gn   | 23 ++++++++++++-------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/3rdparty/chromium/build/config/compiler/BUILD.gn b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+index d223a4f6f..16dec5c6a 100644
+--- a/src/3rdparty/chromium/build/config/compiler/BUILD.gn
++++ b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+@@ -672,7 +672,8 @@ config("compiler") {
+     # TODO(pcc): The contents of .ARM.attributes should be based on the
+     # -march flag passed at compile time (see llvm.org/pr36291).
+     if (current_cpu == "arm") {
+-      ldflags += [ "-march=$arm_arch" ]
++      # disabled for the buildroot compile
++      # ldflags += [ "-march=$arm_arch" ]
+     }
+   }
+ 
+@@ -752,13 +753,15 @@ config("compiler_cpu_abi") {
+         ldflags += [ "--target=arm-linux-gnueabihf" ]
+       }
+       if (!is_nacl) {
+-        cflags += [
+-          "-march=$arm_arch",
+-          "-mfloat-abi=$arm_float_abi",
+-        ]
++        # disabled for the buildroot compile
++        # cflags += [
++        #   "-march=$arm_arch",
++        #   "-mfloat-abi=$arm_float_abi",
++        # ]
+       }
+       if (arm_tune != "") {
+-        cflags += [ "-mtune=$arm_tune" ]
++        # disabled for the buildroot compile
++        # cflags += [ "-mtune=$arm_tune" ]
+       }
+     } else if (current_cpu == "arm64") {
+       if (is_clang && !is_android && !is_nacl && !is_fuchsia) {
+@@ -1130,7 +1133,9 @@ config("clang_revision") {
+ 
+ config("compiler_arm_fpu") {
+   if (current_cpu == "arm" && !is_ios && !is_nacl) {
+-    cflags = [ "-mfpu=$arm_fpu" ]
++    # disabled for the buildroot compile
++    # cflags = [ "-mfpu=$arm_fpu" ]
++    cflags = []
+     asmflags = cflags
+   }
+ }
+@@ -1138,7 +1143,9 @@ config("compiler_arm_fpu") {
+ config("compiler_arm_thumb") {
+   if (current_cpu == "arm" && arm_use_thumb && is_posix &&
+       !(is_mac || is_ios || is_nacl)) {
+-    cflags = [ "-mthumb" ]
++    # disabled for the buildroot compile
++    # cflags = [ "-mthumb" ]
++    cflags = []
+     if (is_android && !is_clang) {
+       # Clang doesn't support this option.
+       cflags += [ "-mthumb-interwork" ]
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 45d175cfb1..7337b67e9d 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -109,7 +109,76 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
 QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif
 
+# configure arm architecture paramter for chromium compile
+ifeq ($(BR2_arm),y)
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
+define QT5WEBENGINE_CONFIGURE_ARM_VERSION
+	$(SED) 's/^    arm_version = 7$$/    arm_version = 4/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
+define QT5WEBENGINE_CONFIGURE_ARM_VERSION
+	$(SED) 's/^    arm_version = 7$$/    arm_version = 5/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+define QT5WEBENGINE_CONFIGURE_ARM_VERSION
+	$(SED) 's/^    arm_version = 7$$/    arm_version = 6/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+# no entriy for BR2_ARM_CPU_ARMV7A/BR2_ARM_CPU_ARMV7M, arm_vesion = 7 is already set by default
+
+ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+define QT5WEBENGINE_CONFIGURE_ARM_VERSION
+	$(SED) 's/^    arm_version = 7$$/    arm_version = 8/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+# not known by buildroot, set to some dummy to disable all default logic
+define QT5WEBENGINE_CONFIGURE_ARM_ARCH
+	$(SED) 's/^    arm_arch = ""$$/    arm_arch = "arm-dummy-arch"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+
+define QT5WEBENGINE_CONFIGURE_ARM_FPU
+	$(SED) 's/^    arm_fpu = ""$$/    arm_fpu = $(BR2_GCC_TARGET_FPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+
+define QT5WEBENGINE_CONFIGURE_ARM_FLOAT_ABI
+	$(SED) 's/^    arm_float_abi = ""$$/    arm_float_abi = $(BR2_GCC_TARGET_FLOAT_ABI)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+
+define QT5WEBENGINE_CONFIGURE_ARM_TUNE
+	$(SED) 's/^    arm_tune = ""$$/    arm_tune = $(BR2_GCC_TARGET_CPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+define QT5WEBENGINE_CONFIGURE_ARM_NEON
+	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "true"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+else
+define QT5WEBENGINE_CONFIGURE_ARM_NEON
+	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "false"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_THUMB),)
+define QT5WEBENGINE_CONFIGURE_ARM_THUMB
+	$(SED) 's/^    arm_use_thumb = true$$/    arm_use_thumb = false/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+endif
+
 define QT5WEBENGINE_CONFIGURE_CMDS
+	$(QT5WEBENGINE_CONFIGURE_ARM_VERSION)
+	$(QT5WEBENGINE_CONFIGURE_ARM_ARCH)
+	$(QT5WEBENGINE_CONFIGURE_ARM_FPU)
+	$(QT5WEBENGINE_CONFIGURE_ARM_FLOAT_ABI)
+	$(QT5WEBENGINE_CONFIGURE_ARM_TUNE)
+	$(QT5WEBENGINE_CONFIGURE_ARM_NEON)
+	$(QT5WEBENGINE_CONFIGURE_ARM_THUMB)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
-- 
2.25.1
