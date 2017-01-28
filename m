From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:40 +1300
Subject: [Buildroot] [git commit] janus-gateway: make recordplay plugin
	optional
Message-ID: <20170128084141.B7F6A7FAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75175e4cd7cdc097d0b4d8bc1f67506d69e7b3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the record and play plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 68K .so
file on the target directory, and janus will also create a warning when ran
if the plugin does not have a matching configuration file setup by the user,
as it will not use the example config file by default.

This patch makes the record and play plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 39297a8..c050ede 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 config BR2_PACKAGE_JANUS_ECHO_TEST
 	bool "echo test"
 
+config BR2_PACKAGE_JANUS_RECORDPLAY
+	bool "record and play"
+
 config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	bool "sip gateway"
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index ce12393..a051e58 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -39,6 +39,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_RECORDPLAY),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-recordplay
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-recordplay
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
