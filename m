From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:35 +0200
Subject: [Buildroot] [PATCH 12/12 v8] package/libinput: only needs libudev,
	not udev daemon
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <ed0dbe6a8b6bc7dfcfc5e665fe07f9360c2e7723.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libinput/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index f7793df..58e70c8 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
+	depends on BR2_USE_MMU # libudev <- eudev/systemd
+	depends on BR2_USE_WCHAR # libudev <- eudev/systemd
+	depends on !BR2_STATIC_LIBS # libudev <- eudev/systemd
 	depends on BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
+	select BR2_PACKAGE_LIBUDEV
 	help
 	  libinput is a library to handle input devices in Wayland
 	  compositors and to provide a generic X.Org input driver.
@@ -14,5 +17,6 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
-comment "libinput needs udev /dev management and a toolchain w/ locale"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_ENABLE_LOCALE
+comment "libinput needs a toolchain w/ locale, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-- 
2.7.4
