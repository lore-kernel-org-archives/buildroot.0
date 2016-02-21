From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:43:19 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: add optional support
	for gdbm
Message-ID: <20160221114649.6836E8042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77278695470e2958af6d9a1dd93c9b222cde4b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gdbm was compiled before, pulseaudio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/pacat | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 86bbb2f..ee522cb 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -35,6 +35,12 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+ifeq ($(BR2_PACKAGE_GDBM),y)
+PULSEAUDIO_CONF_OPTS += --with-database=gdbm
+PULSEAUDIO_DEPENDENCIES += gdbm
+else
+PULSEAUDIO_CONF_OPTS += --with-database=simple
+endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
