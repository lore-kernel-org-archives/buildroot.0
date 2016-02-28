From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:23 +0100
Subject: [Buildroot] [PATCH/next 2/7] package/vlc: add optional support for
	libcddb
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcddb was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/access/libcdda_plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcddb.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 03e1d88..1bb2b93 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -186,6 +186,13 @@ else
 VLC_CONF_OPTS += --disable-bluray
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCDDB),y)
+VLC_CONF_OPTS += --enable-libcddb
+VLC_DEPENDENCIES += libcddb
+else
+VLC_CONF_OPTS += --disable-libcddb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBPSI),y)
 VLC_CONF_OPTS += --enable-dvbpsi
 VLC_DEPENDENCIES += libdvbpsi
-- 
2.7.0
