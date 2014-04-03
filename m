From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:26 +0200
Subject: [Buildroot] [PATCH v4 31/37] WIP: xbmc: Allow compilation with
	uClibc
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index fc8811e..e0576b6 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -1,11 +1,8 @@
-comment "xbmc needs an (e)glibc toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "xbmc needs a toolchain w/ C++, largefile, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
-comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+comment "xbmc needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL && !BR2_PACKAGE_HAS_OPENGL_EGL && !BR2_PACKAGE_HAS_OPENGL_ES
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -57,10 +54,12 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_LARGEFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_HAS_OPENGL || (BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
 	help
 	  XBMC is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
@@ -92,14 +91,14 @@ config BR2_PACKAGE_XBMC_LIBBLURAY
 
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
-	depends on !BR2_PREFER_STATIC_LIB # libcec
+	depends on !BR2_PREFER_STATIC_LIB || !BR2_USE_WCHAR # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want XBMC to support HDMI CEC.
 
-comment "hdmi cec support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+comment "hdmi cec support needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "web server"
@@ -126,11 +125,15 @@ config BR2_PACKAGE_XBMC_RTMPDUMP
 
 config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
 	bool "shairport"
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
+comment "shairport support needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_XBMC_LIBSMBCLIENT
 	bool "samba"
 	select BR2_PACKAGE_SAMBA
-- 
1.7.10.4
