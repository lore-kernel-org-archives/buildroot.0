From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2020 17:40:24 +0100
Subject: [Buildroot] [PATCH 4/4] package/bluez5_utils: enable support for
 external ell
In-Reply-To: <20200316164024.540598-1-joerg.krause@embedded.rocks>
References: <20200316164024.540598-1-joerg.krause@embedded.rocks>
Message-ID: <20200316164024.540598-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bluez' support for the mesh profile needs ell, the Embedded Linux
Library, at least version 0.28.

Although Bluez bundles an internal copy of ell version 0.28, we prefer
building with external libraries.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez5_utils/Config.in       | 1 +
 package/bluez5_utils/bluez5_utils.mk | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 038c6e7095..1e9eda31dc 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -62,6 +62,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
 	bool "build mesh profile"
+	select BR2_PACKAGE_ELL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_READLINE
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 2d95899f44..2149614c56 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -53,10 +53,10 @@ endif
 
 # enable mesh profile
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-mesh
-BLUEZ5_UTILS_DEPENDENCIES += json-c readline
+BLUEZ5_UTILS_CONF_OPTS += --enable-external-ell --enable-mesh
+BLUEZ5_UTILS_DEPENDENCIES += ell json-c readline
 else
-BLUEZ5_UTILS_CONF_OPTS += --disable-mesh
+BLUEZ5_UTILS_CONF_OPTS += --disable-external-ell --disable-mesh
 endif
 
 # enable midi profile
-- 
2.25.1
