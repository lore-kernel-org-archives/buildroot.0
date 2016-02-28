From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:25 +0100
Subject: [Buildroot] [PATCH/next 4/7] package/vlc: add optional support for
	libssh2
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libssh2 was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/access/libsftp_plugin.so | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libvlccore.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libssh2.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4affb87..4f8bf72 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -251,6 +251,13 @@ else
 VLC_CONF_OPTS += --disable-svg --disable-svgdec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+VLC_CONF_OPTS += --enable-sftp
+VLC_DEPENDENCIES += libssh2
+else
+VLC_CONF_OPTS += --disable-sftp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSIDPLAY2),y)
 VLC_CONF_OPTS += --enable-sid
 VLC_DEPENDENCIES += libsidplay2
-- 
2.7.0
