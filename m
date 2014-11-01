From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat,  1 Nov 2014 01:10:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: enable libavahi-client
	support
Message-ID: <1414800623-7721-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages needs libavahi-client support which is autobuild by avahi if
avahi-daemon and dbus is selected. To select libavahi-client explicitly makes
this dependency more obvious for dependent packages.

libdns_sd is only build by avahi if libavahi-client is present (and 
`--enable-compat-libdns_sd` is set as configure option). So it's safe to 
depend on libavahi-client instead of avahi-daemon.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/avahi/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index b52cc78..56b372e 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -35,11 +35,17 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
 
-config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
-	bool "libdns_sd compatibility (Bonjour)"
+config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
+	bool "libavahi-client"
 	depends on BR2_PACKAGE_AVAHI_DAEMON
 	select BR2_PACKAGE_DBUS
 	help
+	  Enable the Avahi client library.
+
+config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
+	bool "libdns_sd compatibility (Bonjour)"
+	depends on BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
+	help
 	  Enable the libdns_sd (Bonjour) compatibility library support
 	  for legacy applications.
 
-- 
2.1.3
