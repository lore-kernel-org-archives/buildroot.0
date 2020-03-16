From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2020 17:40:22 +0100
Subject: [Buildroot] [PATCH 2/4] package/bluez5_utils: add mesh support
In-Reply-To: <20200316164024.540598-1-joerg.krause@embedded.rocks>
References: <20200316164024.540598-1-joerg.krause@embedded.rocks>
Message-ID: <20200316164024.540598-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesh support was already added in version 5.47.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez5_utils/Config.in       | 7 +++++++
 package/bluez5_utils/bluez5_utils.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 488a2f79c8..038c6e7095 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	help
 	  Build BlueZ 5.x health plugin
 
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
+	bool "build mesh profile"
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_READLINE
+	help
+	  Build BlueZ 5.x mesh plugin
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
 	bool "build midi profile"
 	select BR2_PACKAGE_ALSA_LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index e328f52eaf..2d95899f44 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -51,6 +51,14 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-health
 endif
 
+# enable mesh profile
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-mesh
+BLUEZ5_UTILS_DEPENDENCIES += json-c readline
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-mesh
+endif
+
 # enable midi profile
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-midi
-- 
2.25.1
