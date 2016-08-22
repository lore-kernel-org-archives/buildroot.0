From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 23:10:09 +0200
Subject: [Buildroot] [git commit branch/next] musl: enable mips64 support
Message-ID: <20160822214619.D4CE981EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=721e1c1e9ca13f37e3d6aafb0a570fd6fb67fbea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for mips64, which is available since musl 1.1.15.

Only gcc 6.x has required support for it. Tested variations of
little/big endian and hard/soft float.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host              | 6 ++++++
 toolchain/toolchain-buildroot/Config.in | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 37728e0..7262714 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -50,6 +50,8 @@ choice
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		# musl mips64 unsupported
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -72,6 +74,8 @@ choice
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		# musl mips64 unsupported
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
@@ -83,6 +87,8 @@ choice
 		depends on !BR2_arc && !BR2_bfin
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
+		# musl mips64 unsupported
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 78cac14..9fdfb42 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -68,9 +68,10 @@ comment "glibc only available with shared lib support"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_powerpc64  || BR2_powerpc64le || BR2_sh || BR2_x86_64
+	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
+		   BR2_microblaze || BR2_mips    || BR2_mipsel    || BR2_mips64 || \
+		   BR2_mips64el   || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		   BR2_sh         || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
