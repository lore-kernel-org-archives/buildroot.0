From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Mon,  2 Jan 2017 23:38:24 +0100
Subject: [Buildroot] [PATCH] lpppd: new package
Message-ID: <20170102223824.28266-1-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan Nickl <Stefan.Nickl@gmail.com>

After the official github repository for PPP has not seen
any activity for a long time, I've created a fork that
tries to do some modernization and shed some legacy.
For more info, please see https://github.com/snickl/lpppd

It is inteded as a drop-in replacement for the original PPP,
therefore I've marked it as conflicting with the existing pppd
package.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/Config.in        |  1 +
 package/lpppd/Config.in  | 34 ++++++++++++++++++++++++++++++++++
 package/lpppd/lpppd.hash |  2 ++
 package/lpppd/lpppd.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 package/lpppd/Config.in
 create mode 100644 package/lpppd/lpppd.hash
 create mode 100644 package/lpppd/lpppd.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..229151b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1527,6 +1527,7 @@ menu "Networking applications"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
 	source "package/lldpd/Config.in"
+	source "package/lpppd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
 	source "package/memcached/Config.in"
diff --git a/package/lpppd/Config.in b/package/lpppd/Config.in
new file mode 100644
index 0000000..ec9db6f
--- /dev/null
+++ b/package/lpppd/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_LPPPD
+	bool "lpppd"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_PPPD
+	depends on BR2_USE_MMU
+	help
+	  A fork of the Point-to-point protocol daemon
+	  for Linux systems.
+
+	  https://github.com/snickl/lpppd
+
+if BR2_PACKAGE_LPPPD
+
+config BR2_PACKAGE_LPPPD_FILTER
+	select BR2_PACKAGE_LIBPCAP
+	bool "filtering"
+	help
+	  Packet filtering abilities for lpppd. If enabled,
+	  the lpppd active-filter and pass-filter options
+	  are available.
+
+config BR2_PACKAGE_LPPPD_MULTILINK
+	bool "multilink"
+	help
+	  Enable multilink
+
+endif
+
+comment "lpppd conflicts with pppd"
+        depends on BR2_PACKAGE_PPPD
+
+comment "lpppd needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
diff --git a/package/lpppd/lpppd.hash b/package/lpppd/lpppd.hash
new file mode 100644
index 0000000..db4fa68
--- /dev/null
+++ b/package/lpppd/lpppd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 d171cccd680abfd11975c9e58b0804b5677a272b126088fa338bae5f606c10c6 lpppd-v1.tar.gz
diff --git a/package/lpppd/lpppd.mk b/package/lpppd/lpppd.mk
new file mode 100644
index 0000000..c5b01b1
--- /dev/null
+++ b/package/lpppd/lpppd.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# lpppd
+#
+################################################################################
+
+LPPPD_VERSION = v1
+LPPPD_SITE = $(call github,snickl,lpppd,$(LPPPD_VERSION))
+LPPPD_LICENSE = LGPLv2+, LGPL, BSD-4c, BSD-3c, GPLv2+
+LPPPD_LICENSE_FILES = \
+	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
+	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
+
+LPPPD_CONF_OPTS = -DOPTION_LPPPD_INET6=ON
+
+ifeq ($(BR2_PACKAGE_LPPPD_FILTER),y)
+LPPPD_DEPENDENCIES += libpcap
+LPPPD_CONF_OPTS += -DOPTION_LPPPD_PPPD_FILTER=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LPPPD_MULTILINK),y)
+LPPPD_CONF_OPTS += -DOPTION_LPPPD_PPPD_MULTILINK=ON
+endif
+
+define LPPPD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(INSTALL) -D -m 0755 $(LPPPD_DIR)/scripts/pon $(TARGET_DIR)/usr/bin/pon
+	$(INSTALL) -D -m 0755 $(LPPPD_DIR)/scripts/poff $(TARGET_DIR)/usr/bin/poff
+endef
+
+$(eval $(cmake-package))
-- 
2.9.3
