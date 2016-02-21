From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:43:29 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: add optional support
	for jack2
Message-ID: <20160221114649.AF06D7FFA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ff5d3ff221003f17ac7e9862847946cf28e56c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When jack2 was compiled before, pulseaudio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/pulse-8.0/modules/module-jack-source.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libjack.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index ee522cb..cd8d0f9 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -42,6 +42,13 @@ else
 PULSEAUDIO_CONF_OPTS += --with-database=simple
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PULSEAUDIO_CONF_OPTS += --enable-jack
+PULSEAUDIO_DEPENDENCIES += jack2
+else
+PULSEAUDIO_CONF_OPTS += --disable-jack
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
