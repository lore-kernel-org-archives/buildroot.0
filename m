From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Jan 2019 19:54:47 +0100
Subject: [Buildroot] [RFC v1] qt5: bump latest version to 5.12.0
Message-ID: <20190117185447.15338-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base:
  - removed 0002-double-conversion-enable-for-aarch64_be.patch
    (superseeded by upstream commits [1] and [2])
  - removed 0003-double-conversion-enable-for-or1k.patch
    (superseeded by upstream commits [1] and [2])
  - rebased 0004-double-conversion-enable-for-microblaze.patch

  - add two upstream patches to fix qendian/qswap compile related failures

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6a39e49a6cdeb28a04a3657bb6a22f848d5dfa9d
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4d40f09a45202dff901d4f970a6a7e939797138b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - not yet complete compile tested, would suggest to wait after
    2019.02 release to merge
  - partly compile/runtime tested for i.mx6 platform
---
 package/qt5/Config.in                         |  4 +-
 package/qt5/qt5.mk                            |  4 +-
 package/qt5/qt53d/qt53d.hash                  |  4 +-
 ...ble-conversion-enable-for-aarch64_be.patch | 26 --------
 ...03-double-conversion-enable-for-or1k.patch | 27 --------
 ...tbase-Fix-build-error-when-using-EGL.patch |  0
 ...of-qendian-s-qswap-specializations-o.patch | 65 +++++++++++++++++++
 ...-qbswap-calls-for-Big-Endian-targets.patch | 35 ++++++++++
 ...ble-conversion-enable-for-microblaze.patch | 20 +++---
 .../qt5base/{5.11.3 => 5.12.0}/qt5base.hash   |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |  4 +-
 package/qt5/qt5charts/qt5charts.hash          |  4 +-
 .../{5.11.3 => 5.12.0}/qt5connectivity.hash   |  4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 .../qt5/qt5declarative/qt5declarative.hash    |  4 +-
 .../qt5graphicaleffects.hash                  |  4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |  4 +-
 ...tivegeomap-fix-building-with-GCC-5.x.patch |  0
 package/qt5/qt5location/qt5location.hash      |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |  4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |  4 +-
 .../{5.11.3 => 5.12.0}/qt5quickcontrols2.hash |  4 +-
 package/qt5/qt5script/qt5script.hash          |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |  4 +-
 .../{5.11.3 => 5.12.0}/qt5serialbus.hash      |  4 +-
 .../{5.11.3 => 5.12.0}/qt5serialport.hash     |  4 +-
 package/qt5/qt5svg/qt5svg.hash                |  4 +-
 package/qt5/qt5tools/qt5tools.hash            |  4 +-
 .../qt5virtualkeyboard.hash                   |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |  4 +-
 package/qt5/qt5webengine/qt5webengine.hash    |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash  |  4 +-
 .../{5.11.3 => 5.12.0}/qt5x11extras.hash      |  4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  4 +-
 36 files changed, 167 insertions(+), 118 deletions(-)
 delete mode 100644 package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
 delete mode 100644 package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
 rename package/qt5/qt5base/{5.11.3 => 5.12.0}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 create mode 100644 package/qt5/qt5base/5.12.0/0002-Fix-compilation-of-qendian-s-qswap-specializations-o.patch
 create mode 100644 package/qt5/qt5base/5.12.0/0003-Fix-qbswap-calls-for-Big-Endian-targets.patch
 rename package/qt5/qt5base/{5.11.3 => 5.12.0}/0004-double-conversion-enable-for-microblaze.patch (60%)
 rename package/qt5/qt5base/{5.11.3 => 5.12.0}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.11.3 => 5.12.0}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.11.3 => 5.12.0}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 rename package/qt5/qt5location/{5.11.3 => 5.12.0}/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch (100%)
 rename package/qt5/qt5quickcontrols2/{5.11.3 => 5.12.0}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.11.3 => 5.12.0}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.11.3 => 5.12.0}/qt5serialport.hash (65%)
 rename package/qt5/qt5virtualkeyboard/{5.11.3 => 5.12.0}/qt5virtualkeyboard.hash (70%)
 rename package/qt5/qt5x11extras/{5.11.3 => 5.12.0}/qt5x11extras.hash (65%)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 735824402e..d1198ce146 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,14 +35,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.11)"
+	bool "Latest (5.12)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.11, which is licensed under
+	  This option builds Qt 5.12, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 88ba1958dd..f52e310a22 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.11
-QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_VERSION_MAJOR = 5.12
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 2da5500505..f73a6eb10b 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qt3d-everywhere-src-5.11.3.tar.xz.sha256
-sha256 04a55c21f365d897ec75042ee83f9ad59a847992c6f55fae0763ad2701d99eab qt3d-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qt3d-everywhere-src-5.12.0.tar.xz.sha256
+sha256 a12adc9c14ffa18ff5c4951efb41914d4840a0c2a88486eb8d39a4833e4631da qt3d-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
deleted file mode 100644
index 838f4dd7ad..0000000000
--- a/package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e81ba4e0de16ff741417ae7ed7dfe7b5a83d66e2 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 13 Aug 2018 20:15:05 +0200
-Subject: [PATCH] double-conversion: enable for aarch64_be
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../double-conversion/include/double-conversion/utils.h         | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index 20bfd36c84..77baa2861a 100644
---- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
-+++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -65,7 +65,7 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__)
-+    defined(__AARCH64EL__) || defined(__AARCH64EB__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
--- 
-2.18.0
-
diff --git a/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch b/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
deleted file mode 100644
index 53c5a31832..0000000000
--- a/package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f9920819e6600a68829fb4600f11b70ebc2a33e7 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 18 Aug 2018 23:44:20 +0200
-Subject: [PATCH] double-conversion: enable for or1k
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../double-conversion/include/double-conversion/utils.h        | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index 77baa2861a..b0a7d5d4f4 100644
---- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
-+++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -65,7 +65,8 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__) || defined(__AARCH64EB__)
-+    defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
-+    defined(__or1k__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
--- 
-2.18.0
-
diff --git a/package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.0/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.11.3/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.0/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.0/0002-Fix-compilation-of-qendian-s-qswap-specializations-o.patch b/package/qt5/qt5base/5.12.0/0002-Fix-compilation-of-qendian-s-qswap-specializations-o.patch
new file mode 100644
index 0000000000..a948599915
--- /dev/null
+++ b/package/qt5/qt5base/5.12.0/0002-Fix-compilation-of-qendian-s-qswap-specializations-o.patch
@@ -0,0 +1,65 @@
+From 1a57f13aa685af335dfe36d6ace646cf65d33067 Mon Sep 17 00:00:00 2001
+From: Ville Voutilainen <ville.voutilainen@qt.io>
+Date: Wed, 21 Nov 2018 14:07:18 +0200
+Subject: [PATCH] Fix compilation of qendian's qswap specializations on gcc 4.8
+
+Task-number: QTBUG-71945
+Change-Id: Icf2b75c72946f57ebffc880c9238531dea13ab5b
+Reviewed-by: Ivan Komissarov <ABBAPOH@gmail.com>
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+
+Upstream: http://code.qt.io/cgit/qt/qtbase.git/patch/?id=1eeebae7e3b5eb8dda37755b32aafe6719b5cf7b
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/global/qendian.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/corelib/global/qendian.h b/src/corelib/global/qendian.h
+index 0e67a1ab..f2e58334 100644
+--- a/src/corelib/global/qendian.h
++++ b/src/corelib/global/qendian.h
+@@ -162,17 +162,17 @@ Float qbswapFloatHelper(Float source)
+     return qFromUnaligned<Float>(&temp);
+ }
+ 
+-template <> inline qfloat16 qbswap<qfloat16>(qfloat16 source)
++inline qfloat16 qbswap(qfloat16 source)
+ {
+     return qbswapFloatHelper(source);
+ }
+ 
+-template <> inline float qbswap<float>(float source)
++inline float qbswap(float source)
+ {
+     return qbswapFloatHelper(source);
+ }
+ 
+-template <> inline double qbswap<double>(double source)
++inline double qbswap(double source)
+ {
+     return qbswapFloatHelper(source);
+ }
+@@ -185,7 +185,7 @@ template <> inline double qbswap<double>(double source)
+ */
+ template <typename T> inline void qbswap(const T src, void *dest)
+ {
+-    qToUnaligned<T>(qbswap<T>(src), dest);
++    qToUnaligned<T>(qbswap(src), dest);
+ }
+ 
+ template <int Size> void *qbswap(const void *source, qsizetype count, void *dest) noexcept;
+@@ -223,9 +223,9 @@ template <typename T> inline void qFromLittleEndian(const void *source, qsizetyp
+ #else // Q_LITTLE_ENDIAN
+ 
+ template <typename T> inline Q_DECL_CONSTEXPR T qToBigEndian(T source)
+-{ return qbswap<T>(source); }
++{ return qbswap(source); }
+ template <typename T> inline Q_DECL_CONSTEXPR T qFromBigEndian(T source)
+-{ return qbswap<T>(source); }
++{ return qbswap(source); }
+ template <typename T> inline Q_DECL_CONSTEXPR T qToLittleEndian(T source)
+ { return source; }
+ template <typename T> inline Q_DECL_CONSTEXPR T qFromLittleEndian(T source)
+-- 
+2.18.0
+
diff --git a/package/qt5/qt5base/5.12.0/0003-Fix-qbswap-calls-for-Big-Endian-targets.patch b/package/qt5/qt5base/5.12.0/0003-Fix-qbswap-calls-for-Big-Endian-targets.patch
new file mode 100644
index 0000000000..51802f3661
--- /dev/null
+++ b/package/qt5/qt5base/5.12.0/0003-Fix-qbswap-calls-for-Big-Endian-targets.patch
@@ -0,0 +1,35 @@
+From 7865f15e2411e43cb4efbf1628ad31e733e1c187 Mon Sep 17 00:00:00 2001
+From: Ville Voutilainen <ville.voutilainen@qt.io>
+Date: Fri, 4 Jan 2019 09:35:40 +0200
+Subject: [PATCH] Fix qbswap calls for Big Endian targets
+
+Task-number: QTBUG-71945
+Change-Id: I5356f8e32d00ea591b1f65cdd4111276fcf876ac
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+Reviewed-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: http://code.qt.io/cgit/qt/qtbase.git/patch/?id=1fb41a38692a4f675a9a336d92d806e12eeb0de9
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/global/qendian.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/global/qendian.h b/src/corelib/global/qendian.h
+index f2e58334..615f5238 100644
+--- a/src/corelib/global/qendian.h
++++ b/src/corelib/global/qendian.h
+@@ -204,9 +204,9 @@ template <typename T> inline Q_DECL_CONSTEXPR T qToBigEndian(T source)
+ template <typename T> inline Q_DECL_CONSTEXPR T qFromBigEndian(T source)
+ { return source; }
+ template <typename T> inline Q_DECL_CONSTEXPR T qToLittleEndian(T source)
+-{ return qbswap<T>(source); }
++{ return qbswap(source); }
+ template <typename T> inline Q_DECL_CONSTEXPR T qFromLittleEndian(T source)
+-{ return qbswap<T>(source); }
++{ return qbswap(source); }
+ template <typename T> inline void qToBigEndian(T src, void *dest)
+ { qToUnaligned<T>(src, dest); }
+ template <typename T> inline void qToLittleEndian(T src, void *dest)
+-- 
+2.18.0
+
diff --git a/package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.0/0004-double-conversion-enable-for-microblaze.patch
similarity index 60%
rename from package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.0/0004-double-conversion-enable-for-microblaze.patch
index 2d7164b67c..c91d812695 100644
--- a/package/qt5/qt5base/5.11.3/0004-double-conversion-enable-for-microblaze.patch
+++ b/package/qt5/qt5base/5.12.0/0004-double-conversion-enable-for-microblaze.patch
@@ -1,27 +1,29 @@
-From 372d33fbe549ea73318c187505716ac99fbf3054 Mon Sep 17 00:00:00 2001
+From 014958d2d17045dd63d93cb3061d1e40b15725b7 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 21 Aug 2018 21:11:40 +0200
 Subject: [PATCH] double-conversion: enable for microblaze
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.12.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  .../double-conversion/include/double-conversion/utils.h        | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-index b0a7d5d4f4..485f680180 100644
+index 7622fe6162..d29de95094 100644
 --- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
 +++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
-@@ -66,7 +66,8 @@
-     defined(__SH4__) || defined(__alpha__) || \
+@@ -94,7 +94,8 @@ int main(int argc, char** argv) {
      defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || defined(__EMSCRIPTEN__) || \
 -    defined(__or1k__)
-+    defined(__or1k__) || \
++    defined(__or1k__)  || \
 +    defined(__microblaze__)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
 -- 
-2.18.0
+2.19.2
 
diff --git a/package/qt5/qt5base/5.11.3/qt5base.hash b/package/qt5/qt5base/5.12.0/qt5base.hash
similarity index 73%
rename from package/qt5/qt5base/5.11.3/qt5base.hash
rename to package/qt5/qt5base/5.12.0/qt5base.hash
index 964bcf1ab9..d9e1b0282d 100644
--- a/package/qt5/qt5base/5.11.3/qt5base.hash
+++ b/package/qt5/qt5base/5.12.0/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtbase-everywhere-src-5.11.3.tar.xz.sha256
-sha256 c6bf887732b83ce072eb72eddb7497bedcdf9ca794e7ed91261a93f063623e1c qtbase-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtbase-everywhere-src-5.12.0.tar.xz.sha256
+sha256 5e03221d780e121aabd734896aab8f331e5d8c9d9b54f1eb04907d0818eaeecb qtbase-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 4fc7c613b0..3e856d4d72 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcanvas3d-everywhere-src-5.11.3.tar.xz.sha256
-sha256 d5a004848588c1c53ea7ed9d36bb5bfe3a813ffc45290066d2f6cfcace072138 qtcanvas3d-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtcanvas3d-everywhere-src-5.12.0.tar.xz.sha256
+sha256 b21b9f01c498d0e51e3db4c54344147fb901c0f40ec8b3135609905b55f9c128 qtcanvas3d-everywhere5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 2519b8f13c..0f74909aea 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcharts-everywhere-src-5.11.3.tar.xz.sha256
-sha256 4798f3ebc4d937d1c190db7ff718ad5affa907caa56b5557e593f6b5a60d95dc qtcharts-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtcharts-everywhere-src-5.12.0.tar.xz.sha256
+sha256 9cd71c4a4c10611083ce8f16992c59666d51b5275cc1a79f324ee18579ced450 qtcharts-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.0/qt5connectivity.hash
similarity index 65%
rename from package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.0/qt5connectivity.hash
index 54fda648cd..93ac71fa62 100644
--- a/package/qt5/qt5connectivity/5.11.3/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.0/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtconnectivity-everywhere-src-5.11.3.tar.xz.sha256
-sha256 148cfcbceb3d0a70059f4d92fa069baf56babb627b16a4203b318ca6f0d0b32a qtconnectivity-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtconnectivity-everywhere-src-5.12.0.tar.xz.sha256
+sha256 8ebca1ba859ebb5b0e8e6fffff1f8131dd84f9e44448df6ac58c8be32b5122a4 qtconnectivity-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.0/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.11.3/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.0/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 3ce4e50250..22e0e12193 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtdeclarative-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8e263621d706f1c4def5d71212a6ae37b0d3c378da89d9e3e5fc0b5557721ae6 qtdeclarative-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtdeclarative-everywhere-src-5.12.0.tar.xz.sha256
+sha256 4ffd58102b5714ae058f91cc31511f1c928978f77f01652beb9ce2352a4c227b qtdeclarative-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 36dd345268..16848861d1 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtgraphicaleffects-everywhere-src-5.11.3.tar.xz.sha256
-sha256 14d86983fcdd119daefad235ffee7d8ca691e6074ef360cb6347b8aae66f57e2 qtgraphicaleffects-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtgraphicaleffects-everywhere-src-5.12.0.tar.xz.sha256
+sha256 81058fb12d4dd019bed6bb196a13ea5d308a390d72a1468da11171f8c3003455 qtgraphicaleffects-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 1c1f81bbed..0f0c39f1ad 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtimageformats-everywhere-src-5.11.3.tar.xz.sha256
-sha256 04b261bc3d7a277fbe9ac8619ecd037d7089b356eaee41b2d41d7a2ff58b087f qtimageformats-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtimageformats-everywhere-src-5.12.0.tar.xz.sha256
+sha256 5f907de96d3db6276816f321b7e11cba7beb1fcc81bcb3f1729cde3b7599732e qtimageformats-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch b/package/qt5/qt5location/5.12.0/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
similarity index 100%
rename from package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
rename to package/qt5/qt5location/5.12.0/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index be0ac7c31f..2ff472c6c7 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtlocation-everywhere-src-5.11.3.tar.xz.sha256
-sha256 58e498a5b496e3a38925398b244bbd57ba68cbb482f2a0d2ae51572e037100eb qtlocation-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtlocation-everywhere-src-5.12.0.tar.xz.sha256
+sha256 b0a3134df3a00f6045405d3c12e0ea3ae7e640feaf38e238873df85424674449 qtlocation-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 851cbc3539..96bdd007c6 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtmultimedia-everywhere-src-5.11.3.tar.xz.sha256
-sha256 728078eff7dc21495d704a7cd17c604d74604604b45a3c58271608f90dea3c41 qtmultimedia-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtmultimedia-everywhere-src-5.12.0.tar.xz.sha256
+sha256 5c4b0cb9c08c57ce1aad3aee267c6f6270d254addfb2a6dd363a272e98e926a9 qtmultimedia-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 25c41c6e34..687ad5851d 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols-everywhere-src-5.11.3.tar.xz.sha256
-sha256 4e4e5da02ab0b06d35b09356170013cfe36a773d15f92281f7e6d085c3f07537 qtquickcontrols-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtquickcontrols-everywhere-src-5.12.0.tar.xz.sha256
+sha256 2bfb63240beed6926be429310e91b33df836fe38bcaf9de6883d5e781511cd73 qtquickcontrols-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.0/qt5quickcontrols2.hash
similarity index 54%
rename from package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.0/qt5quickcontrols2.hash
index b1caf464a1..764dc39c52 100644
--- a/package/qt5/qt5quickcontrols2/5.11.3/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.0/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols2-everywhere-src-5.11.3.tar.xz.sha256
-sha256 f45630b652585b62204405b28432977e67c148ca5f1789a794654fd6c1bad086 qtquickcontrols2-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtquickcontrols2-everywhere-src-5.12.0.tar.xz.sha256
+sha256 89777e2ee89a08d203e0e394be0c47dc52008ea58506f4b3bdf1a696c5907dc6 qtquickcontrols2-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 245d66be63..8b88e12692 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscript-everywhere-src-5.11.3.tar.xz.sha256
-sha256 bb84f3cc581078df4ff76705c5623cd88287f70f7405cbccf99e6fb6dedbec08 qtscript-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtscript-everywhere-src-5.12.0.tar.xz.sha256
+sha256 97fe1a22e5d0e89d3850546c0771fe41707d4c40062dc16fae8e21bf6f8cffa8 qtscript-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index d2184c94e6..50955fca54 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtscxml-everywhere-src-5.11.3.tar.xz.sha256
-sha256 13172767eda404f1b71ab35998a95af6633d700d2417fff3648d8c6dc6af68d7 qtscxml-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtscxml-everywhere-src-5.12.0.tar.xz.sha256
+sha256 dc6ece52669976836844b0d9bcf4910bca7b5d2c446c6755d7b9f79bfa1add6b qtscxml-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index a8d325d32a..e57922aac1 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsensors-everywhere-src-5.11.3.tar.xz.sha256
-sha256 a75753d1d5607d4cb27b1849ea9612a65bb3a5271bb31bf0817edd143b620859 qtsensors-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtsensors-everywhere-src-5.12.0.tar.xz.sha256
+sha256 c53132847a1f70d5a4c5fe689a9943d8afae3f3648bf5b0d824015093addc5a6 qtsensors-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.0/qt5serialbus.hash
similarity index 60%
rename from package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.0/qt5serialbus.hash
index 7d8d9b3419..bf0dd42521 100644
--- a/package/qt5/qt5serialbus/5.11.3/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.0/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialbus-everywhere-src-5.11.3.tar.xz.sha256
-sha256 5664def35d4ad4aedef14bc529679851450262ea81477a69031ba81aa614c16d qtserialbus-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtserialbus-everywhere-src-5.12.0.tar.xz.sha256
+sha256 6b9286c9762341a48c636da62fecb7b76168a4634e44508b42c19eb0058a359a qtserialbus-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.11.3/qt5serialport.hash b/package/qt5/qt5serialport/5.12.0/qt5serialport.hash
similarity index 65%
rename from package/qt5/qt5serialport/5.11.3/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.0/qt5serialport.hash
index 63e0cb61c1..d1838c44e2 100644
--- a/package/qt5/qt5serialport/5.11.3/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.0/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtserialport-everywhere-src-5.11.3.tar.xz.mirrorlist
-sha256 96c45e6d0d470626815f82b38ee48bf941e1bbfc10863087b69cc5f7bb766bda qtserialport-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtserialport-everywhere-src-5.12.0.tar.xz.mirrorlist
+sha256 59d4005695089c6b50fc5123094125d9224c1715655128640158a2404075a9bb qtserialport-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 3c2f0fe474..b5f39f6e38 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtsvg-everywhere-src-5.11.3.tar.xz.sha256
-sha256 21ea2c9c4e78101e98163bc19e463b8d8cdffa20e1ccd523ccc925b9f2cd4491 qtsvg-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtsvg-everywhere-src-5.12.0.tar.xz.sha256
+sha256 ebe68d8ad73b6b8d8eabac81edcbf395838caf4d498d6b047c74b57341c3fbce qtsvg-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 94f1254b03..807c7beff7 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qttools-everywhere-src-5.11.3.tar.xz.sha256
-sha256 c205e81bba9b87c6186604a05ab48e4e6cac0cd511525749dfd00b107b6f9f8e qttools-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qttools-everywhere-src-5.12.0.tar.xz.sha256
+sha256 574ce34b6e5bcd5dce4020a3947730f3c2223eee65d0396a311099223364dac3 qttools-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.0/qt5virtualkeyboard.hash
similarity index 70%
rename from package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.0/qt5virtualkeyboard.hash
index c7d27870b2..2f75c66a5a 100644
--- a/package/qt5/qt5virtualkeyboard/5.11.3/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.0/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8c5c40245a9dd2e9e504ce2d47d45079d8280436146797b24b8115ef163b4b9e qtvirtualkeyboard-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtvirtualkeyboard-everywhere-src-5.12.0.tar.xz.sha256
+sha256 db93b89ba13ec1a688850f456be9f10037033cebf7b4deb151ed9f5322d0d6da qtvirtualkeyboard-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 40d1bb0b26..cfbef77004 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwayland-everywhere-src-5.11.3.tar.xz.sha256
-sha256 62c94f29e461c849e479f39d21577b0c72f0f084250e126021edcf0719271fb2 qtwayland-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtwayland-everywhere-src-5.12.0.tar.xz.sha256
+sha256 555c2d1b31733735d94c228f5f9183ea8216d61f85e30af08044763639d97ed7 qtwayland-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7c87683ba8..084c8d809e 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebchannel-everywhere-src-5.11.3.tar.xz.sha256
-sha256 3c254fa41b1af09c1e951131f3a1336dee70a15cbb8a82112488b38d29572df3 qtwebchannel-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtwebchannel-everywhere-src-5.12.0.tar.xz.sha256
+sha256 851af30ab951c7543c82640f46686227b244331ebf9235f963edcb7e5a184bf0 qtwebchannel-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 730352611a..4ab3a6d50b 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebengine-everywhere-src-5.11.3.tar.xz.sha256
-sha256 5bb49ead71b851db4dc56f8fd97e0db72a268b22104129a06bac201d55d3b8fe qtwebengine-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtwebengine-everywhere-src-5.12.0.tar.xz.sha256
+sha256 bd581e390a30e0f74d41b0e3334b3cf612dd4af23de36a3bf5931d5b4453687c qtwebengine-everywhere-src-5.12.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 0df4ac98fa..47fc65357d 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtwebsockets-everywhere-src-5.11.3.tar.xz.sha256
-sha256 021090c1a92f11fcf2914168741c1364235896793685b7fae2bc23e3dd55d5b9 qtwebsockets-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtwebsockets-everywhere-src-5.12.0.tar.xz.sha256
+sha256 444da1c1d32910738a01b8251c1ccc3ffe4df148f125bb4af532b247ad74fc3f qtwebsockets-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.0/qt5x11extras.hash
similarity index 65%
rename from package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.0/qt5x11extras.hash
index 9a0e85d8fd..cb4cfa74fd 100644
--- a/package/qt5/qt5x11extras/5.11.3/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.0/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtx11extras-everywhere-src-5.11.3.tar.xz.mirrorlist
-sha256 f99eebe685f7cdbb71cd62903c2b2511548345535841bcc3f6b662205815cd85 qtx11extras-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtx11extras-everywhere-src-5.12.0.tar.xz.mirrorlist
+sha256 06d4b4e9868d206f07ae4e884c46d46a5540172a85ce67d829fdb1fba7228b84 qtx11extras-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 5c66a54eeb..70168f229a 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtxmlpatterns-everywhere-src-5.11.3.tar.xz.sha256
-sha256 8bd00be30722570d22382b99679d07787a2d62d4891d1c47d738d634e2db0eee qtxmlpatterns-everywhere-src-5.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtxmlpatterns-everywhere-src-5.12.0.tar.xz.sha256
+sha256 f36279bcafb8052a0b60edd473e1d341b4733a43eb26239848b4382303679375 qtxmlpatterns-everywhere-src-5.12.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.20.1
