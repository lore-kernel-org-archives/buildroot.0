From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Fri, 13 Nov 2015 19:26:40 +0900
Subject: [Buildroot] [PATCH v2] package/gauche: exclude build on archs not
	boehm gc ported
Message-ID: <201511131026.tADAQef8020593@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch limits gauch build only on architectures boehm gc is ported.

Will fix:
http://autobuild.buildroot.org/results/368/3681948013fcd39cc80b690b880924421e429c80//
http://autobuild.buildroot.org/results/ba7/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5//
http://autobuild.buildroot.org/results/1cb/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc//
http://autobuild.buildroot.org/results/8af/8afb36606eabdc6ae6e65a28a11877af39f9a7e0//

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
Change v1->v2:
- add depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS on comment
---
diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index 0720672..b574231 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GAUCHE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	help
 	  Gauche is an R7RS Scheme implementation developed to be a
 	  handy script interpreter, which allows programmers and
@@ -13,7 +14,16 @@ config BR2_PACKAGE_GAUCHE
 
 	  http://practical-scheme.net/gauche/
 
+config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_sparc || \
+		BR2_sparc64 || BR2_x86_64
+
 comment "gauche needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
============================================================
    Hiroshi Kawashima
