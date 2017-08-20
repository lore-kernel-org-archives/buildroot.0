From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Aug 2017 16:41:54 +0200
Subject: [Buildroot] [PATCH] glibc: needs kernel headers >= 4.5 on mips(64)
Message-ID: <20170820144154.15347-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.23 [1]:
sysdeps/unix/sysv/linux/mips/configure.ac
[...]
if test -z "$arch_minimum_kernel"; then
  if test x$libc_cv_mips_nan2008 = xyes; then
    arch_minimum_kernel=4.5.0
  fi
fi

This mean that if nan2008 support is requested (i.e BR2_MIPS_NAN_2008
in Buildroot) the minimum kernel headers version is 4.5.0 (not 3.2.0).

To simplify the dependancy handling in Buildroot we add this dependency
for all mips(64), even if BR2_MIPS_NAN_2008 is not selected.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=d5f2798a0ac9d5ad8ad7a506a2f840035135e2d2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---

This is for master.

I tried to use BR2_MIPS_NAN_2008 but it trigger a circular dependency in Kconfig.

 toolchain/toolchain-buildroot/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f47001f..967da1a 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -43,8 +43,9 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
 	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
-		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
-		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
+		   BR2_aarch64_be  || BR2_i386       || \
+		   ((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && \
+		   BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5) || \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
 		   BR2_microblaze || BR2_nios2
@@ -65,6 +66,11 @@ comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+# glibc require kernel headers >= 4.5 if nan2008 support is selected.
+comment "glibc on mips(64) needs a toolchain w/ headers >= 4.5"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
-- 
2.9.5
