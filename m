From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:54:33 +0100
Subject: [Buildroot] [git commit] package/mpd: fix zeroconf support
Message-ID: <20141027220850.C1C49B1AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7c072aee5cd3bcf5fe162a69094dc9282648056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to explicitly enable Avahi support in MPD.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |   14 ++++++++++++++
 package/mpd/mpd.mk    |    5 ++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 98ac2b6..ed0df7f 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -243,6 +243,20 @@ comment "pulseaudio support needs a toolchain w/ largefile"
 
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
