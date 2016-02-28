From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:28 +0100
Subject: [Buildroot] [PATCH/next 7/7] package/vlc: add optional support for
	musepack
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When musepack was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/demux/libmpc_plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libmpcdec.so.7]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b67bd35..46a7cad 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -340,6 +340,13 @@ ifeq ($(BR2_PACKAGE_MINIZIP),y)
 VLC_DEPENDENCIES += minizip
 endif
 
+ifeq ($(BR2_PACKAGE_MUSEPACK),y)
+VLC_CONF_OPTS += --enable-mpc
+VLC_DEPENDENCIES += musepack
+else
+VLC_CONF_OPTS += --disable-mpc
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-- 
2.7.0
