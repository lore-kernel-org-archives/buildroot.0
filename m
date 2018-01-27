From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:14:16 +0100
Subject: [Buildroot] [git commit] hwdata: bump to version 0.308
Message-ID: <20180127101527.D622F82828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a3d2a472a206dd68a9cf01b262d956685c20ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: drop BR2_PACKAGE_HWDATA_ANY and build time error, rework install step]
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwdata/Config.in   | 38 +++++++++++++++++++++++++++++++++++---
 package/hwdata/hwdata.hash |  7 ++++---
 package/hwdata/hwdata.mk   | 21 ++++++++++++++-------
 3 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/package/hwdata/Config.in b/package/hwdata/Config.in
index 8424238..f563988 100644
--- a/package/hwdata/Config.in
+++ b/package/hwdata/Config.in
@@ -1,6 +1,38 @@
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
+config BR2_PACKAGE_HWDATA_IAB_OUI_TXT
+	bool "install iab.txt and oui.txt"
+	help
+	  Install iab.txt and oui.txt
+
+config BR2_PACKAGE_HWDATA_PCI_IDS
+	bool "install pci.ids"
+	default y
+	help
+	  Install pci.ids
+
+config BR2_PACKAGE_HWDATA_PNP_IDS
+	bool "install pnp.ids"
+	help
+	  Install pnp.ids
+
+config BR2_PACKAGE_HWDATA_USB_IDS
+	bool "install usb.ids"
+	default y
+	help
+	  Install usb.ids
+
+endif
diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b3c83eb..dba1be3 100644
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
index 4ad8d42..4603ad6 100644
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
 
+HWDATA_FILES = \
+	$(if $(BR2_PACKAGE_HWDATA_IAB_OUI_TXT),iab.txt oui.txt) \
+	$(if $(BR2_PACKAGE_HWDATA_PCI_IDS),pci.ids) \
+	$(if $(BR2_PACKAGE_HWDATA_PNP_IDS),pnp.ids) \
+	$(if $(BR2_PACKAGE_HWDATA_USB_IDS),usb.ids)
+
+ifneq ($(strip $(HWDATA_FILES)),)
 define HWDATA_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
-	$(INSTALL) -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/hwdata
+	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/share/hwdata \
+		$(addprefix $(@D)/,$(HWDATA_FILES))
 endef
+endif
 
 $(eval $(generic-package))
