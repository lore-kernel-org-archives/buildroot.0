From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:23:33 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper: use -ffp-contract=off
 on MIPS Xburst for gcc >= 4.6
Message-ID: <20180401142335.80FCF8296B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e58509bfe497c5e85db58f8213b0a44ac79dd3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcc 4.6, GCC deprecated -mfused-madd, -ffp-contract=off should
be used for the Xburst workaround.

Tested with the MIPS Sourcery 2011.03 toolchain (based on gcc 4.5),
the toolchain wrapper uses -mno-fused-madd, as expected:

$ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
Toolchain wrapper executing:
    '/home/thomas/toolchains/mips-2011.03/bin/mips-linux-gnu-gcc'
    '--sysroot'
    '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
    '-mabi=32'
    '-msoft-float'
    '-mno-fused-madd'
    '-EL'
    '-march=mips32r2'
    '-o'
    'toto'
    'toto.c'

And with the MIPS Sourcery 2012.09 toolchain (based on gcc 4.7), the
toolchain wrapper uses -ffp-contract=off, as expected:

$ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
Toolchain wrapper executing:
    '/home/thomas/toolchains/mips-2012.09/bin/mips-linux-gnu-gcc'
    '--sysroot'
    '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
    '-mabi=32'
    '-msoft-float'
    '-ffp-contract=off'
    '-EL'
    '-march=mips32r2'
    '-o'
    'toto'
    'toto.c'

Fixes the ci20_defconfig build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/60303132

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: rework to continue supporting pre-gcc-4.6 toolchains, extend
the commit log after doing more testing.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.c  | 3 +++
 toolchain/toolchain-wrapper.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 2928ea42d0..c5eb813dd0 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -82,6 +82,9 @@ static char *predef_args[] = {
 #ifdef BR_NO_FUSED_MADD
 	"-mno-fused-madd",
 #endif
+#ifdef BR_FP_CONTRACT_OFF
+	"-ffp-contract=off",
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 0b26037d48..b8074efc3c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -32,8 +32,14 @@ endif
 
 # Avoid FPU bug on XBurst CPUs
 ifeq ($(BR2_mips_xburst),y)
+# Before gcc 4.6, -mno-fused-madd was needed, after -ffp-contract is
+# needed
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
+else
 TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
 endif
+endif
 
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
