From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:41 +1300
Subject: [Buildroot] [git commit] janus-gateway: make voicemail plugin
	optional
Message-ID: <20170128084142.15E6C81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ea01e10ee4346e7f884790fdd71d2d636e54cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway's voicemail plugin is only built if
libogg is selected, and even then there is no way to disable the plugin from
being built. This causes a example config file to be placed on
the target filing system that the user may not need or want, creates a 33K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the voicemail plugin optional, removes the check for libogg,
adds libogg as a dependency to the voicemail plugin, and selects the libogg
package automatically when the user selects the plugin.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        |  4 ++++
 package/janus-gateway/janus-gateway.mk | 14 +++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index eb4d032..125adf8 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_JANUS_VIDEO_CALL
 config BR2_PACKAGE_JANUS_VIDEO_ROOM
 	bool "video room"
 
+config BR2_PACKAGE_JANUS_VOICE_MAIL
+	bool "voice mail"
+	select BR2_PACKAGE_LIBOGG
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b9a36a0..212fa47 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -76,6 +76,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videoroom
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_VOICE_MAIL),y)
+JANUS_GATEWAY_DEPENDENCIES += libogg
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
@@ -83,13 +90,6 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOGG),y)
-JANUS_GATEWAY_DEPENDENCIES += libogg
-JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
-else
-JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
-endif
-
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
