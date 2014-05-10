From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 15:32:26 +0200
Subject: [Buildroot] [PATCH 1/1] xbmc needs IPv6 support
In-Reply-To: <1399728746-6490-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399728746-6490-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399728746-6490-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes these compilation errors:

libavformat/udp.c: In function 'udp_join_multicast_group':
libavformat/udp.c:162:46: error: 'IPV6_JOIN_GROUP' undeclared (first use in this function)
libavformat/udp.c:162:46: note: each undeclared identifier is reported only once for each function it appears in
libavformat/udp.c: In function 'udp_leave_multicast_group':

Network.cpp: In Funktion ?int CreateTCPServerSocket(int, bool, int, const char*)?:
Network.cpp:458:40: Fehler: ?IPV6_V6ONLY? wurde in diesem G?ltigkeitsbereich nicht definiert
Network.cpp:476:23: Fehler: ?in6addr_loopback? wurde in diesem G?ltigkeitsbereich nicht definiert
Network.cpp:478:23: Fehler: ?in6addr_any? wurde in diesem G?ltigkeitsbereich nicht definiert

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index cbf1fa9..03880a4 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -1,6 +1,6 @@
-comment "xbmc needs a toolchain w/ C++, largefile, threads, wchar"
+comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "xbmc needs an OpenGL backend"
 	depends on (!BR2_arm && (BR2_i386 || BR2_x86_64)) && \
@@ -73,6 +73,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_HAS_LIBGL || (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
@@ -155,15 +156,11 @@ config BR2_PACKAGE_XBMC_RTMPDUMP
 
 config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
 	bool "shairport"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
-comment "shairport support needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_XBMC_LIBSMBCLIENT
 	bool "samba"
 	select BR2_PACKAGE_SAMBA
-- 
1.7.10.4
