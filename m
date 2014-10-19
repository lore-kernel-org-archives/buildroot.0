From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:10:03 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: Do not depend
	on xorg
Message-ID: <20141019101010.2A01AADFEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14387bb1d049b1190719b3b38ba79e9afcf0d925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reverts
http://git.buildroot.net/buildroot/commit/package/libva-intel-driver/Config.in?id=062bacfa67688b2747412a30ddeb996449d1c6df

By removing the xorg dependency of libpciaccess the libdrm package, and
therefore also libva-intel-driver, does not depend on xorg any longer.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/Config.in |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index cac2fed..a0f397b 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -3,11 +3,10 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_XORG7 # libdrm intel
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
 	depends on !BR2_PREFER_STATIC_LIB # libva
@@ -20,7 +19,3 @@ comment "libva intel driver needs a toolchain w/ largefile, threads, dynamic lib
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_PREFER_STATIC_LIB
 	depends on BR2_i386 || BR2_x86_64
-
-comment "libva intel driver needs X.org"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_XORG7
