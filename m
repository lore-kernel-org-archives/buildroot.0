From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:45 -0500
Subject: [Buildroot] [V3 10/10] janus-gateway: Make voicemail plugin
	optional.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-10-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.
  - Selecting the voicemail plugin now adds libogg to the dependencies in the
    make file and selects the libogg package in the config file.
  - remove unecessary check for libogg in the make file as the package is now
    selected by default if the user chooses to enable the voicemail plugin.
v1 -> v2:
  - No changes.
  
 package/janus-gateway/Config.in        |  4 ++++
 package/janus-gateway/janus-gateway.mk | 14 +++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 3bf533e..2cb771f 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_JANUS_VIDEO_CALL
 config BR2_PACKAGE_JANUS_VIDEO_ROOM
 	bool "video room"
 
+config BR2_PACKAGE_JANUS_VOICE_MAIL
+	select BR2_PACKAGE_LIBOGG
+	bool "voice mail"
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
 
-- 
2.9.3
