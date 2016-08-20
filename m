From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:39:54 +0200
Subject: [Buildroot] [git commit branch/next] gcc: fix gcc version
	dependencies for the PowerPC64/musl exclusion
Message-ID: <20160820203958.38B688211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62504125f88200e01fc633a1dd2f68ad50489b1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In commit
5ab751ca44e9da6f406876ff582b3a813056b0d4 ("toolchain-buildroot: allow to
build ppc64(le) musl toolchains"), support for building a musl toolchain
for ppc64(le) was added. Since this support only works with gcc 6, some
additional dependencies have been added to the older gcc versions so
that they cannot be selected on ppc64(le)/musl.

Unfortunately, the expression of the dependency was wrong, and leads to
those older gcc versions being non-selectable if you're not using
musl. Indeed, the dependencies look like this:

  depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL

So as soon as you're not using musl, BR2_TOOLCHAIN_USES_MUSL is false,
so the entire condition is false, and the gcc version is not available.

Due to this, only gcc 6.x can be selected currently with uclibc or
glibc, which is clearly not the intended behavior.

This commit reworks those dependencies to:

  depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))

which more clearly expresses what we want:

 "We don't want to (have a toolchain that uses musl and (be building
  either for PPC64 or PPC64le))"

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4d02931..37728e0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,7 +31,7 @@ choice
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl ppc64 unsupported
-		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		select BR2_GCC_NEEDS_MPC
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
@@ -49,7 +49,7 @@ choice
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl ppc64 unsupported
-		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -71,7 +71,7 @@ choice
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# musl ppc64 unsupported
-		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
@@ -82,7 +82,7 @@ choice
 		# Broken or unsupported architectures
 		depends on !BR2_arc && !BR2_bfin
 		# musl ppc64 unsupported
-		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
