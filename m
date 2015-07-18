From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 22:53:37 +0200
Subject: [Buildroot] [git commit] bluez5_utils: add ability to build sixaxis
	plugin
Message-ID: <20150718205353.1B5F781D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de33b1940dc77ccb487ece73bf038bea415caf93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add missing udev dependency.]

Signed-off-by: Eric Limpens <limpens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/Config.in       |    9 +++++++++
 package/bluez5_utils/bluez5_utils.mk |    7 +++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 472432b..80c3830 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -58,6 +58,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	help
 	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
 
+config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
+	bool "build sixaxis plugin"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock controller)
+
+comment "sixaxis plugin needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 	bool "build tests"
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index a1adbe1..4c50e53 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -41,6 +41,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+# enable sixaxis plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
+endif
+
 # install gatttool (For some reason upstream choose not to do it by default)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
