From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:18:56 +0200
Subject: [Buildroot] [git commit] toolchain/buildroot: not available for a
	few mips cores
Message-ID: <20170829211143.4217480DBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eaa6460bad197daf1d8d3318aff8e187fe36301
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1b974425 (MIPS: add support for M6201 cores) explained that the
new core was not supported by upstream gcc, and as of gcc-8-trunk
that's still the case.

Ditto for 3cfbeb83 (MIPS: add support for P6600 cores).

This means that we currently allow to build an internal tolchain for
those cores, yet we have no suitable gcc version.

Disable the internal backend in this case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 7 +------
 toolchain/Config.in        | 2 ++
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6f82fe0..ec7b692 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -50,8 +50,7 @@ config BR2_GCC_VERSION_5_X
 	# musl ppc64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
-		!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && !BR2_mips_i6400
 	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
@@ -61,8 +60,6 @@ config BR2_GCC_VERSION_6_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
-	# Unsupported MIPS cores
-	depends on !BR2_mips_m6250 && !BR2_mips_p6600
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_GCC_VERSION_7_X
@@ -70,8 +67,6 @@ config BR2_GCC_VERSION_7_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
-	# Unsupported MIPS cores
-	depends on !BR2_mips_m6250 && !BR2_mips_p6600
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 endchoice
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 15ee335..584d053 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,6 +48,8 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf608
 	depends on !BR2_bf609
 	depends on !BR2_csky
+	depends on !BR2_mips_m6250
+	depends on !BR2_mips_p6600
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
