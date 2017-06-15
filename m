From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:13 -0400
Subject: [Buildroot] [PATCH 6/7] janus-gatway: add unix-sockets to transport
	section
In-Reply-To: <20170615121314.1485-1-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
Message-ID: <20170615121314.1485-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 4122708..fcc4717 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -72,6 +72,9 @@ config BR2_PACKAGE_JANUS_MQTT
 	bool "MQTT"
 	select BR2_PACKAGE_PAHO_MQTT_C
 
+config BR2_PACKAGE_JANUS_UNIX_SOCKETS
+	bool "Unix Sockets"
+	default y
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 915f812..94fc9a4 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -111,6 +111,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-mqtt
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_UNIX_SOCKETS),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-unix-sockets
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-unix-sockets
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
-- 
2.9.4
