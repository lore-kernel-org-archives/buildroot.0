From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 Oct 2018 21:07:32 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mjpg-streamer: add optional
 dependency to zeromq
In-Reply-To: <20181025190732.3474-1-bernd.kuhls@t-online.de>
References: <20181025190732.3474-1-bernd.kuhls@t-online.de>
Message-ID: <20181025190732.3474-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ZeroMQ output module also depends on protobuf, see upstream PR 145.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index de8bad0c03..4077a3dcbc 100644
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
