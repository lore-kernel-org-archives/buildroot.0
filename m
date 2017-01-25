From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:37 -0500
Subject: [Buildroot] [V3 02/10] janus-gateway: Make sofia-sip a optional
	dependency.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway requires sofia-sip in the build system, however
this is unessasary. This patch makes the sip gateway plugin a option.
It also creates a menuconfig for janus gateway for the following patches
that enable selecting more optional plugins.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.
  - selecting the sip gateway plugin now selects the sofia sip package.
v1 -> v2: 
  - Fixed patch so that this patch only adds the plugin to both the
    Config.in and the .mk file.

 package/janus-gateway/Config.in        | 12 +++++++++++-
 package/janus-gateway/janus-gateway.mk |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index b9a2c66..b0a2e5d 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_JANUS_GATEWAY
+menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	bool "janus-gateway"
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,6 +15,16 @@ config BR2_PACKAGE_JANUS_GATEWAY
 
 	  https://github.com/meetecho/janus-gateway
 
+if BR2_PACKAGE_JANUS_GATEWAY
+
+comment "janus-gateway plugins"
+
+config BR2_PACKAGE_JANUS_SIP_GATEWAY
+	select BR2_PACKAGE_SOFIA_SIP
+	bool "sip gateway"
+
+endif
+
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 1b83768..dac324f 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,6 +26,13 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-rabbitmq
 
+ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
+JANUS_GATEWAY_DEPENDENCIES += sofia-sip
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-sip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
