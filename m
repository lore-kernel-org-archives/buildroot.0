From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Fri, 30 Nov 2012 13:39:14 +0100
Subject: [Buildroot] [PATCH v5 4/6] Add init script files for snowball board
In-Reply-To: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1354279156-20649-5-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                      |    1 +
 package/snowball-init/Config.in        |   14 ++++++++++++++
 package/snowball-init/snowball-init.mk |   15 +++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/snowball-init/Config.in
 create mode 100644 package/snowball-init/snowball-init.mk

diff --git a/package/Config.in b/package/Config.in
index d1c197a..69f3056 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -551,6 +551,7 @@ source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
new file mode 100644
index 0000000..a08cf8b
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
-- 
1.7.9.5
