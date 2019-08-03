From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:28:32 +0200
Subject: [Buildroot] [git commit] package/boost: fix RISC-V musl endian
 detection
Message-ID: <20190803132545.3C8B1867E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b28ca0cf6eecc6e8297176c2c49d2312920fa17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent addition of a RISC-V musl toolchain uncovered an issue in
Boost's endianness detection. Boost endianness detection only works
for C libraries that pretend to be glibc *or* if the architecture is
explicitly handled by Boost endian.h header. Neither were true for
RISC-V musl, so we slightly patch boost to fix this problem.

Fixes:

  http://autobuild.buildroot.net/results/a40b600a7d0fdb6a8a1ded7883b4936f120811f5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../boost/0004-add-riscv-endian-detection.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/boost/0004-add-riscv-endian-detection.patch b/package/boost/0004-add-riscv-endian-detection.patch
new file mode 100644
index 0000000000..879838df3a
--- /dev/null
+++ b/package/boost/0004-add-riscv-endian-detection.patch
@@ -0,0 +1,36 @@
+Add RISC-V endian detection
+
+boost/predef/other/endian.h has two ways of detecting the endianess:
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
+
+Index: b/boost/predef/other/endian.h
+===================================================================
+--- a/boost/predef/other/endian.h
++++ b/boost/predef/other/endian.h
+@@ -127,7 +127,8 @@
+         defined(__AARCH64EL__) || \
+         defined(_MIPSEL) || \
+         defined(__MIPSEL) || \
+-        defined(__MIPSEL__)
++        defined(__MIPSEL__) || \
++        defined(__riscv)
+ #       undef BOOST_ENDIAN_LITTLE_BYTE
+ #       define BOOST_ENDIAN_LITTLE_BYTE BOOST_VERSION_NUMBER_AVAILABLE
+ #   endif
