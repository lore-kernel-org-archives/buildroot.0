From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Jul 2016 14:08:50 +0200
Subject: [Buildroot] [PATCH v2,3/4] ajtcl: new package
In-Reply-To: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
References: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1467806931-9880-3-git-send-email-fabrice.fontaine@orange.com>
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
Changes v1 -> v2 (after review of Romain Naour):
 - Add dependencies on !BR2_STATIC_LIBS
 - Remove unneeded comments on ALLJOYN_LICENSE_FILES

 package/Config.in        |  1 +
 package/ajtcl/Config.in  | 19 +++++++++++++++++++
 package/ajtcl/ajtcl.hash |  2 ++
 package/ajtcl/ajtcl.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/ajtcl/Config.in
 create mode 100644 package/ajtcl/ajtcl.hash
 create mode 100644 package/ajtcl/ajtcl.mk

diff --git a/package/Config.in b/package/Config.in
index 8b50ebb..4120b0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1125,6 +1125,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/ajtcl/Config.in"
 	source "package/alljoyn/Config.in"
 	source "package/alljoyn-base/Config.in"
 	source "package/batman-adv/Config.in"
diff --git a/package/ajtcl/Config.in b/package/ajtcl/Config.in
new file mode 100644
index 0000000..793e778
--- /dev/null
+++ b/package/ajtcl/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_AJTCL
+	bool "alljoyn-thin-core"
+	depends on !BR2_STATIC_LIBS
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
+comment "alljoyn-thin-core needs a toolchain w/ threads and dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
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
index 0000000..018a8bd
--- /dev/null
+++ b/package/ajtcl/ajtcl.mk
@@ -0,0 +1,42 @@
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
