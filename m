From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 12 Apr 2017 14:16:33 +0200
Subject: [Buildroot] [PATCH 1/2] phytool: new package
Message-ID: <20170412121634.8928-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in            |  1 +
 package/phytool/Config.in    |  6 ++++++
 package/phytool/phytool.hash |  2 ++
 package/phytool/phytool.mk   | 22 ++++++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/phytool/Config.in
 create mode 100644 package/phytool/phytool.hash
 create mode 100644 package/phytool/phytool.mk

diff --git a/package/Config.in b/package/Config.in
index c12e5b56f..bdad62267 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,7 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
+	source "package/phytool/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/phytool/Config.in b/package/phytool/Config.in
new file mode 100644
index 000000000..7dca31dda
--- /dev/null
+++ b/package/phytool/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PHYTOOL
+	bool "phytool"
+	help
+	  Linux MDIO register access utility.
+
+	  https://github.com/wkz/phytool
diff --git a/package/phytool/phytool.hash b/package/phytool/phytool.hash
new file mode 100644
index 000000000..f4a395f5e
--- /dev/null
+++ b/package/phytool/phytool.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a002712580ba57e0216e5b984a52322b6b2f0bbb029bc79ebe73a6ee9f2a19bb  phytool-3149bfdb4f513e2f0da0a7d0bc5d0873578696f2.tar.gz
diff --git a/package/phytool/phytool.mk b/package/phytool/phytool.mk
new file mode 100644
index 000000000..6115cb837
--- /dev/null
+++ b/package/phytool/phytool.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# phytool
+#
+################################################################################
+
+PHYTOOL_VERSION = 3149bfdb4f513e2f0da0a7d0bc5d0873578696f2
+PHYTOOL_SITE = $(call github,wkz,phytool,$(PHYTOOL_VERSION))
+PHYTOOL_LICENSE = GPL-2.0
+PHYTOOL_LICENSE_FILES = LICENSE
+
+define PHYTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -C $(@D)
+endef
+
+define PHYTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" \
+		PREFIX="usr" install
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
