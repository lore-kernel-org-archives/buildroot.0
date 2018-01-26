From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 26 Jan 2018 08:21:57 -0200
Subject: [Buildroot] [PATCH v3] hwdata: bump to version 0.308
Message-ID: <20180126102157.4982-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hwdata collection is hosted at GitHub now and provides additional
databases, besides pci.ids and usb.ids:

- Individual Address Block (IAB) and Organizationally Unique Identifier
  (OUI) databases, from IEEE Registration Authority
- PNP ID database (from Microsoft)

Install only pci.ids and usb.ids by default, to keep compatibility with
previous versions.

In the future we can make other packages (pciutils, lshw) use the common
files instead of installing their own copies, thus saving some storage
space.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  - Ensure that $(TARGET_DIR)/usr/share/hwdata exists before installing
    the files there.
Changes v2->v3:
  - Fix commit title ("bump", not "bumb").
---
 package/hwdata/Config.in   | 45 ++++++++++++++++++++++++++++++++++++++++++---
 package/hwdata/hwdata.hash |  7 ++++---
 package/hwdata/hwdata.mk   | 21 ++++++++++++++-------
 3 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/package/hwdata/Config.in b/package/hwdata/Config.in
index 8424238e1b..63bb2216da 100644
--- a/package/hwdata/Config.in
+++ b/package/hwdata/Config.in
@@ -1,6 +1,45 @@
 config BR2_PACKAGE_HWDATA
 	bool "hwdata"
 	help
-	  Various hardware identification and configuration data,
-	  such as the pci.ids database, or the XFree86/xorg Cards
-	  database.
+	  Various hardware identification and configuration data
+
+	  - Individual Address Block (IAB) and Organizationally Unique
+	    Identifier (OUI) databases, from IEEE Registration Authority
+	  - PCI ID database
+	  - PNP ID database (from Microsoft)
+	  - USB ID database
+
+	  https://github.com/vcrhonek/hwdata
+
+if BR2_PACKAGE_HWDATA
+
+config BR2_PACKAGE_HWDATA_ANY
+	bool
+
+config BR2_PACKAGE_HWDATA_IAB_OUI_TXT
+	bool "install iab.txt and oui.txt"
+	select BR2_PACKAGE_HWDATA_ANY
+	help
+	  Install iab.txt and oui.txt
+
+config BR2_PACKAGE_HWDATA_PCI_IDS
+	bool "install pci.ids"
+	default y
+	select BR2_PACKAGE_HWDATA_ANY
+	help
+	  Install pci.ids
+
+config BR2_PACKAGE_HWDATA_PNP_IDS
+	bool "install pnp.ids"
+	select BR2_PACKAGE_HWDATA_ANY
+	help
+	  Install pnp.ids
+
+config BR2_PACKAGE_HWDATA_USB_IDS
+	bool "install usb.ids"
+	default y
+	select BR2_PACKAGE_HWDATA_ANY
+	help
+	  Install usb.ids
+
+endif
diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b3c83ebb74..dba1be31e0 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,3 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/hwdata/hwdata_0.267-1.dsc
-sha256	d77f2b3f3d6e278be669141ffa5dac01b64cab02f7b2c744bbabc500a45263f4	hwdata_0.267.orig.tar.gz
-sha256	055d2f168de9333562a04f6a230c43dc19c4975882935d8b2f0ab17f64f57275	hwdata_0.267-1.diff.gz
+# Locally calculated
+sha256 986d919c20a0c7f8b669a63830f6d2f4cb5c4cddcfc944c5e2ae05c2e9e5ec9f  hwdata-v0.308.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 4ad8d42939..a23a282725 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,16 +4,23 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.267
-HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
-HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/hwdata
-HWDATA_LICENSE = GPL-2.0+ or XFree86 1.0 license
+HWDATA_VERSION = v0.308
+HWDATA_SITE = $(call github,vcrhonek,hwdata,$(HWDATA_VERSION))
+HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
 
+ifeq ($(BR2_PACKAGE_HWDATA):$(BR2_PACKAGE_HWDATA_ANY),y:)
+$(error No hwdata database selected. Select at least one database)
+endif
+
 define HWDATA_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
-	$(INSTALL) -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/hwdata
+	$(INSTALL) -D -m 644 \
+		$(if $(BR2_PACKAGE_HWDATA_IAB_OUI_TXT),$(@D)/iab.txt $(@D)/oui.txt,) \
+		$(if $(BR2_PACKAGE_HWDATA_PCI_IDS),$(@D)/pci.ids,) \
+		$(if $(BR2_PACKAGE_HWDATA_PNP_IDS),$(@D)/pnp.ids,) \
+		$(if $(BR2_PACKAGE_HWDATA_USB_IDS),$(@D)/usb.ids,) \
+		$(TARGET_DIR)/usr/share/hwdata
 endef
 
 $(eval $(generic-package))
-- 
2.14.3
