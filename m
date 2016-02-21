From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:17 +0100
Subject: [Buildroot] [PATCH 13/14] package/jack2: add optional support for
	opus
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When opus was compiled before, jack2 will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/jackd | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libjackserver.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jack2/jack2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73328d3..e018861 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -10,6 +10,10 @@ JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+JACK2_DEPENDENCIES += opus
+endif
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-- 
2.7.0
