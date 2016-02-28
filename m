From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:26 +0100
Subject: [Buildroot] [PATCH/next 5/7] package/vlc: add optional support for
	minizip
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When minizip was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/access/libzip_plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libminizip.so.1]
[...]

The build system offers no option to en-/disable minizip support,
the same is valid for zlib support:
https://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=be658816bcda642090e1cff20d93e61b25299250;hb=HEAD#l831

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4f8bf72..bf1ec45 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -336,6 +336,10 @@ else
 VLC_CONF_OPTS += --disable-lua
 endif
 
+ifeq ($(BR2_PACKAGE_MINIZIP),y)
+VLC_DEPENDENCIES += minizip
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-- 
2.7.0
