From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 12 Apr 2017 23:09:01 +0200
Subject: [Buildroot] [PATCH] gcc: Fix build failure related to -fPIC for
 x86_64 -> i686 builds
Message-ID: <mailman.0.1492031512.22514.buildroot@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch, I cannot build the toolchain (both host-gcc-initial
and -final) on Gentoo's amd64 using GCC 4.9.3:

  /usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/../../../../x86_64-pc-linux-gnu/bin/ld:
  gcov.o: relocation R_X86_64_32 against `.rodata.str1.8' can not
  be used when making a shared object; recompile with -fPIC

According to the GCC mailing list, a similar problem [1] related to
libgccjit was fixed by passing --enable-host-shared. My failure doesn't
appear to have anything in common with libgccjit, but that configure
flag fixed my build as well.

I wonder if we actually need gcov in the first stage of a GCC build...

[1] https://gcc.gnu.org/ml/gcc-help/2016-03/msg00026.html

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/gcc/gcc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b52f945..1e760d0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -92,6 +92,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
+	--enable-host-shared \
 	--with-gmp=$(HOST_DIR)/usr \
 	--with-mpc=$(HOST_DIR)/usr \
 	--with-mpfr=$(HOST_DIR)/usr \
-- 
2.10.2
