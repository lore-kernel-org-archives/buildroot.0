From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Fri, 22 Apr 2016 15:37:13 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
Message-ID: <18817_1461332237_571A290D_18817_166_1_2755fadc-734a-4406-9dc4-803d4a6efb54@OPEXCLILM32.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Free software library that interfaces with selected Z-Wave PC
controllers, allowing anyone to create applications that manipulate and
respond to devices on a Z-Wave network, without requiring in-depth
knowledge of the Z-Wave protocol

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/0001-fix-wcsdup.patch  | 11 +++++++++++
 package/Config.in              |  1 +
 package/openzwave/Config.in    | 18 ++++++++++++++++++
 package/openzwave/openzwave.mk | 43 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/0001-fix-wcsdup.patch
 create mode 100644 package/openzwave/Config.in
 create mode 100644 package/openzwave/openzwave.mk

diff --git a/package/0001-fix-wcsdup.patch b/package/0001-fix-wcsdup.patch
new file mode 100644
index 0000000..f0807df
--- /dev/null
+++ b/package/0001-fix-wcsdup.patch
@@ -0,0 +1,11 @@
+diff -Naurp openzwave-v1.4/cpp/hidapi/linux/hid.c openzwave-v1.4-wcsdup/cpp/hidapi/linux/hid.c
+--- openzwave-v1.4/cpp/hidapi/linux/hid.c	2016-04-22 15:17:56.753232758 +0200
++++ openzwave-v1.4-wcsdup/cpp/hidapi/linux/hid.c	2016-04-22 15:18:11.161482711 +0200
+@@ -21,6 +21,7 @@
+         http://github.com/signal11/hidapi .
+ ********************************************************/
+ 
++#define _GNU_SOURCE
+ /* C */
+ #include <stdio.h>
+ #include <string.h>
diff --git a/package/Config.in b/package/Config.in
index 5103621..cf697ab 100644
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
index 0000000..d959ae6
--- /dev/null
+++ b/package/openzwave/Config.in
@@ -0,0 +1,18 @@
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
+
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
new file mode 100644
index 0000000..e6a4bd6
--- /dev/null
+++ b/package/openzwave/openzwave.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# openzwave
+#
+################################################################################
+
+OPENZWAVE_VERSION = v1.4
+OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
+
+# The OpenZWave Library is distributed under the LGPL Version 3 license.
+# The Example Programs and some support files are distributed under
+# different licenses.
+OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
+OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
+	license/gpl.txt license/Apache-License-2.0.txt
+
+OPENZWAVE_DEPENDENCIES = host-pkgconf udev
+OPENZWAVE_INSTALL_STAGING = YES
+
+define OPENZWAVE_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+endef
+
+# Set pkgconfigdir to /usr/lib/pkgconfig to install libopenzwave.pc in the
+# correct directory otherwise openzwave will call
+# "pkg-config --variable pc_path pkg-config" which returns an incorrect value
+define OPENZWAVE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(STAGING_DIR) \
+		pkgconfigdir=/usr/lib/pkgconfig \
+		install
+endef
+
+# Apply the same trick on pkgconfigdir even if libopenzwave.pc is not useful in
+# release directory 
+define OPENZWAVE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) \
+		pkgconfigdir=/usr/lib/pkgconfig \
+		install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
