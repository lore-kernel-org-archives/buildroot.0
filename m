From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:01:45 +0100
Subject: [Buildroot] [git commit] package/vlc: add optional support for
	libcddb
Message-ID: <20160305140245.6CE747FB32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad1473886367f759b839fc989d1c15febff25f3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcddb was compiled before, vlc will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/vlc/plugins/access/libcdda_plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcddb.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
