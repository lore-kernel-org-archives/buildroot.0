From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:09:13 +0200
Subject: [Buildroot] [git commit] janus-gateway: add rabbitmq to transports
	section
Message-ID: <20170620211023.1D19D7FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dc7252d734221431a5276699e2a9d1a0df3fc56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: propagate rabbitmq-c dependency, use alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 8 ++++++++
 package/janus-gateway/janus-gateway.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 9af4d56..7fa23ec 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -56,6 +56,14 @@ config BR2_PACKAGE_JANUS_VOICE_MAIL
 
 comment "transports"
 
+config BR2_PACKAGE_JANUS_RABBITMQ
+	bool "RabbitMQ"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_RABBITMQ_C
+
+comment "RabbitMQ transport needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_JANUS_REST
 	bool "REST (HTTP/HTTPS)"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 69282a20..35faf77 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -24,7 +24,6 @@ JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
 
 JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
-	--disable-rabbitmq \
 	--disable-sample-event-handler
 
 ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
@@ -84,6 +83,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_RABBITMQ),y)
+JANUS_GATEWAY_DEPENDENCIES += rabbitmq-c
+JANUS_GATEWAY_CONF_OPTS += --enable-rabbitmq
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-rabbitmq
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_REST),y)
 JANUS_GATEWAY_DEPENDENCIES += libmicrohttpd
 JANUS_GATEWAY_CONF_OPTS += --enable-rest
