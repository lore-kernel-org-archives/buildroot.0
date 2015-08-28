From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 15:38:59 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix build with ccache
Message-ID: <20150828133917.897F281E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f6efa31c13959f332fd5ee1dd31a1c6f6623c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
to be a single valid (absolute or QMAKE_PATH_ENV-relative) path to an
existing file, which is not possible if using ccache as above.

Add a patch fixing this by testing only the first value in QMAKE_CXX.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5/qt5base/0009-fix-build-with-ccache.patch   |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0009-fix-build-with-ccache.patch b/package/qt5/qt5base/0009-fix-build-with-ccache.patch
new file mode 100644
index 0000000..896c0ef
--- /dev/null
+++ b/package/qt5/qt5base/0009-fix-build-with-ccache.patch
@@ -0,0 +1,49 @@
+Fix QMAKE_CXX/CROSS_COMPILE verification with ccache
+
+The use of ccache leads to QMAKE_CXX definitions of the form:
+
+    QMAKE_CXX = $${CCACHE} $${CROSS_COMPILE}g++
+
+The previous test required QMAKE_CXX to be a single valid (absolute or
+QMAKE_PATH_ENV-relative) path to an existing file, which was not
+compatible with definitions of QMAKE_CXX like the one above.
+
+Fix this by using only the first value in QMAKE_CXX, which usually
+points to the compiler executable, or to the ccache executable in the
+above case.
+
+Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
+---
+ mkspecs/features/device_config.prf | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/mkspecs/features/device_config.prf b/mkspecs/features/device_config.prf
+index cd3a0cf..eee4ac6 100644
+--- a/mkspecs/features/device_config.prf
++++ b/mkspecs/features/device_config.prf
+@@ -19,10 +19,15 @@ defineTest(deviceSanityCheckCompiler) {
+     else: \
+         sfx =
+ 
++    # Build the compiler filename using the first value in QMAKE_CXX in order to
++    # support tools like ccache, which give QMAKE_CXX values of the form:
++    #     ccache <path_to_compiler>
++    compiler = $$first(QMAKE_CXX)$$sfx
++
+     # Check if the binary exists with an absolute path. Do this check
+     # before the CROSS_COMPILE empty check below to allow the mkspec
+     # to derive the compiler path from other device options.
+-    exists($$QMAKE_CXX$$sfx):return()
++    exists($$compiler):return()
+ 
+     # Check for possible reasons of failure
+     # check if CROSS_COMPILE device-option is set
+@@ -31,7 +36,7 @@ defineTest(deviceSanityCheckCompiler) {
+     # Check if QMAKE_CXX points to an executable.
+     ensurePathEnv()
+     for (dir, QMAKE_PATH_ENV) {
+-        exists($$dir/$${QMAKE_CXX}$$sfx): \
++        exists($$dir/$${compiler}): \
+             return()
+     }
+ 
