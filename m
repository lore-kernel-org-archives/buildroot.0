From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 00:29:03 +0200
Subject: [Buildroot] [PATCH v3 8/8] package/mpd: fix zeroconf support
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413498543-643-8-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option to explicitly enable Avahi support in MPD.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v2 -> v3:
  - add Config.in option instead of checking against 
    BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
  - change commit log
Changes v1 -> v2:
  - none
---
 package/mpd/Config.in | 14 ++++++++++++++
 package/mpd/mpd.mk    |  5 ++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 73bfaf7..2f01854 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -240,6 +240,20 @@ comment "pulseaudio support needs a toolchain w/ largefile"
 
 comment "Miscellaneous plugins"
 
+config BR2_PACKAGE_MPD_AVAHI_SUPPORT
+	bool "avahi (zeroconf) support"
+	depends on !BR2_PREFER_STATIC_LIB # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
+	help
+	  Enable Avahi (zeroconf) support.
+	  Select this for multicast DNS/DNS-SD service discovery support. This allows
+	  MPD to publish service information on a local network.
+
+comment "avahi support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_MPD_TCP
 	bool "tcp sockets"
 	default y
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4eca183..ae37b14 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -13,8 +13,11 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 
 # Some options need an explicit --disable or --enable
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+
+# Zeroconf support depends on libdns_sd from avahi.
+ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
 MPD_DEPENDENCIES += avahi
+MPD_CONF_OPTS += --with-zeroconf=avahi
 else
 MPD_CONF_OPTS += --with-zeroconf=no
 endif
-- 
2.1.2
