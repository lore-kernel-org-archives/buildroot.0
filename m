From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 19:08:47 +0200
Subject: [Buildroot] [git commit] package/fuse-overlayfs: needs headers >=
 3.15
Message-ID: <20200713170507.2F196814F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6c2413829c1d4734d19103a33e808d34ffc066c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fuse-overlayfs unconditionally uses SYS_renameat2 since version 0.2 and
https://github.com/containers/fuse-overlayfs/commit/616119093a5d37bf201a7b7970eeb5f7ba32de22
which is not available until kernel 3.15 and
https://github.com/torvalds/linux/commit/5fb6b953bb7aa86a9c8ea760934982cedc45c52b

Fixes:
 - http://autobuild.buildroot.org/results/3c97e25c69ab949e51f04b5d0134bc4b4059982d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fuse-overlayfs/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/Config.in b/package/fuse-overlayfs/Config.in
index a13cdd9e93..30a3372cbd 100644
--- a/package/fuse-overlayfs/Config.in
+++ b/package/fuse-overlayfs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FUSE_OVERLAYFS
 	depends on BR2_USE_MMU # libfuse3
 	depends on !BR2_STATIC_LIBS # libfuse3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse3
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	select BR2_PACKAGE_LIBFUSE3
 	help
 	  FUSE-overlayfs is an implementation of overlay+shiftfs in
@@ -10,6 +11,7 @@ config BR2_PACKAGE_FUSE_OVERLAYFS
 
 	  http://github.com/containers/fuse-overlayfs
 
-comment "fuse-overlayfs needs a toolchain w/ threads, dynamic library"
+comment "fuse-overlayfs needs a toolchain w/ threads, dynamic library, headers >= 3.15"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
