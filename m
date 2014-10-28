From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:52:00 +0100
Subject: [Buildroot] [git commit] mpd: add explicit upnp support option
Message-ID: <20141028175205.8AF56B1C8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee3b9d9c6cf2ca2c51242ce5474fd023dc84bc8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    8 ++++++++
 package/mpd/mpd.mk    |    7 +++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index ed0df7f..ac9ca95 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -265,6 +265,14 @@ config BR2_PACKAGE_MPD_TCP
 
 	  You want this on if mpd and the client(s) work
 	  on different machines (the usual scenario).
+
+config BR2_PACKAGE_MPD_UPNP
+	bool "UPnp"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  Enable mpd UPnP client support.
+
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b3ff6f5..d7b912b 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -199,6 +199,13 @@ else
 MPD_CONF_OPTS += --disable-twolame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
+MPD_DEPENDENCIES += expat libupnp
+MPD_CONF_OPTS += --enable-upnp
+else
+MPD_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
 MPD_CONF_OPTS += --enable-vorbis --enable-vorbis-encoder
