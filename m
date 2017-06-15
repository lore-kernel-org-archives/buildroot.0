From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:11 -0400
Subject: [Buildroot] [PATCH 4/7] janus-gatway: add rabbitmq to transports
	section
In-Reply-To: <20170615121314.1485-1-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
Message-ID: <20170615121314.1485-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index eaec8a1..3b3d148 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -64,6 +64,10 @@ config BR2_PACKAGE_JANUS_WEBSOCKETS
 	bool "WebSockets"
 	select BR2_PACKAGE_LIBWEBSOCKETS
 
+config BR2_PACKAGE_JANUS_RABBITMQ
+	bool "RabbitMQ"
+	select BR2_PACKAGE_RABBITMQ_C
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 4a13199..6aa824e 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -24,7 +24,6 @@ JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
 
 JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
-	--disable-rabbitmq \
 	--disable-sample-event-handler
 
 ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
@@ -98,6 +97,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-rest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_RABBITMQ),y)
+JANUS_GATEWAY_DEPENDENCIES += rabbitmq-c
+JANUS_GATEWAY_CONF_OPTS += --enable-rabbitmq
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-rabbitmq
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
-- 
2.9.4
