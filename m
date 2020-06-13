From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Jun 2020 17:35:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump version to 1.73.0
Message-ID: <20200613153509.2471832-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.boost.org/users/history/version_1_73_0.html

Removed patch 0004 which was committed upstream:
https://github.com/boostorg/predef/commit/4bc7cc02eda854e4c8ac73caecfee37717083a6b

Reformatted hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0004-add-riscv-endian-detection.patch     | 36 -------------------
 package/boost/boost.hash                      |  6 ++--
 package/boost/boost.mk                        |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/boost/0004-add-riscv-endian-detection.patch

diff --git a/package/boost/0004-add-riscv-endian-detection.patch b/package/boost/0004-add-riscv-endian-detection.patch
deleted file mode 100644
index 879838df3a..0000000000
--- a/package/boost/0004-add-riscv-endian-detection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add RISC-V endian detection
-
-boost/predef/other/endian.h has two ways of detecting the endianess:
-
- (1) It includes <endian.h> if BOOST_LIB_C_GNU is defined, and then
-     use __BYTE_ORDER to decide the endianness.
-
- (2) Otherwise, if (1) was not possible for some reason, it uses
-     architecture defines to decide the endianness.
-
-(1) works perfectly fine with glibc toolchains, because
-BOOST_LIB_C_GNU is defined, but it doesn't work with musl. Due to
-this, <endian.h> is not included, __BYTE_ORDER is not defined, and
-method (1) does not work, causing build failures on musl toolchains
-that don't have explicit handling by architecture name (method 2).
-
-So this commit fixes RISC-V musl build by adding support for the
-__riscv architecture define, to determine that the endianness is
-little endian.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-
-Index: b/boost/predef/other/endian.h
-===================================================================
---- a/boost/predef/other/endian.h
-+++ b/boost/predef/other/endian.h
-@@ -127,7 +127,8 @@
-         defined(__AARCH64EL__) || \
-         defined(_MIPSEL) || \
-         defined(__MIPSEL) || \
--        defined(__MIPSEL__)
-+        defined(__MIPSEL__) || \
-+        defined(__riscv)
- #       undef BOOST_ENDIAN_LITTLE_BYTE
- #       define BOOST_ENDIAN_LITTLE_BYTE BOOST_VERSION_NUMBER_AVAILABLE
- #   endif
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 0348f40461..c94699aa67 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_72_0.html
-sha256 59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722  boost_1_72_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_73_0.html
+sha256  4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402  boost_1_73_0.tar.bz2
 
 # Locally computed
-sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2daf7f5a96..ef638fc9df 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.72.0
+BOOST_VERSION = 1.73.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
-- 
2.26.2
