From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  8 Dec 2014 23:44:53 +0100
Subject: [Buildroot] [PATCH 5/6] package/mpd: enable neighbor discovery
	support
In-Reply-To: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418078694-26331-5-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable support for neighbor discovery useful in Samba and UPnP networks.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 10 ++++++++++
 package/mpd/mpd.mk    |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 901902b..57ed434 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -269,6 +269,16 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
+	bool "neighbor discovery support"
+	help
+	  Enable support for neighbor discovery.
+	  This option may be used in conjunction with the plugin samba to
+	  provide a list of SMB/CIFS servers or with the plugin UPnP to provide
+	  a list of UPnP servers on the local network.
+	  The neighbor plugin needs configuration in mpd.conf. For further
+	  information take a look at the MPD documentation.
+
 config BR2_PACKAGE_MPD_TCP
 	bool "tcp sockets"
 	default y
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3be2ae5..85bbe8b 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -162,6 +162,12 @@ else
 MPD_CONF_OPTS += --disable-mpc
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT),y)
+MPD_CONF_OPTS += --enable-neighbor-plugins
+else
+MPD_CONF_OPTS += --disable-neighbor-plugins
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus libogg
 MPD_CONF_OPTS += --enable-opus
-- 
2.1.3
