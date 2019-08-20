From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 20 Aug 2019 18:51:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/swconfig: new package
Message-ID: <20190820155119.17636-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add swconfig package which allows to configure switchdev
device (Ethernet switch) via netlink interface.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/swconfig/Config.in     |  8 ++++++++
 package/swconfig/swconfig.hash |  2 ++
 package/swconfig/swconfig.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/swconfig/Config.in
 create mode 100644 package/swconfig/swconfig.hash
 create mode 100644 package/swconfig/swconfig.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e50ac78ae7..11b976526b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2307,6 +2307,7 @@ F:	package/tstools/
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/gettext-tiny/
+F:	package/swconfig/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..2f05a364f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1990,6 +1990,7 @@ menu "Networking applications"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
+	source "package/swconfig/Config.in"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
 	source "package/nginx-dav-ext/Config.in"
diff --git a/package/swconfig/Config.in b/package/swconfig/Config.in
new file mode 100644
index 0000000000..25603f2752
--- /dev/null
+++ b/package/swconfig/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SWCONFIG
+	bool "swconfig"
+	select BR2_PACKAGE_LIBNL
+	help
+	  The program swconfig allows you to configure configurable
+	  Ethernet network switches.
+
+	  http://wiki.openwrt.org/doc/techref/swconfig
diff --git a/package/swconfig/swconfig.hash b/package/swconfig/swconfig.hash
new file mode 100644
index 0000000000..78e16aa37f
--- /dev/null
+++ b/package/swconfig/swconfig.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  d55f2580629fb4a585048efe4fdc6af30b269cad9adc6ae1b236c8c73ee70e8c  swconfig-20150806.tar.gz
diff --git a/package/swconfig/swconfig.mk b/package/swconfig/swconfig.mk
new file mode 100644
index 0000000000..c5105f8bbe
--- /dev/null
+++ b/package/swconfig/swconfig.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# swconfig
+#
+################################################################################
+
+SWCONFIG_VERSION = 20150806
+SWCONFIG_SITE = $(call github,rains31,swconfig,$(SWCONFIG_VERSION))
+SWCONFIG_LICENSE = GPL-2.0
+SWCONFIG_DEPENDENCIES = libnl
+
+# redefine original CFLAGS as it points directly to /usr/include
+SWCONFIG_MAKE_ENV = CC="$(TARGET_CC)" \
+		    CFLAGS="-I. -I$(STAGING_DIR)/usr/include/libnl3"
+
+define SWCONFIG_BUILD_CMDS
+	 $(SWCONFIG_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SWCONFIG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR="$(TARGET_DIR)" $(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
