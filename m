From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:40 +1300
Subject: [Buildroot] [git commit] janus-gateway: make streaming plugin
	optional
Message-ID: <20170128084141.C838E7FAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=231884534b670cf87e24f872c3902008dce4b476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the streaming plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 133K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the streaming plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index c050ede..16e98f8 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -33,6 +33,9 @@ config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	bool "sip gateway"
 	select BR2_PACKAGE_SOFIA_SIP
 
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
