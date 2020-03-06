From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  6 Mar 2020 21:34:10 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/qt5webengine: use buildroot
 cflags/ldflags for arm
In-Reply-To: <20200306203410.25008-1-ps.report@gmx.net>
References: <20200306203410.25008-1-ps.report@gmx.net>
Message-ID: <20200306203410.25008-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch

Notes:
  - optional patch, maybe the whole setting of the additional
    buildroot cflags/ldflags is to much?

    Example command line without this additional patch:

    .../host/bin/arm-buildroot-linux-gnueabihf-g++ -MMD -MF obj/base/base/base_jumbo_4.o.d -DUSE_SYMBOLIZE -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=b2165ab47ab9c4cc780db53ace1b08607d68ae31 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DBASE_IMPLEMENTATION -I. -Igen -I../../3rdparty/chromium -Igen -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe -pthread -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-psabi -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers -Wno-unused-parameter -fno-omit-frame-pointer -g0 -fvisibility=hidden -O2 -fno-ident -fdata-sections -ffunction-sections -std=gnu++14 -Wno-narrowing -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -fno-exceptions -fno-rtti --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot -fvisibility-inlines-hidden -c gen/base/base_jumbo_4.cc -o obj/base/base/base_jumbo_4.o

    Example command line with this additional patch:

    .../host/bin/arm-buildroot-linux-gnueabihf-g++ -MMD -MF obj/base/base/base_jumbo_4.o.d -DUSE_SYMBOLIZE -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=b2165ab47ab9c4cc780db53ace1b08607d68ae31 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DBASE_IMPLEMENTATION -I. -Igen -I../../3rdparty/chromium -Igen -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-psabi -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers -Wno-unused-parameter -fno-omit-frame-pointer -g0 -fvisibility=hidden -O2 -fno-ident -fdata-sections -ffunction-sections -std=gnu++14 -Wno-narrowing -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -fno-exceptions -fno-rtti --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot -fvisibility-inlines-hidden -c gen/base/base_jumbo_4.cc -o obj/base/base/base_jumbo_4.o
---
 ...n-use-buildroot-provided-cflags-ldfl.patch | 42 +++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.mk      |  6 +++
 2 files changed, 48 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.7/0003-chromium-BUILD.gn-use-buildroot-provided-cflags-ldfl.patch

diff --git a/package/qt5/qt5webengine/5.12.7/0003-chromium-BUILD.gn-use-buildroot-provided-cflags-ldfl.patch b/package/qt5/qt5webengine/5.12.7/0003-chromium-BUILD.gn-use-buildroot-provided-cflags-ldfl.patch
new file mode 100644
index 0000000000..52ddc2d878
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.7/0003-chromium-BUILD.gn-use-buildroot-provided-cflags-ldfl.patch
@@ -0,0 +1,42 @@
+From f647383e9af9896a7a0247d20b3db480c14863f3 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 6 Mar 2020 18:55:02 +0100
+Subject: [PATCH] chromium/BUILD.gn: use buildroot provided cflags/ldflags
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/chromium/build/config/compiler/BUILD.gn | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/src/3rdparty/chromium/build/config/compiler/BUILD.gn b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+index 16dec5c6a..e2c5982f5 100644
+--- a/src/3rdparty/chromium/build/config/compiler/BUILD.gn
++++ b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+@@ -672,8 +672,8 @@ config("compiler") {
+     # TODO(pcc): The contents of .ARM.attributes should be based on the
+     # -march flag passed at compile time (see llvm.org/pr36291).
+     if (current_cpu == "arm") {
+-      # disabled for the buildroot compile
+-      # ldflags += [ "-march=$arm_arch" ]
++      # will be set by  buildroot
++      ldflags += [ @TARGET_LDFLAGS@ ]
+     }
+   }
+ 
+@@ -753,11 +753,8 @@ config("compiler_cpu_abi") {
+         ldflags += [ "--target=arm-linux-gnueabihf" ]
+       }
+       if (!is_nacl) {
+-        # disabled for the buildroot compile
+-        # cflags += [
+-        #   "-march=$arm_arch",
+-        #   "-mfloat-abi=$arm_float_abi",
+-        # ]
++        # will be set by buildroot
++        cflags += [ @TARGET_CXXFLAGS@ ]
+       }
+       if (arm_tune != "") {
+         # disabled for the buildroot compile
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 7337b67e9d..a60a19df88 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -169,6 +169,11 @@ define QT5WEBENGINE_CONFIGURE_ARM_THUMB
 	$(SED) 's/^    arm_use_thumb = true$$/    arm_use_thumb = false/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
 endef
 endif
+
+define QT5WEBENGINE_CONFIGURE_COMPILER_FLAGS
+	$(SED) 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))%g' $(@D)/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+	$(SED) 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))%g' $(@D)/src/3rdparty/chromium/build/config/compiler/BUILD.gn
+endef
 endif
 
 define QT5WEBENGINE_CONFIGURE_CMDS
@@ -179,6 +184,7 @@ define QT5WEBENGINE_CONFIGURE_CMDS
 	$(QT5WEBENGINE_CONFIGURE_ARM_TUNE)
 	$(QT5WEBENGINE_CONFIGURE_ARM_NEON)
 	$(QT5WEBENGINE_CONFIGURE_ARM_THUMB)
+	$(QT5WEBENGINE_CONFIGURE_COMPILER_FLAGS)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
-- 
2.25.1
