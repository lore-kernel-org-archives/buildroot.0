From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2020 20:20:06 +0200
Subject: [Buildroot] [git commit] package/musepack: fix build with gcc 10
Message-ID: <20200910181457.AEB2D890D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14efb3255915805edd71af7adecacb738414d5ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9971da8c59484a6a26eb79d6e157461a47855dbf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musepack/0005-fix-build-with-gcc-10.patch | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/musepack/0005-fix-build-with-gcc-10.patch b/package/musepack/0005-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..012dbab542
--- /dev/null
+++ b/package/musepack/0005-fix-build-with-gcc-10.patch
@@ -0,0 +1,30 @@
+fix build with gcc 10
+
+Define __Cc, __Dc and Res_bit as extern to avoid the following build
+failure with gcc 10 (which defaults to -fno-common):
+
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x0): multiple definition of `__Dc'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x430): first defined here
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x28): multiple definition of `__Cc'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x458): first defined here
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x74): multiple definition of `Res_bit'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x4a4): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9971da8c59484a6a26eb79d6e157461a47855dbf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naur musepack_src_r475.orig/libmpcdec/requant.h musepack_src_r475/libmpcdec/requant.h
+--- musepack_src_r475.orig/libmpcdec/requant.h	2020-09-10 08:31:50.696105246 +0200
++++ musepack_src_r475/libmpcdec/requant.h	2020-09-10 08:32:52.944106476 +0200
+@@ -47,9 +47,9 @@
+ 
+ 
+ /* C O N S T A N T S */
+-const mpc_uint8_t      Res_bit [18];     ///< Bits per sample for chosen quantizer
+-const MPC_SAMPLE_FORMAT __Cc    [1 + 18]; ///< Requantization coefficients
+-const mpc_int16_t       __Dc    [1 + 18]; ///< Requantization offset
++extern const mpc_uint8_t      Res_bit [18];     ///< Bits per sample for chosen quantizer
++extern const MPC_SAMPLE_FORMAT __Cc    [1 + 18]; ///< Requantization coefficients
++extern const mpc_int16_t       __Dc    [1 + 18]; ///< Requantization offset
+ 
+ #define Cc (__Cc + 1)
+ #define Dc (__Dc + 1)
