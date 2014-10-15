From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 15:18:54 +0200
Subject: [Buildroot] [PATCH v2 8/8] package/mpd: fix zeroconf support
In-Reply-To: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413379134-28918-8-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for zeroconf depends on libdns_sd from avahi. This library is build 
by avahi if avahi-daemon is enabled and dbus is selected.

Checking for symbol BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY instead of 
BR2_PACKAGE_AVAHI_DAEMON ensures that dbus has been selected and therefore 
libdns_sd has been built.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - none
---
 package/mpd/mpd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3370bc7..a0d582c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -13,7 +13,9 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 
 # Some options need an explicit --disable or --enable
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+
+# Zeroconf support depends on libdns_sd from avahi.
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 MPD_DEPENDENCIES += avahi
 else
 MPD_CONF_OPTS += --with-zeroconf=no
-- 
2.1.2
