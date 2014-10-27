From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:51:24 +0100
Subject: [Buildroot] [git commit] package/mpd: enable support for
	libsmbclient
Message-ID: <20141027220850.A401BB1AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17ae9a4f0a900d44a050ab15dd0e412dcdbfa567
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    8 ++++++++
 package/mpd/mpd.mk    |    7 +++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e62a37d..09df556 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -182,6 +182,14 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBSMBCLIENT
+	bool "samba"
+	depends on !BR2_nios2 # samba
+	select BR2_PACKAGE_SAMBA
+	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	help
+	  Enable Samba support.
+
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "soundcloud"
 	select BR2_PACKAGE_YAJL
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 92d7292..ecd2a77 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -90,6 +90,13 @@ else
 MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
+MPD_DEPENDENCIES += samba
+MPD_CONF_OPTS += --enable-smbclient
+else
+MPD_CONF_OPTS += --disable-smbclient
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
 MPD_CONF_OPTS += --enable-lsr
