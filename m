From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 20 Apr 2016 15:38:11 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
Message-ID: <1461159491-14317-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in                |  1 +
 package/openzwave/Config.in      | 15 +++++++++++++++
 package/openzwave/openzwave.hash |  2 ++
 package/openzwave/openzwave.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/openzwave/Config.in
 create mode 100644 package/openzwave/openzwave.hash
 create mode 100644 package/openzwave/openzwave.mk

diff --git a/package/Config.in b/package/Config.in
index ecaf164..25fa0d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1171,6 +1171,7 @@ menu "Networking"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
+	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
new file mode 100644
index 0000000..3ae0959
--- /dev/null
+++ b/package/openzwave/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_OPENZWAVE
+	bool "openzwave"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # use wchar_t
+	help
+	   OpenZwave is a free software library that interfaces with selected Z-Wave
+	   PC controllers, allowing anyone to create applications that manipulate
+	   and respond to devices on a Z-Wave network, without requiring in-depth
+	   knowledge of the Z-Wave protocol.
+
+comment "openzwave needs udev /dev management and a toolchain w/ C++, threads, wchar"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
new file mode 100644
index 0000000..4291e76
--- /dev/null
+++ b/package/openzwave/openzwave.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f openzwave-v1.4.tar.gz 
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
new file mode 100644
index 0000000..aa96b0c
--- /dev/null
+++ b/package/openzwave/openzwave.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# openzwave
+#
+################################################################################
+
+OPENZWAVE_VERSION = v1.4
+OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
+OPENZWAVE_LICENSE = LGPLv3+ (library), GPLv3+ (test programs), Apache-2.0
+OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt license/gpl.txt \
+			  license/Apache-License-2.0.txt
+OPENZWAVE_DEPENDENCIES = udev
+
+define OPENZWAVE_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+endef
+
+define OPENZWAVE_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define OPENZWAVE_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.1
