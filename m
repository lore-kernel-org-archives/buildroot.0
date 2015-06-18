From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 18 Jun 2015 22:19:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Add libsidplay2 as optional
	dependency
Message-ID: <1434658781-3455-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc has a sid plugin:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
  output/target/usr/lib/vlc/plugins/demux/libsid_plugin.so |
  grep NEEDED | grep sid
 0x00000001 (NEEDED)     Shared library: [libsidplay2.so.1]
 0x00000001 (NEEDED)     Shared library: [libresid-builder.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index acd67ee..515a5fb 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -203,6 +203,13 @@ else
 VLC_CONF_OPTS += --disable-svg --disable-svgdec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIDPLAY2),y)
+VLC_CONF_OPTS += --enable-sid
+VLC_DEPENDENCIES += libsidplay2
+else
+VLC_CONF_OPTS += --disable-sid
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 VLC_CONF_OPTS += --enable-theora
 VLC_DEPENDENCIES += libtheora
-- 
1.7.10.4
