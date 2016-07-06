From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Jul 2016 14:08:48 +0200
Subject: [Buildroot] [PATCH v2,1/4] alljoyn: new package
Message-ID: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
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
Changes v1 -> v2 (after review of Romain Naour):
 - Add dependencies on BR2_USE_MMU and !BR2_STATIC_LIBS
 - Select BR2_PACKAGE_OPENSSL and never use builtin crypto library
 - Remove unneeded comments on ALLJOYN_LICENSE_FILES

 package/Config.in            |  1 +
 package/alljoyn/Config.in    | 22 ++++++++++++++
 package/alljoyn/alljoyn.hash |  2 ++
 package/alljoyn/alljoyn.mk   | 69 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 package/alljoyn/Config.in
 create mode 100644 package/alljoyn/alljoyn.hash
 create mode 100644 package/alljoyn/alljoyn.mk

diff --git a/package/Config.in b/package/Config.in
index 6cc1d3e..77d8fb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1125,6 +1125,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/alljoyn/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
new file mode 100644
index 0000000..eebc3e3
--- /dev/null
+++ b/package/alljoyn/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_ALLJOYN
+	bool "alljoyn"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The AllJoyn framework defines a common way for devices and apps to
+	  communicate with one another regardless of brands, categories,
+	  transports, and OSes. Developers write applications that discover
+	  nearby devices, and communicate with each other directly and through
+	  the cloud, unleashing new possibilities in the Internet of Things.
+
+	  https://allseenalliance.org
+
+comment "alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
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
index 0000000..3d9bdee
--- /dev/null
+++ b/package/alljoyn/alljoyn.mk
@@ -0,0 +1,69 @@
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
+
+ALLJOYN_DEPENDENCIES = host-scons libcap openssl
+ALLJOYN_INSTALL_STAGING = YES
+
+ALLJOYN_CRYPTO = openssl
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
