From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:14 +0100
Subject: [Buildroot] [PATCH 10/14] package/pulseaudio: add optional support
	for jack2
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.0
