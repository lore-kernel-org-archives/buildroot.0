From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:02:30 +0100
Subject: [Buildroot] [git commit] package/vlc: add optional support for
	xcb-util-keysyms
Message-ID: <20160305140245.F139981794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c14879c7d19c3d97f2c6a8828445c4b93d9472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xcb-util-keysyms was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/control/libxcb_hotkeys_plugin.so | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb-keysyms.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libXdmcp.so.6]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
