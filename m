From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:28 +0200
Subject: [Buildroot] [PATCH 07/10] busybox: update-all-config shouldn't
	update default busybox config
In-Reply-To: <1350776731-8467-1-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
Message-ID: <1350776731-8467-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The new update-all-config target will update the busybox config file
if BR2_PACKAGE_BUSYBOX_CONFIG is set, even if it is set to the
default value in package/busybox/busybox-xxx.config.

To avoid this, set the default BR2_PACKAGE_BUSYBOX_CONFIG to empty,
and select a default to use in the .mk file.

Note that busybox-update-config will still overwrite the default
file in package/busybox/busybox-xxx.config - presumably it's
intentional.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/Config.in  |    7 ++-----
 package/busybox/busybox.mk |    9 +++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index dedcf18..0b77872 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,15 +40,12 @@ config BR2_BUSYBOX_VERSION
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
-	default "package/busybox/busybox-1.20.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
-	default "package/busybox/busybox-1.18.x.config" if BR2_BUSYBOX_VERSION_1_18_X
-	default "package/busybox/busybox-1.19.x.config" if BR2_BUSYBOX_VERSION_1_19_X
-	default "package/busybox/busybox-1.20.x.config" if BR2_BUSYBOX_VERSION_1_20_X
+	default ""
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
 
-	  Most people will just use the default BusyBox configuration file.
+	  If left empty, a default configuration file is used.
 
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	bool "Show packages that are also provided by busybox"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c73d0d0..5c54319 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -6,9 +6,11 @@
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 BUSYBOX_VERSION = snapshot
+BUSYBOX_CONFIG_VERSION = 1.20
 BUSYBOX_SITE = http://www.busybox.net/downloads/snapshots
 else
 BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
+BUSYBOX_CONFIG_VERSION = $(subst $(space),.,$(wordlist 1,2,$(subst .,$(space),$(BUSYBOX_VERSION))))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
@@ -27,9 +29,8 @@ BUSYBOX_MAKE_OPTS = \
 	CONFIG_PREFIX="$(TARGET_DIR)" \
 	SKIP_STRIP=y
 
-ifndef BUSYBOX_CONFIG_FILE
-	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
-endif
+BUSYBOX_CONFIG = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
+BUSYBOX_CONFIG_FILE = $(or $(wildcard $(BUSYBOX_CONFIG)),package/busybox/busybox-$(BUSYBOX_CONFIG_VERSION).x.config)
 
 define BUSYBOX_PERMISSIONS
 /bin/busybox			 f 4755	0 0 - - - - -
@@ -218,6 +219,6 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
 
-ifneq ($(BUSYBOX_CONFIG_FILE),)
+ifneq ($(BUSYBOX_CONFIG),)
 UPDATE_ALL_CONFIG_TARGETS += busybox-update-config
 endif
-- 
1.7.10.4
