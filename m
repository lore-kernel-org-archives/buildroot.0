From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 25 Aug 2015 12:41:38 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
Message-ID: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with ccache failed with:

    Running configuration tests...
    Failed to process makespec for platform 'devices/linux-buildroot-g++'
    Project ERROR: Compiler <path_to_output_dir>/host/usr/bin/ccache <path_to_output_dir>/host/usr/bin/<cross_compile>-g++ not found. Check the value of CROSS_COMPILE -device-option
    Could not read qmake configuration file <path_to_output_dir>/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
    Error processing project file: /dev/null

This was caused by Buildroot setting this in
qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf:

    QMAKE_CXX               = $${BR_CCACHE} $${CROSS_COMPILE}g++

But qt5base-5.5.0/mkspecs/features/device_config.prf expects QMAKE_CXX
to be a valid (absolute or QMAKE_PATH_ENV-relative) path to an existing
file, which is not possible if using ccache as above.

Add a patch removing these tests since the toolchain is already tested
by Buildroot, which allows to keep using ccache.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 .../qt5/qt5base/0009-fix-build-with-ccache.patch   | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/qt5/qt5base/0009-fix-build-with-ccache.patch

diff --git a/package/qt5/qt5base/0009-fix-build-with-ccache.patch b/package/qt5/qt5base/0009-fix-build-with-ccache.patch
new file mode 100644
index 0000000..04d41a4
--- /dev/null
+++ b/package/qt5/qt5base/0009-fix-build-with-ccache.patch
@@ -0,0 +1,60 @@
+Fix build with ccache
+
+Building with Buildroot and ccache failed with:
+
+    Running configuration tests...
+    Failed to process makespec for platform 'devices/linux-buildroot-g++'
+    Project ERROR: Compiler <path_to_output_dir>/host/usr/bin/ccache <path_to_output_dir>/host/usr/bin/<cross_compile>-g++ not found. Check the value of CROSS_COMPILE -device-option
+    Could not read qmake configuration file <path_to_output_dir>/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
+    Error processing project file: /dev/null
+
+This was caused by Buildroot setting this in
+qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf:
+
+    QMAKE_CXX               = $${BR_CCACHE} $${CROSS_COMPILE}g++
+
+But qt5base-5.5.0/mkspecs/features/device_config.prf expects QMAKE_CXX
+to be a valid (absolute or QMAKE_PATH_ENV-relative) path to an existing
+file, which is not possible if using ccache as above.
+
+Remove these tests since the toolchain is already tested by Buildroot,
+which allows to keep using ccache.
+
+Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
+---
+ mkspecs/features/device_config.prf | 23 -----------------------
+ 1 file changed, 23 deletions(-)
+
+diff --git a/mkspecs/features/device_config.prf b/mkspecs/features/device_config.prf
+index cd3a0cf..ef16540 100644
+--- a/mkspecs/features/device_config.prf
++++ b/mkspecs/features/device_config.prf
+@@ -14,28 +14,5 @@ host_build {
+ 
+ # Provide a function to be used by mkspecs
+ defineTest(deviceSanityCheckCompiler) {
+-    equals(QMAKE_HOST.os, Windows): \
+-        sfx = .exe
+-    else: \
+-        sfx =
+-
+-    # Check if the binary exists with an absolute path. Do this check
+-    # before the CROSS_COMPILE empty check below to allow the mkspec
+-    # to derive the compiler path from other device options.
+-    exists($$QMAKE_CXX$$sfx):return()
+-
+-    # Check for possible reasons of failure
+-    # check if CROSS_COMPILE device-option is set
+-    isEmpty(CROSS_COMPILE):error("CROSS_COMPILE needs to be set via -device-option CROSS_COMPILE=<path>")
+-
+-    # Check if QMAKE_CXX points to an executable.
+-    ensurePathEnv()
+-    for (dir, QMAKE_PATH_ENV) {
+-        exists($$dir/$${QMAKE_CXX}$$sfx): \
+-            return()
+-    }
+-
+-    # QMAKE_CXX does not point to a compiler.
+-    error("Compiler $$QMAKE_CXX not found. Check the value of CROSS_COMPILE -device-option")
+ }
+ 
-- 
2.1.4
