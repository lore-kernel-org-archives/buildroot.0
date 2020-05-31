From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 May 2020 23:00:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/openblas: needs -fPIC
Message-ID: <20200531210042.471751-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with SSP fails because embedded lapack
(libopenblas_armv8p-r0.3.9.a) is built without -fPIC:

/tmp/instance-0/output-1/host/bin/aarch64-none-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_FORTIFY_SOURCE=1 -O2 -DMAX_STACK_ALLOC=2048 -Wall -DF_INTERFACE_GFORT -fPIC -DSMP_SERVER -DNO_WARMUP -DMAX_CPU_NUMBER=32 -DMAX_PARALLEL_NUMBER=1 -DVERSION=\"0.3.9\" -march=armv8-a -DASMNAME= -DASMFNAME=_ -DNAME=_ -DCNAME= -DCHAR_NAME=\"_\" -DCHAR_CNAME=\"\" -DNO_AFFINITY -I..  -shared -o ../libopenblas_armv8p-r0.3.9.so \
-Wl,--whole-archive ../libopenblas_armv8p-r0.3.9.a -Wl,--no-whole-archive \
-Wl,-soname,libopenblas.so.0 -lm -lpthread -lgfortran -lm -lpthread -lgfortran
/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/9.2.1/../../../../aarch64-none-linux-gnu/bin/ld: ../libopenblas_armv8p-r0.3.9.a(sbdsvdx.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__stack_chk_guard@@GLIBC_2.17' which may bind externally can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/978dc906e3f85fb0ebc615da17353270a7fb65b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openblas/openblas.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9701df9148..542facad38 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -11,7 +11,9 @@ OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
 
 # Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
-OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+OPENBLAS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	FFLAGS="$(TARGET_FCFLAGS) -fPIC"
 
 # Enable cross-compiling
 OPENBLAS_MAKE_OPTS += CROSS=1
-- 
2.26.2
