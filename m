From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Mar 2020 10:19:26 +0100
Subject: [Buildroot] [RFC v2 2/2] package/qt5webengine: fix chromium arm
 compile flags
In-Reply-To: <20200302091926.19308-1-ps.report@gmx.net>
References: <20200302091926.19308-1-ps.report@gmx.net>
Message-ID: <20200302091926.19308-2-ps.report@gmx.net>
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

Custom values could be set in the file src/3rdparty/chromium/build/config/arm.gni
(as tested by an proof-of-concept patch [2]).

[1] http://lists.busybox.net/pipermail/buildroot/2020-February/274587.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-February/274586.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use new introduced BR2_GCC_TARGET_ARCH for arm_arch as the
    previous simple approach did not work (alternative would
    be to extract the arch at runtime via gcc invocation)

package/qt5/qt5webengine: fix chromium arm compile flags (change to BR2_GCC_TARGET_ARCH)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/qt5webengine.mk | 69 ++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 898725937b..9596c8f178 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -63,7 +63,76 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
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
+# no entriy for BR2_ARM_CPU_ARMV7A/BR2_ARM_CPU_ARMV7M, arm_vesion = 7 is already set as default
+
+ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+define QT5WEBENGINE_CONFIGURE_ARM_VERSION
+	$(SED) 's/^    arm_version = 7$$/    arm_version = 8/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
+endef
+endif
+
+define QT5WEBENGINE_CONFIGURE_ARM_ARCH
+	$(SED) 's/^    arm_arch = ""$$/    arm_arch = $(BR2_GCC_TARGET_ARCH)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
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
+	$(SED) 's/^    arm_optionally_use_neon = false$$/    arm_optionally_use_neon = true/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
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
