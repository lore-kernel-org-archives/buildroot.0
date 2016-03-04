From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Fri, 4 Mar 2016 16:15:47 +0100
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
Message-ID: <19328_1457104555_56D9A6AB_19328_989_1_edaf41c4-ad3f-447b-914b-0d7a5d0b74d0@OPEXCLILM31.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Free software library that interfaces with selected Z-Wave PC controllers,
allowing anyone to create applications that manipulate and respond to devices on
a Z-Wave network, without requiring in-depth knowledge of the Z-Wave protocol

Signed-off-by: Fabrice FONTAINE <fabrice.fontaine@orange.com>
---
 package/Config.in              |  1 +
 package/openzwave/Config.in    | 17 +++++++++++++++++
 package/openzwave/openzwave.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/openzwave/Config.in
 create mode 100644 package/openzwave/openzwave.mk

diff --git a/package/Config.in b/package/Config.in
index 3c6e448..d729750 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1155,6 +1155,7 @@ menu "Networking"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
+	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
new file mode 100644
index 0000000..3c6cba5
--- /dev/null
+++ b/package/openzwave/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OPENZWAVE
+	bool "openzwave"
+		depends on BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_INSTALL_LIBSTDCPP
+		depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Free software library that interfaces with selected Z-Wave PC
+	  controllers, allowing anyone to create applications that manipulate
+	  and respond to devices on a Z-Wave network, without requiring
+	  in-depth knowledge of the Z-Wave protocol
+
+	  http://www.openzwave.net
+
+comment "openzwave needs udev and a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV
+
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
new file mode 100644
index 0000000..fc89bfa
--- /dev/null
+++ b/package/openzwave/openzwave.mk
@@ -0,0 +1,40 @@
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
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_ENV) PREFIX=/usr
+endef
+
+# Set pkgconfigdir to /usr/lib/pkgconfig to install libopenzwave.pc in the
+# correct directory otherwise openzwave will call
+# "pkg-config --variable pc_path pkg-config" which returns an incorrect value
+define OPENZWAVE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_ENV) \
+		PREFIX=/usr DESTDIR=$(STAGING_DIR) \
+		pkgconfigdir=/usr/lib/pkgconfig \
+		install
+endef
+
+define OPENZWAVE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_ENV) \
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) \
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
