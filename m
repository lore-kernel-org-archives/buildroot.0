From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Aug 2018 22:59:24 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] cutelyst: link with libatomic when needed
Message-ID: <20180828205924.21830-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

This atomic dependency is due to Qt >= 5.8, pkconfig can't be used as
Qt5 pc files does not mention this dependency

Fixes:
 - http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Peter Korsgaard):
 - Use CMAKE_CXX_FLAGS instead of CMAKE_EXE_LINKER_FLAGS
 - Link with latomic only if BR2_PACKAGE_QT5_VERSION_LATEST is set

 package/cutelyst/cutelyst.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index e8695a7b3a..8e117e3286 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -16,6 +16,11 @@ CUTELYST_CONF_OPTS += \
 	-DPLUGIN_CSRFPROTECTION=ON \
 	-DPLUGIN_VIEW_GRANTLEE=OFF
 
+# Qt 5.8 needs atomics, which on various architectures are in -latomic
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+CUTELYST_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
 CUTELYST_DEPENDENCIES += libpwquality
-- 
2.14.1
