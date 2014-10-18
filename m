From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 19:41:31 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/libva-intel-driver: Do not
	depend on xorg
In-Reply-To: <1413654091-2532-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413654091-2532-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413654091-2532-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reverts
http://git.buildroot.net/buildroot/commit/package/libva-intel-driver/Config.in?id=062bacfa67688b2747412a30ddeb996449d1c6df

By removing the xorg dependency of libpciaccess the libdrm package, and
therefore also libva-intel-driver, does not depend on xorg any longer.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: no changes
v2: no changes

 package/libva-intel-driver/Config.in |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

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
-- 
1.7.10.4
