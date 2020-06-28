From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Jun 2020 16:26:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/fluidsynth: needs dynamic library
Message-ID: <20200628142647.742636-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

applications, such as mpd, fail to build statically with fluidsynth
because fluidsynth does not fill Libs.Private in their pkg-config file

Because fluidsynth is a cmake-package with many dependencies, it is not
easy to fix so just add a dynamic library dependency

Fixes:
 - http://autobuild.buildroot.org/results/ec9dd2903359b9bf6b15c8cb69e732f8cb6c4d39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index c1cb923489..4fcbfa7411 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUIDSYNTH
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FluidSynth is a real-time software synthesizer based on the
@@ -115,6 +116,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
 
 endif # BR2_PACKAGE_FLUIDSYNTH
 
-comment "fluidsynth needs a toolchain w/ threads, wchar"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
2.26.2
