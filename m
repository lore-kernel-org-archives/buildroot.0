From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:09 +0200
Subject: [Buildroot] [PATCH 09/16] package/minidlna: improve systemd support
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-10-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support running minidlna in system-wide mode using systemd:

1. Set --with-db-path and --with-log-path configure options to make
default minidlna directories comply with FHS.

2. Install suitable minidlna.conf for system-wide mode.

3. Install sysctl.d config file to increase inotify watches count.

4. Install tmpfiles.d config file to mkdir and chmod necessary
directories for minidlna running in system-wide mode.

5. Install sysusers.d config file to create minidlna user when using
systemd.

6. Install minidlna.service for systemd.

Note: User=minidlna should be set in minidlna.service, not in
minidlna.conf, because minidlna is unable to drop privileges correctly
by itself: it does not get any privileges provided by groups of minidlna
user. Systemd drops privileges correctly in that case.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/minidlna/minidlna.conf          | 74 +++++++++++++++++++++++++++++++++
 package/minidlna/minidlna.mk            | 37 +++++++++++++++++
 package/minidlna/minidlna.service       | 12 ++++++
 package/minidlna/minidlna_sysctl.conf   |  1 +
 package/minidlna/minidlna_sysusers.conf |  1 +
 package/minidlna/minidlna_tmpfiles.conf |  3 ++
 6 files changed, 128 insertions(+)
 create mode 100644 package/minidlna/minidlna.conf
 create mode 100644 package/minidlna/minidlna.service
 create mode 100644 package/minidlna/minidlna_sysctl.conf
 create mode 100644 package/minidlna/minidlna_sysusers.conf
 create mode 100644 package/minidlna/minidlna_tmpfiles.conf

diff --git a/package/minidlna/minidlna.conf b/package/minidlna/minidlna.conf
new file mode 100644
index 0000000..9e4fbc9
--- /dev/null
+++ b/package/minidlna/minidlna.conf
@@ -0,0 +1,74 @@
+# port for HTTP (descriptions, SOAP, media transfer) traffic
+port=8200
+
+# network interfaces to serve, comma delimited
+#network_interface=eth0
+
+# set this to the directory you want scanned.
+# * if you want multiple directories, you can have multiple media_dir= lines
+# * if you want to restrict a media_dir to specific content types, you
+#   can prepend the types, followed by a comma, to the directory:
+#   + "A" for audio  (eg. media_dir=A,/home/jmaggard/Music)
+#   + "V" for video  (eg. media_dir=V,/home/jmaggard/Videos)
+#   + "P" for images (eg. media_dir=P,/home/jmaggard/Pictures)
+#   + "PV" for pictures and video (eg. media_dir=PV,/home/jmaggard/digital_camera)
+#media_dir=/home
+
+# set this to merge all media_dir base contents into the root container
+# note: the default is no
+#merge_media_dirs=no
+
+# set this if you want to customize the name that shows up on your clients
+friendly_name=Buildroot DLNA Server
+
+# set this to change the verbosity of the information that is logged
+# each section can use a different level: off, fatal, error, warn, info, or debug
+#log_level=general,artwork,database,inotify,scanner,metadata,http,ssdp,tivo=warn
+
+# this should be a list of file names to check for when searching for album art
+# note: names should be delimited with a forward slash ("/")
+album_art_names=Cover.jpg/cover.jpg/AlbumArtSmall.jpg/albumartsmall.jpg/AlbumArt.jpg/albumart.jpg/Album.jpg/album.jpg/Folder.jpg/folder.jpg/Thumb.jpg/thumb.jpg
+
+# set this to no to disable inotify monitoring to automatically discover new files
+# note: the default is yes
+inotify=yes
+
+# set this to yes to enable support for streaming .jpg and .mp3 files to a TiVo supporting HMO
+enable_tivo=no
+
+# set this to strictly adhere to DLNA standards.
+# * This will allow server-side downscaling of very large JPEG images,
+#   which may hurt JPEG serving performance on (at least) Sony DLNA products.
+strict_dlna=no
+
+# default presentation url is http address on port 80
+#presentation_url=http://www.mylan/index.php
+
+# notify interval in seconds. default is 895 seconds.
+notify_interval=900
+
+# serial and model number the daemon will report to clients
+# in its XML description
+serial=12345678
+model_number=1
+
+# specify the path to the MiniSSDPd socket
+#minissdpdsocket=/var/run/minissdpd.sock
+
+# use different container as root of the tree
+# possible values:
+#   + "." - use standard container (this is the default)
+#   + "B" - "Browse Directory"
+#   + "M" - "Music"
+#   + "V" - "Video"
+#   + "P" - "Pictures"
+#   + Or, you can specify the ObjectID of your desired root container (eg. 1$F for Music/Playlists)
+# if you specify "B" and client device is audio-only then "Music/Folders" will be used as root
+#root_container=.
+
+# always force SortCriteria to this value, regardless of the SortCriteria passed by the client
+#force_sort_criteria=+upnp:class,+upnp:originalTrackNumber,+dc:title
+
+# maximum number of simultaneous connections
+# note: many clients open several simultaneous connections while streaming
+#max_connections=50
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index bcbe5fa..fcc9d06 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -24,4 +24,41 @@ MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
+MINIDLNA_CONF_OPTS += \
+	--with-db-path=/var/cache/minidlna \
+	--with-log-path=/var/log/minidlna
+
+define MINIDLNA_INSTALL_CONF_HOOK
+	$(INSTALL) -D -m 644 package/minidlna/minidlna.conf \
+		$(TARGET_DIR)/etc/minidlna.conf
+endef
+
+define MINIDLNA_INSTALL_SYSUSERS_HOOK
+	$(INSTALL) -D -m 644 package/minidlna/minidlna_sysusers.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/minidlna.conf
+endef
+
+define MINIDLNA_INSTALL_TMPFILES_HOOK
+	$(INSTALL) -D -m 644 package/minidlna/minidlna_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/minidlna.conf
+endef
+
+define MINIDLNA_INSTALL_SYSCTL_HOOK
+	$(INSTALL) -D -m 644 package/minidlna/minidlna_sysctl.conf \
+		$(TARGET_DIR)/usr/lib/sysctl.d/20-minidlna.conf
+endef
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+MINIDLNA_POST_INSTALL_TARGET_HOOKS += \
+	MINIDLNA_INSTALL_CONF_HOOK \
+	MINIDLNA_INSTALL_SYSUSERS_HOOK \
+	MINIDLNA_INSTALL_TMPFILES_HOOK \
+	MINIDLNA_INSTALL_SYSCTL_HOOK
+endif
+
+define MINIDLNA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/minidlna/minidlna.service \
+		$(TARGET_DIR)/lib/systemd/system/minidlna.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/minidlna/minidlna.service b/package/minidlna/minidlna.service
new file mode 100644
index 0000000..45b72f0
--- /dev/null
+++ b/package/minidlna/minidlna.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=minidlna server
+After=network.target
+
+[Service]
+User=minidlna
+Type=forking
+ExecStart=/usr/sbin/minidlnad -P /run/minidlna/minidlna.pid
+PIDFile=/run/minidlna/minidlna.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/minidlna/minidlna_sysctl.conf b/package/minidlna/minidlna_sysctl.conf
new file mode 100644
index 0000000..0745b37
--- /dev/null
+++ b/package/minidlna/minidlna_sysctl.conf
@@ -0,0 +1 @@
+fs.inotify.max_user_watches = 65536
diff --git a/package/minidlna/minidlna_sysusers.conf b/package/minidlna/minidlna_sysusers.conf
new file mode 100644
index 0000000..1dc06f3
--- /dev/null
+++ b/package/minidlna/minidlna_sysusers.conf
@@ -0,0 +1 @@
+u minidlna - "DLNA server"
diff --git a/package/minidlna/minidlna_tmpfiles.conf b/package/minidlna/minidlna_tmpfiles.conf
new file mode 100644
index 0000000..a6e66e7
--- /dev/null
+++ b/package/minidlna/minidlna_tmpfiles.conf
@@ -0,0 +1,3 @@
+d /var/run/minidlna 0755 minidlna minidlna -
+d /var/cache/minidlna 0700 minidlna minidlna -
+d /var/log/minidlna 0755 minidlna minidlna -
-- 
2.2.1
