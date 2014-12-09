From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:49:21 +0100
Subject: [Buildroot] [git commit] package/mpd: enable neighbor discovery
	support
Message-ID: <20141209184955.3B4C67FD52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=761ca24c3bcec7cf7d328c2ce127bca6a3fa5670
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable support for neighbor discovery useful in Samba and UPnP networks.

[Thomas: add dependency on smbclient or upnp plugin, without which the
neighbor discovery support isn't very useful.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |   12 ++++++++++++
 package/mpd/mpd.mk    |    6 ++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 4da9fa5..db77ddf 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -274,6 +274,18 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
+	bool "neighbor discovery support"
+	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || BR2_PACKAGE_MPD_UPNP
+	help
+	  Enable support for neighbor discovery.
+	  This option can be used in conjunction with the smbclient
+	  plugin to provide a list of SMB/CIFS servers or with the
+	  UPnP plugin to provide a list of UPnP servers on the local
+	  network.  The neighbor plugin needs configuration in
+	  mpd.conf. For further information take a look at the MPD
+	  documentation.
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
