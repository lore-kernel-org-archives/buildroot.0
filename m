From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:30:58 +0200
Subject: [Buildroot] [git commit] faifa: new package
Message-ID: <20140608163130.229C49CF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bd7eb8effd898e796d77986c53e9520807d34ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

faifa is a library and a cli used to manage PLC hardware that use
Intellon chipset.  Almost everybody use theses chips nowadays.

[Thomas: license is GPLv2+, not GPLv2. Fix indentation. Add dependency
on host-autoconf and a comment to explain what's going on. Fix
indentation of target/staging installation commands. Mark the package
as not available for static library builds as it always build a shared
library. Rewrap Config.in help text.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/faifa/Config.in |   15 +++++++++++++++
 package/faifa/faifa.mk  |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 763f148..d73eaed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -916,6 +916,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/faifa/Config.in"
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
new file mode 100644
index 0000000..2acd505
--- /dev/null
+++ b/package/faifa/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FAIFA
+	bool "faifa"
+	select BR2_PACKAGE_LIBPCAP
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Faifa can configure any Intellon-based Power Line
+	  Communication device using Intellon INT5000 and INT6000
+	  series chips (6000 and 6300 chips). It supports all
+	  Intellon-specific management and control frames as well as
+	  standard management frames.
+
+	  https://dev.open-plc.org
+
+comment "faifa needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
new file mode 100644
index 0000000..8f5d258
--- /dev/null
+++ b/package/faifa/faifa.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# faifa
+#
+################################################################################
+
+FAIFA_VERSION = aa0b5f90b89a9fd1533137b68ebf85f5437aba53
+FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
+FAIFA_INSTALL_STAGING = YES
+FAIFA_DEPENDENCIES = libpcap host-autoconf
+FAIFA_LICENSE = GPLv2+
+FAIFA_LICENSE_FILES = COPYING
+
+# This package uses autoconf, but not automake, so we need to call
+# their special autogen.sh script, and have custom target and staging
+# installation commands.
+
+define FAIFA_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+FAIFA_PRE_CONFIGURE_HOOKS += FAIFA_RUN_AUTOGEN
+
+define FAIFA_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr \
+		STRIP=/bin/true \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
+
+define FAIFA_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr \
+		STRIP=/bin/true \
+		DESTDIR=$(STAGING_DIR) \
+		install
+endef
+
+$(eval $(autotools-package))
