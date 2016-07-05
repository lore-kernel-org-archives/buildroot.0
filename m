From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:30:09 +0200
Subject: [Buildroot] [git commit] package/rs485conf: new package
Message-ID: <20160705133113.7E91B817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d323379ca7fde14a04d4ab0b3e620196290ddae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/rs485conf/Config.in      |  9 +++++++++
 package/rs485conf/rs485conf.hash |  2 ++
 package/rs485conf/rs485conf.mk   | 20 ++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 11fcdad..6cc1d3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -430,6 +430,7 @@ endmenu
 	source "package/rfkill/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
+	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rs485conf/Config.in b/package/rs485conf/Config.in
new file mode 100644
index 0000000..ff0b743
--- /dev/null
+++ b/package/rs485conf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RS485CONF
+	bool "rs485conf"
+	help
+	  rs485conf is intended to be used on embedded boards with RS485
+	  interface. It can show as well as modify RS485 configuration
+	  parameters of TTY device with easy to use command line
+	  options.
+
+	  https://github.com/mniestroj/rs485conf
diff --git a/package/rs485conf/rs485conf.hash b/package/rs485conf/rs485conf.hash
new file mode 100644
index 0000000..e2ccbfd
--- /dev/null
+++ b/package/rs485conf/rs485conf.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f163f81cd50aae6fa39cbb4f6408a3699da7a87a56649c4b96d6f168c9be6a7d rs485conf-5c8d00cf70950fab3454549b81dea843d844492a.tar.gz
diff --git a/package/rs485conf/rs485conf.mk b/package/rs485conf/rs485conf.mk
new file mode 100644
index 0000000..7fda39c
--- /dev/null
+++ b/package/rs485conf/rs485conf.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rs485conf
+#
+################################################################################
+
+RS485CONF_VERSION = 5c8d00cf70950fab3454549b81dea843d844492a
+RS485CONF_SITE = $(call github,mniestroj,rs485conf,$(RS485CONF_VERSION))
+RS485CONF_LICENSE = BSD-3c
+RS485CONF_LICENSE_FILES = LICENSE
+
+define RS485CONF_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define RS485CONF_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(generic-package))
