From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Wed, 29 Jun 2016 09:10:13 +0200
Subject: [Buildroot] [PATCH 1/4] alljoyn: new package
Message-ID: <20939_1467184224_57737460_20939_8004_1_f44dcc70-6b83-4a10-9e0e-494a4c74c46d@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
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

https://allseenalliance.org

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in            |  1 +
 package/alljoyn/Config.in    | 18 +++++++++++
 package/alljoyn/alljoyn.hash |  2 ++
 package/alljoyn/alljoyn.mk   | 77 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)
 create mode 100644 package/alljoyn/Config.in
 create mode 100644 package/alljoyn/alljoyn.hash
 create mode 100644 package/alljoyn/alljoyn.mk

diff --git a/package/Config.in b/package/Config.in
index e5ddc3e..9dc58c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/alljoyn/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
new file mode 100644
index 0000000..22a0ff8
--- /dev/null
+++ b/package/alljoyn/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ALLJOYN
+	bool "alljoyn"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBCAP
+	help
+	  The AllJoyn framework defines a common way for devices and apps to
+	  communicate with one another regardless of brands, categories,
+	  transports, and OSes. Developers write applications that discover
+	  nearby devices, and communicate with each other directly and through
+	  the cloud, unleashing new possibilities in the Internet of Things.
+
+	  https://allseenalliance.org
+
+comment "alljoyn needs a toolchain w/ C++, threads and wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/alljoyn/alljoyn.hash b/package/alljoyn/alljoyn.hash
new file mode 100644
index 0000000..e18d66e
--- /dev/null
+++ b/package/alljoyn/alljoyn.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	41bd424d376d22dc2b48cc035400bd63595d19467eeb6a7ae81429f5a43ed2e2	alljoyn-16.04.00-src.tar.gz
diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
new file mode 100644
index 0000000..272dd18
--- /dev/null
+++ b/package/alljoyn/alljoyn.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# alljoyn
+#
+################################################################################
+
+ALLJOYN_REV = 16.04
+ALLJOYN_VERSION = $(ALLJOYN_REV).00
+ALLJOYN_SOURCE = alljoyn-$(ALLJOYN_VERSION)-src.tar.gz
+ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
+# See https://allseenalliance.org/alliance/ip-policy
+ALLJOYN_LICENSE = ISC
+# AllJoyn does not provide any license files with source code
+# ALLJOYN_LICENSE_FILES = 
+
+ALLJOYN_DEPENDENCIES = host-scons libcap
+ALLJOYN_INSTALL_STAGING = YES
+
+# If BR2_PACKAGE_OPENSSL is set, use openssl otherwise use builtin crypto
+ifeq ($(BR2_PACKAGE_OPENSSL), y)
+ALLJOYN_DEPENDENCIES += openssl
+ALLJOYN_CRYPTO = openssl
+else
+ALLJOYN_CRYPTO = builtin
+endif
+
+# AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
+# in debug mode.
+ALLJOYN_VARIANT = release
+
+ALLJOYN_BINDINGS = c,cpp
+
+# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
+# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
+# otherwise compilation will fail.
+# CROSS_COMPILE option should not be used as it works only for linux/ARM.
+ALLJOYN_OS = openwrt
+ALLJOYN_CPU = openwrt
+
+# AllJoyn install everything in this relative path
+ALLJOYN_DISTDIR = /build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist/
+
+ALLJOYN_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS) \
+	V=1 \
+	OS=$(ALLJOYN_OS) \
+	CPU=$(ALLJOYN_CPU) \
+	VARIANT=$(ALLJOYN_VARIANT) \
+	BR=off \
+	CRYPTO=$(ALLJOYN_CRYPTO) \
+	BINDINGS=$(ALLJOYN_BINDINGS) \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LINKFLAGS="$(TARGET_LINKFLAGS)" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CXX="$(TARGET_CXX)" \
+	TARGET_LD="$(TARGET_LD)" \
+	TARGET_LINK="$(TARGET_CXX)" \
+	TARGET_AR="$(TARGET_AR)" \
+	TARGET_RANLIB="$(TARGET_RANLIB)" \
+	TARGET_PATH="$(BR_PATH)"
+
+define ALLJOYN_BUILD_CMDS
+	cd $(@D); $(SCONS) $(ALLJOYN_SCONS_OPTS)
+endef
+
+define ALLJOYN_INSTALL_STAGING_CMDS
+	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib* $(STAGING_DIR)/usr/lib/
+	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/inc/* $(STAGING_DIR)/usr/include/
+endef
+
+# Only install alljoyn dynamic libraries into target directory
+define ALLJOYN_INSTALL_TARGET_CMDS
+	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib*.so* $(TARGET_DIR)/usr/lib/
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
