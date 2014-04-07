From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  7 Apr 2014 17:00:34 +0300
Subject: [Buildroot] [PATCH] latencytop: disable static build
Message-ID: <4cc42edb1d6c9e7d6c156bb56fb744ec84ff9ae0.1396879234.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile of latencytop doesn't take static linking into account when
calling pkg-config for glib-2.0. Disable static build of latencytop.

Fixes:
http://autobuild.buildroot.net/results/e62/e62d35bcf7d6c98d0a0348532c2b159affb20e83/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/latencytop/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index b54ef052b47f..9d6e119fa759 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LATENCYTOP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LATENCYTOP
 
 	  http://www.latencytop.org
 
-comment "latencytop needs a toolchain w/ wchar, threads"
+comment "latencytop needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
1.9.1
