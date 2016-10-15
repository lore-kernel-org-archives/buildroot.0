From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add support for I6400 cores
Message-ID: <20161015112248.D652D81F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea52e3d01a7b79a80b635308422a9df042394008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-march=i6400 support starts from GCC-6, so disable previous versions
when selecting this core.

Note that I6400 implies a MIPS R6 CPU, and some GCC versions are already
disabled for R6, so we don't need to disable those ones for I6400 as
well.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 15b23db..f07df7d 100644
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
