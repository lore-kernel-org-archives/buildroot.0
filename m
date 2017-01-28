From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:40 +1300
Subject: [Buildroot] [git commit] janus-gateway: make echo test plugin
	optional
Message-ID: <20170128084141.A620181E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=164bba50a6be0817a6b3aae671c280ea589e8cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the echo test plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 36K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the echo test plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 95b12a9..39297a8 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -23,6 +23,9 @@ config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 	bool "audio bridge"
 	select BR2_PACKAGE_OPUS
 
+config BR2_PACKAGE_JANUS_ECHO_TEST
+	bool "echo test"
+
 config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	bool "sip gateway"
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 1f9ba49..ce12393 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -33,6 +33,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_ECHO_TEST),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-echotest
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
