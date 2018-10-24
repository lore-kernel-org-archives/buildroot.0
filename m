From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 Oct 2018 22:08:00 +0200
Subject: [Buildroot] [PATCH 3/3] package/mjpg-streamer: add optional
 dependency to zeromq
In-Reply-To: <20181024200800.32300-1-bernd.kuhls@t-online.de>
References: <20181024200800.32300-1-bernd.kuhls@t-online.de>
Message-ID: <20181024200800.32300-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ZeroMQ output module also depends on protobuf, see upstream PR 145.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index bfde26e548..5ace2f716c 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -29,6 +29,13 @@ else
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PROTOBUF_C)$(BR2_PACKAGE_ZEROMQ),yy)
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=ON
+MJPG_STREAMER_DEPENDENCIES += host-pkgconf protobuf-c zeromq
+else
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_VIEWER=ON
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf sdl
-- 
2.19.1
