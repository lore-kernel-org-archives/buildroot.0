From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Jul 2016 13:05:39 +0100
Subject: [Buildroot] [PATCH v2] openblas: P5600 and I6400 cores only
	available for Codescape toolchains
Message-ID: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These two MIPS cores are built with MSA support (-mmsa) which is
currently in GCC trunk. The only toolchains that support it right now
are Codescape MTI and Codescape IMG from Imagination Technologies.

Fixes:
  http://autobuild.buildroot.net/results/af5/af5e9f10287aaf9b9be6228ad7d12b2d926f8051/
  http://autobuild.buildroot.net/results/b20/b201e4072b0b634d5ac86781aee24c698f88d689/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Amend commit log: s/Imagiation/Imagination/

 package/openblas/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 51afaec..e79b611 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -26,9 +26,11 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC970"       if BR2_powerpc_970
 	default "PPC440"       if BR2_powerpc_440
 	default "PPC440FP2"    if BR2_powerpc_440fp
-	default "P5600"        if BR2_mips_32r2
+	# P5600 is built with MSA support which is only available in Codescape toolchains
+	default "P5600"        if BR2_mips_32r2 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	default "SICORTEX"     if BR2_mips_64
-	default "I6400"        if BR2_mips_64r6
+	# I6400 is built with MSA support which is only available in Codescape toolchains
+	default "I6400"        if BR2_mips_64r6 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	default "SPARC"        if BR2_sparc
 	default "CORTEXA15"    if BR2_cortex_a15
 	default "CORTEXA9"     if BR2_cortex_a9
-- 
2.7.3
