From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 17:01:17 +0100
Subject: [Buildroot] [git commit] package/bluez5_utils: enable support for
 external ell
Message-ID: <20200321154853.10C10838DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a29bf23ecffcb93a8e82721ae7cfb2b82a91c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bluez5' support for the mesh profile needs ell, the Embedded Linux
Library, at least version 0.28.

Although Bluez5 bundles an internal copy of ell version 0.28, we prefer
building with external libraries.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
