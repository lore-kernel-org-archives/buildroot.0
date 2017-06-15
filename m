From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:09 -0400
Subject: [Buildroot] [PATCH 2/7] janus-gateway: add transports section to
	config.
In-Reply-To: <20170615121314.1485-1-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
Message-ID: <20170615121314.1485-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

janus-gateway supports many different transports, and currently
there is no implicit way to turn them off or on.  Instead, if the
dependency happens to be built, then the transport is enabled.

Create a transports section in the config file and add
BR2_PACKAGE_JANUS_REST as the first transport.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 6 ++++++
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index e07b4ad..7fc213f 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -54,6 +54,12 @@ config BR2_PACKAGE_JANUS_VOICE_MAIL
 	bool "voice mail"
 	select BR2_PACKAGE_LIBOGG
 
+comment "transports"
+
+config BR2_PACKAGE_JANUS_REST
+	bool "REST (HTTP/HTTPS)"
+	select BR2_PACKAGE_LIBMICROHTTPD
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b79e340..01021f8 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -91,6 +91,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_REST),y)
+JANUS_GATEWAY_DEPENDENCIES += libmicrohttpd
+JANUS_GATEWAY_CONF_OPTS += --enable-rest
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-rest
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
-- 
2.9.4
