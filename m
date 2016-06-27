From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Mon, 27 Jun 2016 17:18:28 +0200
Subject: [Buildroot] [PATCH 3/4] ajtcl: new package
Message-ID: <20390_1467040718_577143CE_20390_5576_1_9bcd6009-a0eb-41a1-a31a-dd6fd4a34e7d@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AllJoyn framework defines a common way for devices and apps to
communicate with one another regardless of brands, categories,
transports, and OSes. Developers write applications that discover
nearby devices, and communicate with each other directly and through
the cloud, unleashing new possibilities in the Internet of Things.

AllJoyn Thin Core Library (AJTCL) is designed to bring the benefits
of the AllJoyn distributed programming environment to embedded
systems.

https://allseenalliance.org

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in        |  1 +
 package/ajtcl/Config.in  | 18 ++++++++++++++++++
 package/ajtcl/ajtcl.hash |  2 ++
 package/ajtcl/ajtcl.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/ajtcl/Config.in
 create mode 100644 package/ajtcl/ajtcl.hash
 create mode 100644 package/ajtcl/ajtcl.mk

diff --git a/package/Config.in b/package/Config.in
index 5cde173..d262ff7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1123,6 +1123,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/ajtcl/Config.in"
 	source "package/alljoyn/Config.in"
 	source "package/alljoyn-base/Config.in"
 	source "package/batman-adv/Config.in"
diff --git a/package/ajtcl/Config.in b/package/ajtcl/Config.in
new file mode 100644
index 0000000..3f2e573
--- /dev/null
+++ b/package/ajtcl/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_AJTCL
+	bool "alljoyn-thin-core"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The AllJoyn framework defines a common way for devices and apps to
+	  communicate with one another regardless of brands, categories,
+	  transports, and OSes. Developers write applications that discover
+	  nearby devices, and communicate with each other directly and through
+	  the cloud, unleashing new possibilities in the Internet of Things.
+
+	  AllJoyn Thin Core Library (AJTCL) is designed to bring the benefits
+	  of the AllJoyn distributed programming environment to embedded
+	  systems.
+
+	  https://allseenalliance.org
+
+comment "alljoyn-thin-core needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ajtcl/ajtcl.hash b/package/ajtcl/ajtcl.hash
new file mode 100644
index 0000000..a1cdf16
--- /dev/null
+++ b/package/ajtcl/ajtcl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	ce6a05a67ff405ba6274e85fe750d98f40cbe7ab2c968218c7741a10bd86e21a	ajtcl-16.04.00-src.tar.gz
diff --git a/package/ajtcl/ajtcl.mk b/package/ajtcl/ajtcl.mk
new file mode 100644
index 0000000..d74be97
--- /dev/null
+++ b/package/ajtcl/ajtcl.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# ajtcl
+#
+################################################################################
+
+AJTCL_REV = 16.04
+AJTCL_VERSION = $(AJTCL_REV).00
+AJTCL_SOURCE = ajtcl-$(AJTCL_VERSION)-src.tar.gz
+AJTCL_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(AJTCL_REV)
+# See https://allseenalliance.org/alliance/ip-policy
+AJTCL_LICENSE = ISC
+# AllJoyn Thin Core does not provide any license files with source code
+# AJTCL_LICENSE_FILES = 
+
+AJTCL_DEPENDENCIES = host-scons
+AJTCL_INSTALL_STAGING = YES
+
+# AllJoyn Thin Core can be compiled in debug or release mode. By default,
+# AllJoyn Thin Core is built in debug mode.
+AJTCL_VARIANT = release
+
+AJTCL_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS) \
+	V=1 \
+	VARIANT=$(AJTCL_VARIANT) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)"
+
+define AJTCL_BUILD_CMDS
+	cd $(@D); $(SCONS) $(AJTCL_SCONS_OPTS)
+endef
+
+define AJTCL_INSTALL_STAGING_CMDS
+	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
+	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
+endef
+
+# Only install AllJoyn Thin Core dynamic libraries into target directory
+define AJTCL_INSTALL_TARGET_CMDS
+	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.7.4


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
