From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jun 2016 15:05:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: add optional support for
	libmdnsresponder
In-Reply-To: <1466946336-6741-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466946336-6741-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466946336-6741-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...S.cpp-add-header-to-fix-compile-with-gcc-.patch | 37 ++++++++++++++++++++++
 package/kodi/Config.in                             |  6 ++++
 package/kodi/kodi.mk                               |  7 ++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/kodi/0009-ZeroconfMDNS.cpp-add-header-to-fix-compile-with-gcc-.patch

diff --git a/package/kodi/0009-ZeroconfMDNS.cpp-add-header-to-fix-compile-with-gcc-.patch b/package/kodi/0009-ZeroconfMDNS.cpp-add-header-to-fix-compile-with-gcc-.patch
new file mode 100644
index 0000000..cde8203
--- /dev/null
+++ b/package/kodi/0009-ZeroconfMDNS.cpp-add-header-to-fix-compile-with-gcc-.patch
@@ -0,0 +1,37 @@
+From 97bca0f515db32eb57804370c5fa810c8a1d47dc Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Jun 2016 13:49:05 +0200
+Subject: [PATCH 1/1] ZeroconfMDNS.cpp: add header to fix compile with gcc 4.9
+ & uClibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without the patch compilation fails with
+ZeroconfMDNS.cpp:133:139: error: ?htons? was not declared in this scope
+
+Infos about the toolchain used:
+gcc version 4.9.3 (Buildroot 2016.05-00002-g5dabb45), uClibc-NG 1.0.15
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/10035
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/network/mdns/ZeroconfMDNS.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xbmc/network/mdns/ZeroconfMDNS.cpp b/xbmc/network/mdns/ZeroconfMDNS.cpp
+index 00d02c5..8bfd7df 100644
+--- a/xbmc/network/mdns/ZeroconfMDNS.cpp
++++ b/xbmc/network/mdns/ZeroconfMDNS.cpp
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include "ZeroconfMDNS.h"
++#include <arpa/inet.h>
+ 
+ #include <string>
+ #include <sstream>
+-- 
+2.8.1
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a44ef5a..b9ca403 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -173,6 +173,12 @@ config BR2_PACKAGE_KODI_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
+config BR2_PACKAGE_KODI_MDNSEMBEDDED
+	bool "mDNSEmbedded"
+	select BR2_PACKAGE_LIBMDNSRESPONDER
+	help
+	  Enable mDNSEmbedded support
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 90c50c3..78f55a8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -127,6 +127,13 @@ else
 KODI_CONF_OPTS += --disable-nfs
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_MDNSEMBEDDED),y)
+KODI_DEPENDENCIES += libmdnsresponder
+KODI_CONF_OPTS += --enable-mdnsembedded
+else
+KODI_CONF_OPTS += --disable-mdnsembedded
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_RTMPDUMP),y)
 KODI_DEPENDENCIES += rtmpdump
 KODI_CONF_OPTS += --enable-rtmp
-- 
2.8.1
