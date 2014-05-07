From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 May 2014 22:09:56 +0200
Subject: [Buildroot] [PATCH v5 22/32] xbmc: Allow compilation with uClibc
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399493406-7247-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index dfbd474..9ca7620 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -1,11 +1,10 @@
-comment "xbmc needs an (e)glibc toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "xbmc needs a toolchain w/ C++, largefile, threads, wchar"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "xbmc requires an OpenGL ES and EGL backend"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -57,10 +56,13 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  XBMC is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
@@ -126,11 +128,15 @@ config BR2_PACKAGE_XBMC_RTMPDUMP
 
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
