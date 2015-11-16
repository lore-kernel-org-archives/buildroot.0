From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 22:12:20 +0100
Subject: [Buildroot] [git commit] package/gauche: exclude build on archs not
	boehm gc ported
Message-ID: <20151116220222.B0E0D81E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f47facd5ef57fd790f7751ee87b671c007953c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch limits gauch build only on architectures boehm gc is ported.

Will fix:
http://autobuild.buildroot.org/results/368/3681948013fcd39cc80b690b880924421e429c80//
http://autobuild.buildroot.org/results/ba7/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5//
http://autobuild.buildroot.org/results/1cb/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc//
http://autobuild.buildroot.org/results/8af/8afb36606eabdc6ae6e65a28a11877af39f9a7e0//

[Thomas:
 - add comment explaining where the architecture dependency is coming
   from, as suggested by Arnout.
 - move the definition of BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS to the
   beginning of the Config.in file, to be consistent with what we do
   in other packages.]

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/Config.in |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index 0720672..54a0be2 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -1,8 +1,18 @@
+# Architecture dependency from the bundled bdwgc.
+config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_sparc || \
+		BR2_sparc64 || BR2_x86_64
+
 config BR2_PACKAGE_GAUCHE
 	bool "gauche"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	help
 	  Gauche is an R7RS Scheme implementation developed to be a
 	  handy script interpreter, which allows programmers and
@@ -16,4 +26,5 @@ config BR2_PACKAGE_GAUCHE
 comment "gauche needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
