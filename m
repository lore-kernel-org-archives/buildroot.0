From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add support for P6600 cores
Message-ID: <20161015112248.DB1557FDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cfbeb8363e61d7652e9f67d7dffc225d9261b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-march=p6600 is not yet supported in GCC upstream, so disabling all
versions when selecting this core.

Note that P6600 implies a MIPS R6 CPU, and some GCC versions are already
disabled for R6, so we don't need to disable those ones for P6600 as
well.

The external Codescape IMG GNU Linux Toolchain has support for this
core.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips        | 5 +++++
 package/gcc/Config.in.host | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 897c944..f7bfa21 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -79,6 +79,10 @@ config BR2_mips_i6400
 	bool "I6400"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+config BR2_mips_p6600
+	bool "P6600"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R6
 endchoice
 
 
@@ -133,6 +137,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips64r5"	if BR2_mips_64r5
 	default "mips64r6"	if BR2_mips_64r6
 	default "i6400"		if BR2_mips_i6400
+	default "p6600"		if BR2_mips_p6600
 
 config BR2_MIPS_OABI32
 	bool
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f07df7d..2eb6133 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -101,7 +101,7 @@ choice
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
 		depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && \
-			!BR2_mips_m5101 && !BR2_mips_i6400
+			!BR2_mips_m5101 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
@@ -112,6 +112,8 @@ choice
 		bool "gcc 6.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
+		# Unsupported MIPS cores
+		depends on !BR2_mips_p6600
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
