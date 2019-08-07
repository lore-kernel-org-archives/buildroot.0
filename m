From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 Aug 2019 16:22:18 +0200
Subject: [Buildroot] [PATCH] package/wampcc: fix build failure on RISC-V/musl
Message-ID: <20190807142218.23202-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wampcc includes some code from msgpack-c, which itself includes some
code from Boost for the endianness detection. This code did not
properly handle the case of the RISC-V architecture supported by
non-glibc toolchains, causing the endianness to be unknown (and a
build failure) when building wampcc for RISC-V with the musl C
library.

This commit fixes that, by bringing a change that was upstreamed to
Boost as of commit
https://github.com/boostorg/predef/commit/4bc7cc02eda854e4c8ac73caecfee37717083a6b.

Fixes:

  http://autobuild.buildroot.net/results/01df5a6f38fb32563831d171d03dfb9ad89f5830/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Add-RISC-V-endian-detection.patch    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/wampcc/0001-Add-RISC-V-endian-detection.patch

diff --git a/package/wampcc/0001-Add-RISC-V-endian-detection.patch b/package/wampcc/0001-Add-RISC-V-endian-detection.patch
new file mode 100644
index 0000000000..d23b44ee40
--- /dev/null
+++ b/package/wampcc/0001-Add-RISC-V-endian-detection.patch
@@ -0,0 +1,46 @@
+From e94589ed36c4a311355efc46ba3f76523c546057 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 7 Aug 2019 16:17:16 +0200
+Subject: [PATCH] Add RISC-V endian detection
+
+3rdparty/msgpack-c/include/msgpack/predef/other/endian.h (which comes
+from Boost) two ways of detecting the endianess:
+
+ (1) It includes <endian.h> if BOOST_LIB_C_GNU is defined, and then
+     use __BYTE_ORDER to decide the endianness.
+
+ (2) Otherwise, if (1) was not possible for some reason, it uses
+     architecture defines to decide the endianness.
+
+(1) works perfectly fine with glibc toolchains, because
+BOOST_LIB_C_GNU is defined, but it doesn't work with musl. Due to
+this, <endian.h> is not included, __BYTE_ORDER is not defined, and
+method (1) does not work, causing build failures on musl toolchains
+that don't have explicit handling by architecture name (method 2).
+
+So this commit fixes RISC-V musl build by adding support for the
+__riscv architecture define, to determine that the endianness is
+little endian.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ 3rdparty/msgpack-c/include/msgpack/predef/other/endian.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/3rdparty/msgpack-c/include/msgpack/predef/other/endian.h b/3rdparty/msgpack-c/include/msgpack/predef/other/endian.h
+index 3c609fa..63a5722 100644
+--- a/3rdparty/msgpack-c/include/msgpack/predef/other/endian.h
++++ b/3rdparty/msgpack-c/include/msgpack/predef/other/endian.h
+@@ -127,7 +127,8 @@ information and acquired knowledge:
+         defined(__AARCH64EL__) || \
+         defined(_MIPSEL) || \
+         defined(__MIPSEL) || \
+-        defined(__MIPSEL__)
++        defined(__MIPSEL__) || \
++        defined(__riscv)
+ #       undef MSGPACK_ENDIAN_LITTLE_BYTE
+ #       define MSGPACK_ENDIAN_LITTLE_BYTE MSGPACK_VERSION_NUMBER_AVAILABLE
+ #   endif
+-- 
+2.21.0
+
-- 
2.21.0
