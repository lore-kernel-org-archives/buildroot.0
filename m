From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:57 +0100
Subject: [Buildroot] [PATCH 11/13] MIPS: add support for I6400 cores
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-12-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-march=i6400 support starts from GCC-6, so disable previous versions
when selecting this core.

Note that I6400 implies a MIPS R6 CPU, and some GCC versions are already
disabled for R6, so we don't need to disable those ones for I6400 as
well.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips        | 5 +++++
 package/gcc/Config.in.host | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 3881909..73be3c9 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -71,6 +71,10 @@ config BR2_mips_64r6
 	bool "Generic MIPS64R6"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+config BR2_mips_i6400
+	bool "I6400"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R6
 endchoice
 
 
@@ -123,6 +127,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
 	default "mips64r6"	if BR2_mips_64r6
+	default "i6400"		if BR2_mips_i6400
 
 config BR2_MIPS_OABI32
 	bool
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4128dce..3603670 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -101,7 +101,7 @@ choice
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
 		depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && \
-			!BR2_mips_m5101
+			!BR2_mips_m5101 && !BR2_mips_i6400
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
-- 
2.10.0
