From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 08:00:55 -0800
Subject: [Buildroot] [git commit] Add init script files for snowball board
Message-ID: <20121203145714.B56C399808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d4b1e4c5d98cbaafb8473c29d06b0d472cb34df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/snowball-init/Config.in        |   14 ++++++++++++++
 package/snowball-init/snowball-init.mk |   15 +++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c369f74..9c23ae3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -554,6 +554,7 @@ source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
new file mode 100644
index 0000000..99abb35
--- /dev/null
+++ b/package/snowball-init/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SNOWBALL_INIT
+	bool "snowball-init"
+	# Runtime dependency, needed by snowball startup script
+	select BR2_PACKAGE_BLUEZ_UTILS
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_UX500_FIRMWARE
+	help
+	  Snowball init scripts
+
+	  http://www.igloocommunity.org
+
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
new file mode 100644
index 0000000..278cacb
--- /dev/null
+++ b/package/snowball-init/snowball-init.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# snowball-init
+#
+#############################################################
+SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
+SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
+SNOWBALL_INIT_LICENSE = BSD-4c
+SNOWBALL_INIT_LICENSE_FILES = debian/copyright
+
+define SNOWBALL_INIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/snowball $(TARGET_DIR)/etc/init.d/S50snowball
+endef
+
+$(eval $(generic-package))
