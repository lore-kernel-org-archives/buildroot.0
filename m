From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 May 2014 00:47:33 +0200
Subject: [Buildroot] [PATCH v2] faifa: new package
Message-ID: <1399157253-4429-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

faifa is a library and a cli used to manage PLC hardware that use
Intellon chipset.
Almost everybody use theses chips nowadays.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 -> v2:
    - Changes version from master to a sha1
---
 package/Config.in       |  1 +
 package/faifa/Config.in | 11 +++++++++++
 package/faifa/faifa.mk  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/faifa/Config.in
 create mode 100644 package/faifa/faifa.mk

diff --git a/package/Config.in b/package/Config.in
index 4430241..e469a48 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -910,6 +910,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/faifa/Config.in"
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
new file mode 100644
index 0000000..99abaab
--- /dev/null
+++ b/package/faifa/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FAIFA
+	bool "faifa"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Faifa can configure any Intellon-based Power Line Communication device
+	  using Intellon INT5000 and INT6000 series chips (6000 and 6300 chips). It
+	  supports all Intellon-specific management and control frames as well as
+	  standard management frames.
+
+	  https://dev.open-plc.org
+
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
new file mode 100644
index 0000000..50c4240
--- /dev/null
+++ b/package/faifa/faifa.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# faifa
+#
+################################################################################
+
+FAIFA_VERSION = aa0b5f90b89a9fd1533137b68ebf85f5437aba53
+FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
+FAIFA_INSTALL_STAGING = YES
+FAIFA_DEPENDENCIES = libpcap
+FAIFA_LICENSE = GPLv2
+FAIFA_LICENSE_FILES = COPYING
+FAIFA_AUTORECONF=YES
+
+define FAIFA_INSTALL_TARGET_CMDS
+    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+        PREFIX=/usr \
+        STRIP=/bin/true \
+        DESTDIR=$(TARGET_DIR) \
+        install
+endef
+
+define FAIFA_INSTALL_STAGING_CMDS
+    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+        PREFIX=/usr \
+        STRIP=/bin/true \
+        DESTDIR=$(STAGING_DIR) \
+        install
+endef
+
+$(eval $(autotools-package))
-- 
1.9.2
