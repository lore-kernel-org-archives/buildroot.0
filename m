From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 23:02:56 +0200
Subject: [Buildroot] [git commit] package/libgtk3: needs gcc & host gcc >=
 4.8
Message-ID: <20190811210020.22D918D1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a9eda8b38e451e3d22eea7227fd12f8b1a1dd87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8 and host
gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk3/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 12e64707bd..72737d6e2f 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,7 +1,9 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
@@ -17,6 +19,9 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
