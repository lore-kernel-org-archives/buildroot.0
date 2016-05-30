From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 17:41:15 +0200
Subject: [Buildroot] [git commit branch/next] openzwave: new package
Message-ID: <20160530154134.D3051804C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f8fcca593d7c0b4d2b9c39b96887819682d7dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Free software library that interfaces with selected Z-Wave PC
controllers, allowing anyone to create applications that manipulate and
respond to devices on a Z-Wave network, without requiring in-depth
knowledge of the Z-Wave protocol

[Peter: also pass DOXYGEN=, add _MAKE_OPTS and use for build+install]
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |  1 +
 ...ix-warning-on-wcsdup-implicit-declaration.patch | 29 ++++++++++++
 .../0002-Ensure-correct-git-repository-path.patch  | 29 ++++++++++++
 package/openzwave/Config.in                        | 17 ++++++++
 package/openzwave/openzwave.hash                   |  2 +
 package/openzwave/openzwave.mk                     | 51 ++++++++++++++++++++++
 6 files changed, 129 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1e4f5c7..22aa881 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1181,6 +1181,7 @@ menu "Networking"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
+	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
diff --git a/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch b/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
new file mode 100644
index 0000000..1fe30e4
--- /dev/null
+++ b/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
@@ -0,0 +1,29 @@
+From 0878d933223158343af3fe13e03bcd128e8b4cbc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Fri, 22 Apr 2016 17:06:27 +0200
+Subject: [PATCH 1/1] Fix warning on wcsdup implicit declaration
+
+Define __GNU_SOURCE in cpp/hidapi/linux/hid.c (like already done in
+cpp/hidapi/libusb/hid.c) to fix implicit declaration of wcsdup function
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ cpp/hidapi/linux/hid.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cpp/hidapi/linux/hid.c b/cpp/hidapi/linux/hid.c
+index dbf9b9b..c3eb22b 100644
+--- a/cpp/hidapi/linux/hid.c
++++ b/cpp/hidapi/linux/hid.c
+@@ -21,6 +21,8 @@
+         http://github.com/signal11/hidapi .
+ ********************************************************/
+ 
++#define _GNU_SOURCE /* needed for wcsdup() before glibc 2.10 */
++
+ /* C */
+ #include <stdio.h>
+ #include <string.h>
+-- 
+1.9.1
+
diff --git a/package/openzwave/0002-Ensure-correct-git-repository-path.patch b/package/openzwave/0002-Ensure-correct-git-repository-path.patch
new file mode 100644
index 0000000..6c40ec9
--- /dev/null
+++ b/package/openzwave/0002-Ensure-correct-git-repository-path.patch
@@ -0,0 +1,29 @@
+From 89cdc83307f61422db21cc7965ea294862c128bf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 30 May 2016 10:37:42 +0200
+Subject: [PATCH 2/2] Ensure correct git repository path
+
+Add "--git-dir ./.git" to ensure the correct git repository path is used (this
+fix a bug when trying to add openzwave to buildroot build system)
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ cpp/build/support.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpp/build/support.mk b/cpp/build/support.mk
+index 3f74c7e..f529b25 100644
+--- a/cpp/build/support.mk
++++ b/cpp/build/support.mk
+@@ -29,7 +29,7 @@ GIT		:= $(shell which git)
+ ifeq ($(GIT),)
+ VERSION_REV ?= 0
+ else
+-GITVERSION	:= $(shell $(GIT) describe --long --tags --dirty 2>/dev/null | sed s/^v//)
++GITVERSION	:= $(shell $(GIT) --git-dir ./.git describe --long --tags --dirty 2>/dev/null | sed s/^v//)
+ ifeq ($(GITVERSION),)
+ GITVERSION	:= $(VERSION_MAJ).$(VERSION_MIN).-1
+ VERSION_REV	:= 0
+-- 
+2.7.4
+
diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
new file mode 100644
index 0000000..190b88b
--- /dev/null
+++ b/package/openzwave/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OPENZWAVE
+	bool "openzwave"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_WCHAR
+	help
+	  Free software library that interfaces with selected Z-Wave PC
+	  controllers, allowing anyone to create applications that manipulate
+	  and respond to devices on a Z-Wave network, without requiring
+	  in-depth knowledge of the Z-Wave protocol
+
+	  http://www.openzwave.net
+
+comment "openzwave needs udev and a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
new file mode 100644
index 0000000..bab940e
--- /dev/null
+++ b/package/openzwave/openzwave.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f	openzwave-v1.4.tar.gz
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
new file mode 100644
index 0000000..c8892a9
--- /dev/null
+++ b/package/openzwave/openzwave.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# openzwave
+#
+################################################################################
+
+OPENZWAVE_VERSION = v1.4
+OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
+OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
+OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
+	license/gpl.txt license/Apache-License-2.0.txt
+
+OPENZWAVE_DEPENDENCIES = host-pkgconf udev
+OPENZWAVE_INSTALL_STAGING = YES
+
+# Set instlibdir to install libopenzwave.so* in the correct directory
+# otherwise openzwave will check that /lib64 exists (on the host) to
+# know if the library should be installed in $(PREFIX)/lib or $(PREFIX)/lib64.
+# Set pkgconfigdir to /lib/pkgconfig to install libopenzwave.pc in the
+# correct directory otherwise openzwave will call
+# "pkg-config --variable pc_path pkg-config" which returns an incorrect value.
+# Set sysconfdir to /etc/openzwave to install openzwave configuration files in
+# the correct directory otherwise openzwave will install configuration files in
+# $(PREFIX)/etc/openzwave.
+# Disable doxygen documentation.
+OPENZWAVE_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	PREFIX=/usr \
+	instlibdir=/usr/lib \
+	pkgconfigdir=/usr/lib/pkgconfig \
+	sysconfdir=/etc/openzwave \
+	DOXYGEN=
+
+define OPENZWAVE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENZWAVE_MAKE_OPTS) -C $(@D)
+endef
+
+define OPENZWAVE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENZWAVE_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install
+endef
+
+# Delete unneeded ozw_config binary from target directory as this is an utility
+# application used to get the openzwave build configuration.
+define OPENZWAVE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENZWAVE_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+	rm -f $(TARGET_DIR)/usr/bin/ozw_config
+endef
+
+$(eval $(generic-package))
