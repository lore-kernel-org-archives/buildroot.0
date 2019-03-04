From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 22:36:11 +0100
Subject: [Buildroot] [git commit] package/libsoxr: add patch to add
 Libs.private in soxr.pc
Message-ID: <20190304213419.464F18E1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f551e92dc53e51d43537bbe9f2cb1209ab0c17f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libsoxr is build statically against libavutil other applications
needs to know that they must link with `-lavutil` when building in a
static context.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Add-Libs.private-for-static-linking.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch b/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch
new file mode 100644
index 0000000000..be96c6e649
--- /dev/null
+++ b/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch
@@ -0,0 +1,43 @@
+From 7d2d1039f303b6322ecb72eebae39b699fd28d19 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 22 Feb 2019 01:31:11 +0100
+Subject: [PATCH] Add Libs.private in soxr.pc.in for static linking
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If libsoxr is build statically against libavutil other applications
+needs to know that they must link with `-lavutil` when building in a
+static context.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt | 1 +
+ src/soxr.pc.in | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ee48f6c..714bd4d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -139,6 +139,7 @@ if (WITH_AVFFT OR (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm" AND SIMD32_FOUND AND WI
+   if (AVUTIL_FOUND)
+     include_directories (${AVUTIL_INCLUDE_DIRS})
+     set (LIBS ${LIBS} ${AVUTIL_LIBRARIES})
++    set (PKGCONF_LIBS_PRIV ${PKGCONF_LIBS_PRIV} -lavutil)
+   endif ()
+ endif ()
+ 
+diff --git a/src/soxr.pc.in b/src/soxr.pc.in
+index 69d225b..6c530a6 100644
+--- a/src/soxr.pc.in
++++ b/src/soxr.pc.in
+@@ -2,4 +2,5 @@ Name: ${PROJECT_NAME}
+ Description: ${DESCRIPTION_SUMMARY}
+ Version: ${PROJECT_VERSION}
+ Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME}
++Libs.private: ${PKGCONF_LIBS_PRIV}
+ Cflags: -I${INCLUDE_INSTALL_DIR}
+-- 
+2.20.1
+
