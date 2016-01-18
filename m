From: Julien Floret <julien.floret@6wind.com>
Date: Mon, 18 Jan 2016 11:14:44 +0100
Subject: [Buildroot] [PATCH] lldpd: new package
Message-ID: <1453112084-16105-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
of all your equipments.

LLDP is an industry standard protocol designed to supplant
proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
is to provide an inter-vendor compatible mechanism to deliver
Link-Layer notifications to adjacent network devices.

https://vincentbernat.github.io/lldpd/

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/Config.in        |  1 +
 package/lldpd/Config.in  | 91 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/lldpd/lldpd.hash |  2 ++
 package/lldpd/lldpd.mk   | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 package/lldpd/Config.in
 create mode 100644 package/lldpd/lldpd.hash
 create mode 100644 package/lldpd/lldpd.mk

diff --git a/package/Config.in b/package/Config.in
index 89b23dbfe360..1ceb43d66222 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1364,6 +1364,7 @@ endif
 	source "package/links/Config.in"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
+	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
 	source "package/memcached/Config.in"
diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
new file mode 100644
index 000000000000..c152c559a9de
--- /dev/null
+++ b/package/lldpd/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_LLDPD
+	bool "lldpd"
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
+	  of all your equipments.
+
+	  LLDP allows you to know exactly on which port is a server
+	  (and reciprocally).
+
+	  LLDP is an industry standard protocol designed to supplant
+	  proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
+	  is to provide an inter-vendor compatible mechanism to deliver
+	  Link-Layer notifications to adjacent network devices.
+
+	  lldpd is an ISC-licensed implementation of LLDP for various Unixes.
+	  It also supports some proprietary protocols.
+
+	  https://vincentbernat.github.io/lldpd/
+
+if BR2_PACKAGE_LLDPD
+
+config BR2_PACKAGE_LLDPD_CDP
+	bool "CDP"
+	default y
+	help
+	  Enable Cisco Discovery Protocol
+
+config BR2_PACKAGE_LLDPD_FDP
+	bool "FDP"
+	default y
+	help
+	  Enable Foundry Discovery Protocol
+
+config BR2_PACKAGE_LLDPD_EDP
+	bool "EDP"
+	default y
+	help
+	  Enable Extreme Discovery Protocol
+
+config BR2_PACKAGE_LLDPD_SONMP
+	bool "SONMP"
+	default y
+	help
+	  Enable SynOptics Network Management
+
+config BR2_PACKAGE_LLDPD_LLDPMED
+	bool "LLDP-MED"
+	default y
+	help
+	  Enable LLDP-MED extension
+
+config BR2_PACKAGE_LLDPD_DOT1
+	bool "DOT1"
+	default y
+	help
+	  Enable Dot1 extension (VLAN stuff)
+
+config BR2_PACKAGE_LLDPD_DOT3
+	bool "DOT3"
+	default y
+	help
+	  Enable Dot3 extension (PHY stuff)
+
+config BR2_PACKAGE_LLDPD_CUSTOM
+	bool "Custom TLV"
+	default y
+	help
+	  Enable Custom TLV support
+
+config BR2_PACKAGE_LLDPD_PRIVSEP
+	bool "Privilege separation"
+	default y
+	help
+	  Enable Privilege separation
+
+config BR2_PACKAGE_LLDPD_PRIVSEP_USER
+	string "Privilege separation user"
+	depends on BR2_PACKAGE_LLDPD_PRIVSEP
+	default "_lldpd"
+	help
+	  Which user to use for privilege separation
+
+config BR2_PACKAGE_LLDPD_PRIVSEP_GROUP
+	string "Privilege separation group"
+	depends on BR2_PACKAGE_LLDPD_PRIVSEP
+	default "_lldpd"
+	help
+	  Which group to use for privilege separation
+
+endif
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
new file mode 100644
index 000000000000..a6d905bd36db
--- /dev/null
+++ b/package/lldpd/lldpd.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8  lldpd-0.7.19.tar.gz
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
new file mode 100644
index 000000000000..984991723894
--- /dev/null
+++ b/package/lldpd/lldpd.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# lldpd
+#
+################################################################################
+
+LLDPD_VERSION = 0.7.19
+LLDPD_SITE = http://media.luffy.cx/files/lldpd
+LLDPD_SOURCE = lldpd-$(LLDPD_VERSION).tar.gz
+LLDPD_DEPENDENCIES = host-pkgconf libevent
+LLDPD_LICENSE = ISC
+
+# Detection of c99 support in configure fails without WCHAR. To enable
+# automatic detection of c99 support by configure, we need to enable
+# WCHAR in toolchain. But actually we do not need WCHAR at lldpd
+# runtime. So requesting WCHAR in toolchain just for automatic detection
+# will be overkill. To solve this, explicitly -specify c99 here.
+LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
+LLDPD_CONF_OPTS = \
+	--localstatedir=/var \
+	--with-readline=no \
+	--with-embedded-libevent=no \
+	--disable-hardening
+
+ifeq ($(BR2_PACKAGE_LLDPD_CDP),y)
+LLDPD_CONF_OPTS += --enable-cdp=yes
+else
+LLDPD_CONF_OPTS += --enable-cdp=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_FDP),y)
+LLDPD_CONF_OPTS += --enable-fdp=yes
+else
+LLDPD_CONF_OPTS += --enable-fdp=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_EDP),y)
+LLDPD_CONF_OPTS += --enable-edp=yes
+else
+LLDPD_CONF_OPTS += --enable-edp=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_SONMP),y)
+LLDPD_CONF_OPTS += --enable-sonmp=yes
+else
+LLDPD_CONF_OPTS += --enable-sonmp=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_LLDPMED),y)
+LLDPD_CONF_OPTS += --enable-lldpmed=yes
+else
+LLDPD_CONF_OPTS += --enable-lldpmed=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_DOT1),y)
+LLDPD_CONF_OPTS += --enable-dot1=yes
+else
+LLDPD_CONF_OPTS += --enable-dot1=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_DOT3),y)
+LLDPD_CONF_OPTS += --enable-dot3=yes
+else
+LLDPD_CONF_OPTS += --enable-dot3=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_CUSTOM),y)
+LLDPD_CONF_OPTS += --enable-custom=yes
+else
+LLDPD_CONF_OPTS += --enable-custom=no
+endif
+
+ifeq ($(BR2_PACKAGE_LLDPD_PRIVSEP),y)
+LLDPD_CONF_OPTS += --enable-privsep=yes
+else
+LLDPD_CONF_OPTS += --enable-privsep=no
+endif
+
+ifneq ($(BR2_PACKAGE_LLDPD_PRIVSEP_USER),)
+LLDPD_CONF_OPTS += --with-privsep-user=$(BR2_PACKAGE_LLDPD_PRIVSEP_USER)
+endif
+
+ifneq ($(BR2_PACKAGE_LLDPD_PRIVSEP_GROUP),)
+LLDPD_CONF_OPTS += --with-privsep-group=$(BR2_PACKAGE_LLDPD_PRIVSEP_GROUP)
+endif
+
+$(eval $(autotools-package))
-- 
2.1.0
