From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 21:18:27 +0100
Subject: [Buildroot] [PATCH/next 6/7] package/vlc: add optional support for
	xcb-util-keysyms
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456690708-6458-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xcb-util-keysyms was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/control/libxcb_hotkeys_plugin.so | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb-keysyms.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libXdmcp.so.6]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index bf1ec45..b67bd35 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -393,6 +393,13 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_XCB_UTIL_KEYSYMS),y)
+VLC_CONF_OPTS += --enable-xcb
+VLC_DEPENDENCIES += xcb-util-keysyms
+else
+VLC_CONF_OPTS += --disable-xcb
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 VLC_CONF_OPTS += --with-x
 VLC_DEPENDENCIES += xlib_libX11
-- 
2.7.0
