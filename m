From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:07:57 +0100
Subject: [Buildroot] [PATCH 11/21] gauche: disable on SPARC(64),
	remove atomics dependency
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gauche does not build on sparc64, it fails with:

  No rule to make target 'sparc_mach_dep.lo', needed by 'libgc.la'

On Sparc, it first fails with the usual "membar" assembler issue which
comes from gauche's internal version of libatomic_ops. However, even
passing -DAO_NO_SPARC_V9 like we do for libatomic_ops is not
sufficient, as we fall into the same build problem as on sparc64.

Consequently, this commit disables the gauche package on the sparc and
sparc64 architectures.

Since it uses its own libatomic_ops copy, and libatomic_ops does not
have any dependency on atomic built-ins, we also remove the
BR2_ARCH_HAS_ATOMICS dependency. It was originally added to prevent
gauche from being built on sparc, but this will no longer happen.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index fd0617a..3ca012d 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -4,14 +4,12 @@ config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k || \
 		BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_sparc || \
-		BR2_sparc64 || BR2_x86_64
+		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_x86_64
 
 config BR2_PACKAGE_GAUCHE
 	bool "gauche"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -26,6 +24,5 @@ config BR2_PACKAGE_GAUCHE
 
 comment "gauche needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.6.4
