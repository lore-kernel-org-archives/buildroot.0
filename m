From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Oct 2020 16:20:50 +0200
Subject: [Buildroot] [PATCH] toolchain: enable libquadmath for powerpc64(le)
Message-ID: <20201004142050.2487724-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gfortran is enabled on powerpc64(le) we need to build the
libquiadmath library provided by GCC since this architecture
now support 128-bit floating point (__float128) values.

The 128-bit floating point support has been merged into gcc
since release 8.1 [1][2].

Otherwise the build break due to missing header when building a
glibc >= 2.32:
In file included from ../../../libgfortran/runtime/string.c:25:
../../../libgfortran/libgfortran.h:61:12: fatal error: quadmath_weak.h: No such file or directory
   61 | #  include "quadmath_weak.h"
      |            ^~~~~~~~~~~~~~~~~

This issue is probably related to recent changes in glibc 2.32
since there was no such issue while building Bootlin powerpc64(le)
toolchains [3]. With glibc 2.32, gcc-final now define
HAVE_FLOAT128 this is used to include "quadmath_weak.h".

Update comment in pkg-toolchain-external.mk.

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/771109960 (powerpc64)
https://gitlab.com/kubu93/toolchains-builder/-/jobs/771109993 (powerpc64le)

[1] https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/PowerPC-Built-in-Functions.html
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85440
[3] https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2020.08-1.tar.bz2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                    | 2 ++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e2befed20..a29f9f62ac 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -722,9 +722,11 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
 # - At least, libquadmath is available on:
 #   - i*86
 #   - x86_64
+#   - powerpc64(le) since gcc 8.1
 # - When available, libquadmath requires wchar support.
 config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc64 || BR2_powerpc64le
 
 endmenu
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6d91cb5d1e..75ea8dc23d 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -143,7 +143,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
-# fortran needs quadmath on x86 and x86_64
+# fortran needs quadmath on x86, x86_64, powerpc64(le).
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
 TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
 endif
-- 
2.25.4
