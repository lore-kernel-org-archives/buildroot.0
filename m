From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:02:37 +0100
Subject: [Buildroot] [git commit] package/vlc: add optional support for
	musepack
Message-ID: <20160305140246.10F127FB32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59d0d2fcb4387659b4c6f24572b50d049bcd2694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When musepack was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/demux/libmpc_plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libmpcdec.so.7]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
