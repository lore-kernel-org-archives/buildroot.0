From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jun 2015 23:41:02 +0200
Subject: [Buildroot] [git commit] eudev: add enable/disable hwdb option
Message-ID: <20150615214401.937C9807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b56265f447881ecf96edd76a635c3abc2b604eb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option enables/disables installation of the eudev hardware database,
which provides various extra properties for known devices.
Enabling this option adds ~5MB to the rootfs size.

The option is enabled by default in order to preserve old behavior.

[Peter: extend commit message]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/Config.in |    6 ++++++
 package/eudev/eudev.mk  |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6d4139f..76df409 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -27,6 +27,12 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
+config BR2_PACKAGE_EUDEV_ENABLE_HWDB
+	bool "enable hwdb installation"
+	default y
+	help
+	  Enables hardware database installation to /etc/udev/hwdb.d
+
 endif
 
 comment "eudev needs eudev /dev management"
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 101d510..a97154c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -31,6 +31,12 @@ ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule_generator
 endif
 
+ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
+EUDEV_CONF_OPTS += --enable-hwdb
+else
+EUDEV_CONF_OPTS += --disable-hwdb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 EUDEV_CONF_OPTS += --enable-gudev
 EUDEV_DEPENDENCIES += libglib2
