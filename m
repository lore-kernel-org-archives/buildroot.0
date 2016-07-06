From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:43:31 +0200
Subject: [Buildroot] [git commit] package/jemalloc: filter on suported
	architectures
Message-ID: <20160706204415.8700D7FA4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3baf996c6a2b57ffaaa4627c1e04ff67c30e9754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jemalloc has a hard-coded list of supported architectures, which it uses
to define the minimum alignment for allocations. It whines at build time
(not at configure time) when it does not know that alignment.

Fix that by making jemalloc depend on the known-supported architectures.

Fixes:
    http://autobuild.buildroot.org/results/674/674b6022f9a403528a758c0785656d2bda79e0a9/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - split ARM and AArch64 dependencies on two lines
 - for SuperH, instead of using BR2_sh && !BR2_sh2, explicitly list the
   SH4 variants, since only SH4 is supported by jemalloc.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jemalloc/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index ff74387..a9999ba 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -1,5 +1,16 @@
+config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel
+	default y if BR2_sparc64
+	default y if BR2_powerpc
+	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
+
 config BR2_PACKAGE_JEMALLOC
 	bool "jemalloc"
+	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	help
 	 This library providing a malloc(3) implementation that emphasizes
@@ -8,4 +19,5 @@ config BR2_PACKAGE_JEMALLOC
 	 http://www.canonware.com/jemalloc/
 
 comment "jemalloc needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
