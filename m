From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:41 -0500
Subject: [Buildroot] [V3 06/10] janus-gateway: Make streaming plugin
	optional.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the streaming plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 133K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the streaming plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.
v1 -> v2:
  - Fixed patch so that this patch only adds the plugin to both the
    Config.in and the .mk file.

 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index db29b19..07393ab 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -33,6 +33,9 @@ config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	select BR2_PACKAGE_SOFIA_SIP
 	bool "sip gateway"
 
+config  BR2_PACKAGE_JANUS_STREAMING
+	bool "streaming"
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index a051e58..96a81fe 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -52,6 +52,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-sip
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_STREAMING),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-streaming
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
