From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 Sep 2020 07:41:31 -0500
Subject: [Buildroot] [PATCH] gcc: disable fortran use of libquadmath
Message-ID: <20200911124131.8549-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC package has a default conf option of disabling libquadmath and
the toolchain dependencies selectively enabled it if i386 / x64.

Fixes:
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622

This patch fixes a build failure when (GCC + glibc) is being built for
the IBM Power8 arch and has libgfortran enabled + libquadmath disabled.
The libgfortran has a code condition for __float128 and includes the
quadmath headers. The bug occurs because Power8 has emulated
float128 support. The fix per GCC options is to also set
--disable-libquadmath-support which disables the
__float128/libquadmath support in gcc/fortran and in libgfortran [1].

Another option to fix the build failure was to enable libquadmath for
IBM Power8 (ISA 2.07), however this would be soft float based as the
ISA 3.0+ (Power9) first supports native float128 [2][3].

[1] https://fortran.gcc.gnu.narkive.com/8uSfoKUS/patch-build-pr-46540-add-disable-libquadmath-disable-libquadmath-support
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66382#c7
[3] https://gcc.gnu.org/onlinedocs/gcc/RS_002f6000-and-PowerPC-Options.html

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b834269adc..c04d3b4d5c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -116,7 +116,7 @@ endif
 ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
 HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
 else
-HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
+HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath --disable-libquadmath-support
 endif
 
 # Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
-- 
2.17.1
