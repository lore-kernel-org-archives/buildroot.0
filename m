From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:24 +0100
Subject: [Buildroot] [PATCH/next 3/7] package/vlc: add optional support for
	libvncserver
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libvncserver was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/access/libvnc_plugin.so | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libvlccore.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libvncclient.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 1bb2b93..4affb87 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -272,6 +272,13 @@ else
 VLC_CONF_OPTS += --disable-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
+VLC_CONF_OPTS += --enable-vnc
+VLC_DEPENDENCIES += libvncserver
+else
+VLC_CONF_OPTS += --disable-vnc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 VLC_CONF_OPTS += --enable-vorbis
 VLC_DEPENDENCIES += libvorbis
-- 
2.7.0
