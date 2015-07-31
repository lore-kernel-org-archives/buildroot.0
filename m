From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Jul 2015 22:25:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/libmicrohttpd: mark as broken on
	Nios II, infamous _gp issue
Message-ID: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/76f/76f838b2b33311897f3c2ce82a65f3b73af2c046/

Propagate reverse dependency to janus-gateway. I did not propagate the
reverse dependency to kodi, ola and systemd because they are not
available for nios.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/janus-gateway/Config.in | 4 ++++
 package/libmicrohttpd/Config.in | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 035ee6c..cafad94 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_JANUS_GATEWAY
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # libmicrohttpd
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libmicrohttpd
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
@@ -20,3 +22,5 @@ config BR2_PACKAGE_JANUS_GATEWAY
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index ec0b715..d9e6493 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
@@ -24,3 +27,5 @@ endif
 
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-- 
2.1.4
