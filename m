From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:16 -0700
Subject: [Buildroot] [PATCH 08/15 v6] package/libcec: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <6c613e278402b282b6f7f4a720291aba30d5bcdd.1414442699.git.yann.morin.1998@free.fr>
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
 package/libcec/Config.in | 5 +++--
 package/libcec/libcec.mk | 4 ++--
 package/xbmc/Config.in   | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 8097472..fb9f388 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "libcec needs a libudev provider and a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB || \
+		!BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 5a889b9..512004c 100644
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
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index a7337d5..ed0b850 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -156,14 +156,14 @@ comment "rsxs needs an OpenGL backend"
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want XBMC to support HDMI CEC.
 
-comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
+comment "hdmi cec support needs a toolchain w/ dynamic library, libudev"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_LIBUDEV
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "web server"
-- 
1.9.1
