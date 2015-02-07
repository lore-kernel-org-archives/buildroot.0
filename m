From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:25 +0100
Subject: [Buildroot] [PATCH 09/11 v7] package/libcec: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <c4b88cd2fab54f52277535427e3d788a7a192f53.1423317174.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec is happy enough with just a libudev, which it uses to
enumerate CEC devices, and does not require a udev daemon.

Propagate the new dependency to XBMC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Changes v5 -> v6:
  - tweak comment for when libcec is not available (with help from Bernd)
---
 package/kodi/Config.in   | 6 +++---
 package/libcec/Config.in | 5 +++--
 package/libcec/libcec.mk | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5141629..7d4c483 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -160,14 +160,14 @@ comment "rsxs needs an OpenGL backend"
 config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_STATIC_LIBS # libcec
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want Kodi to support HDMI CEC.
 
-comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
+comment "hdmi cec support needs a toolchain w/ dynamic library, libudev"
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_LIBUDEV
 
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index e5fa9c8..69e66c0 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "libcec needs a libudev provider and a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8bdc9ea..f31f534 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -18,8 +18,8 @@ ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBCEC_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBCEC_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-- 
1.9.1
