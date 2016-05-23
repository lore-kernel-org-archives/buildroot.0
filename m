From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 12:31:51 +0100
Subject: [Buildroot] [PATCH] valgrind: disable for MIPS soft-float
Message-ID: <1464003111-59011-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated here [1], recent changes on the MIPS binutils sources have
made it necessary for GCC to pass the -msoft-float to the assembler. Due
to that, valgrind fails to build for MIPS soft-float when using a
version of binutils >= 2.25 because its using some hard-float
instructions.

However, we cannot just disable it for the soft-float and binutils >=
2.25 combination since external toolchains don't provide information
about the binutils version they use. So, instead, we simply disable it
for soft-float.

1: https://gcc.gnu.org/ml/gcc-patches/2014-08/msg00905.html

Fixes:
  http://autobuild.buildroot.net/results/5f5/5f576c7f8d56058a19ed0e7ff4b1ec620bcafb65/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/valgrind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 21b2608..40e219d 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_VALGRIND
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_x86_64
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Tool for debugging and profiling Linux programs.
 
-- 
2.7.3
