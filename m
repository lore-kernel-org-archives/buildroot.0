From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:02:15 +0100
Subject: [Buildroot] [git commit] package/vlc: add optional support for
	minizip
Message-ID: <20160305140245.C18E181794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51db776cb4c24fcc12c720b1cc9c6f9b5c47606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
