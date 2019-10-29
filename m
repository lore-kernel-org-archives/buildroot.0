From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 10:57:36 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: -fstack-protector-all needs PIE
Message-ID: <20191029095736.16586-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jpeg-turbo fails to build with BR2_SSP_ALL on:

/data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: ../CMakeFiles/simd.dir/jsimd_none.c.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `__stack_chk_guard@@GLIBC_2.17' can not be used when making a shared object; recompile with -fPIC

Fix this issue by selecting BR2_PIC_PIE (if possible) with BR2_SSP_ALL

Fixes:
 - http://autobuild.buildroot.net/results/51459f3f26aa2e2a038ee717548266aaec05bafc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in b/Config.in
index 010b0774e3..3efa171405 100644
--- a/Config.in
+++ b/Config.in
@@ -751,11 +751,18 @@ config BR2_SSP_STRONG
 
 config BR2_SSP_ALL
 	bool "-fstack-protector-all"
+	depends on BR2_SHARED_LIBS
+	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
+	select BR2_PIC_PIE
 	help
 	  Like -fstack-protector except that all functions are
 	  protected. This option might have a significant performance
 	  impact on the compiled binaries.
 
+comment "-fstack-protector-all needs a toolchain w/ PIE"
+	depends on BR2_SHARED_LIBS
+	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
+
 endchoice
 
 config BR2_SSP_OPTION
-- 
2.23.0
