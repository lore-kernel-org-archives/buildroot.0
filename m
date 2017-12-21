From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 22 Dec 2017 00:19:32 +0100
Subject: [Buildroot] [PATCH] libostree: make sure libavahi-client is built
Message-ID: <20171221231932.31913-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avahi support also needs libavahi-client, which is built by avahi if avahi-daemon
and dbus is selected.

Fixes:
http://autobuild.buildroot.net/results/1edfb60add17945eabc557e1dbfb08a0ba466df9/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 612c284870..f0aeb8d72a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -27,9 +27,13 @@ else
 LIBOSTREE_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
+# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
+# option yet, use the avahi-daemon and dbus config symbols to check for
+# libavahi-client.
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 LIBOSTREE_CONF_OPTS += --with-avahi
-LIBOSTREE_DEPENDENCIES += avahi
+LIBOSTREE_DEPENDENCIES += avahi dbus
 else
 LIBOSTREE_CONF_OPTS += --without-avahi
 endif
-- 
2.15.1
