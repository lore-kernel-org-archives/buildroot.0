From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 May 2014 23:18:16 +0200
Subject: [Buildroot] [PATCH] faifa: new package
Message-ID: <1399151896-20703-1-git-send-email-maxime.hadjinlian@gmail.com>
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
index 0000000..cd38598
--- /dev/null
+++ b/package/faifa/faifa.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# faifa
+#
+################################################################################
+
+FAIFA_VERSION = master
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
