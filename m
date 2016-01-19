From: Julien Floret <julien.floret@6wind.com>
Date: Tue, 19 Jan 2016 12:10:53 +0100
Subject: [Buildroot] [PATCH v2] lldpd: new package
In-Reply-To: <20160118211309.057d1922@free-electrons.com>
References: <20160118211309.057d1922@free-electrons.com>
Message-ID: <1453201853-31045-1-git-send-email-julien.floret@6wind.com>
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
Changes v1 -> v2:
  - rename BR2_PACKAGE_LLDPD_CUSTOM to BR2_PACKAGE_LLDPD_CUSTOM_TLV
  - explicitely disable privsep, xml, snmp, json, seccomp
  - remove LLDPD_SOURCE (same as default value)
  - add LLDPD_LICENSE_FILES
  - remove localstatedir configure option (same as default value)
  - use preferred configure option format (with/without, enable/disable)
  - simplify conditionals for configure options

 package/Config.in        |  1 +
 package/lldpd/Config.in  | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/lldpd/lldpd.hash |  2 ++
 package/lldpd/lldpd.mk   | 38 ++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 package/lldpd/Config.in
 create mode 100644 package/lldpd/lldpd.hash
 create mode 100644 package/lldpd/lldpd.mk

diff --git a/package/Config.in b/package/Config.in
index b04c690a78bc..533650a810ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1367,6 +1367,7 @@ endif
 	source "package/links/Config.in"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
+	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
 	source "package/memcached/Config.in"
diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
new file mode 100644
index 000000000000..8bade225590d
--- /dev/null
+++ b/package/lldpd/Config.in
@@ -0,0 +1,71 @@
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
+config BR2_PACKAGE_LLDPD_CUSTOM_TLV
+	bool "Custom TLV"
+	default y
+	help
+	  Enable Custom TLV support
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
index 000000000000..416967b2239c
--- /dev/null
+++ b/package/lldpd/lldpd.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# lldpd
+#
+################################################################################
+
+LLDPD_VERSION = 0.7.19
+LLDPD_SITE = http://media.luffy.cx/files/lldpd
+LLDPD_DEPENDENCIES = host-pkgconf libevent
+LLDPD_LICENSE = ISC
+LLDPD_LICENSE_FILES = README.md
+
+# Detection of c99 support in configure fails without WCHAR. To enable
+# automatic detection of c99 support by configure, we need to enable
+# WCHAR in toolchain. But actually we do not need WCHAR at lldpd
+# runtime. So requesting WCHAR in toolchain just for automatic detection
+# will be overkill. To solve this, explicitly -specify c99 here.
+LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
+LLDPD_CONF_OPTS = \
+	--without-readline \
+	--without-embedded-libevent \
+	--without-snmp \
+	--without-xml \
+	--without-json \
+	--without-seccomp \
+	--disable-hardening \
+	--disable-privsep \
+	$(if $(BR2_PACKAGE_LLDPD_CDP),--enable-cdp,--disable-cdp) \
+	$(if $(BR2_PACKAGE_LLDPD_FDP),--enable-fdp,--disable-fdp) \
+	$(if $(BR2_PACKAGE_LLDPD_EDP),--enable-edp,--disable-edp) \
+	$(if $(BR2_PACKAGE_LLDPD_SONMP),--enable-sonmp,--disable-sonmp) \
+	$(if $(BR2_PACKAGE_LLDPD_LLDPMED),--enable-lldpmed,--disable-lldpmed) \
+	$(if $(BR2_PACKAGE_LLDPD_DOT1),--enable-dot1,--disable-dot1) \
+	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
+	$(if $(BR2_PACKAGE_LLDPD_CUSTOM_TLV),--enable-custom,--disable-custom)
+
+$(eval $(autotools-package))
-- 
2.1.0
