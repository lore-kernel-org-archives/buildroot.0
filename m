From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:16:02 +0200
Subject: [Buildroot] [git commit] alljoyn-base: new package
Message-ID: <20160720201752.51E59818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb647767611e52b9397d9b076ba7ae60ecb899db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AllJoyn Base Services are common services used by many devices,
providing a set of interfaces for different devices to interact and
interoperate with one another.

https://allseenalliance.org

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - Add dependency on BR2_TOOLCHAIN_HAS_SYNC_4, inherited from the
   alljoyn package.
 - select BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL when neither
   BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION nor
   BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING are selected. This ensures that
   the package will at least build and install one thing.
 - rename the Config.in option prompts from "alljoyn-<foo>" to just
   "<foo>"
 - rework the build command to use a loop rather than duplicate code
 - rework the install command to also use a loop, and to not discard
   errors.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/alljoyn-base/Config.in         | 51 +++++++++++++++++++
 package/alljoyn-base/alljoyn-base.hash |  2 +
 package/alljoyn-base/alljoyn-base.mk   | 92 ++++++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 009b828..97a1bf8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1138,6 +1138,7 @@ endmenu
 menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/alljoyn/Config.in"
+	source "package/alljoyn-base/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
new file mode 100644
index 0000000..8556d66
--- /dev/null
+++ b/package/alljoyn-base/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_ALLJOYN_BASE
+	bool "alljoyn-base"
+	depends on BR2_USE_MMU # alljoyn
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # alljoyn
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # alljoyn
+	select BR2_PACKAGE_ALLJOYN
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL if \
+		!BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION && \
+		!BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
+	help
+
+	  AllJoyn Base Services are common services used by many
+	  devices, providing a set of interfaces for different devices
+	  to interact and interoperate with one another.
+
+	  https://allseenalliance.org
+
+if BR2_PACKAGE_ALLJOYN_BASE
+
+config BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL
+	bool "controlpanel"
+	help
+	  Enable AllJoyn Control Panel base service which allows
+	  devices to advertise a virtual control panel to be
+	  controlled remotely.
+
+config BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION
+	bool "notification"
+	help
+	  Enable AllJoyn Notification base service which allows
+	  text-based notifications to be sent and received by devices
+	  on the AllJoyn network. Also supports audio and images via
+	  URLs.
+
+config BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
+	bool "onboarding"
+	help
+	  Enable AllJoyn Onboarding base service which provides a
+	  consistent way to bring a new device onto the Wi-Fi network.
+
+endif # BR2_PACKAGE_ALLJOYN_BASE
+
+comment "alljoyn-base needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/alljoyn-base/alljoyn-base.hash b/package/alljoyn-base/alljoyn-base.hash
new file mode 100644
index 0000000..dbec3a3
--- /dev/null
+++ b/package/alljoyn-base/alljoyn-base.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	742f724b3a06c8fc4039591dba24871755728221ca5dc4afb78ebd9a7e3beb44	alljoyn-base-16.04.00.tar.gz
diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
new file mode 100644
index 0000000..bb07377
--- /dev/null
+++ b/package/alljoyn-base/alljoyn-base.mk
@@ -0,0 +1,92 @@
+################################################################################
+#
+# alljoyn-base
+#
+################################################################################
+
+ALLJOYN_BASE_REV = 16.04
+ALLJOYN_BASE_VERSION = $(ALLJOYN_BASE_REV).00
+ALLJOYN_BASE_SOURCE = alljoyn-base-$(ALLJOYN_BASE_VERSION).tar.gz
+ALLJOYN_BASE_SITE = \
+	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_BASE_REV)
+# See https://allseenalliance.org/alliance/ip-policy
+ALLJOYN_BASE_LICENSE = ISC
+
+ALLJOYN_BASE_DEPENDENCIES = host-scons alljoyn openssl
+ALLJOYN_BASE_INSTALL_STAGING = YES
+
+ALLJOYN_BASE_CRYPTO = openssl
+
+# AllJoyn can be compiled in debug or release mode. By default,
+# AllJoyn is built in debug mode.
+ALLJOYN_BASE_VARIANT = release
+
+ALLJOYN_BASE_BINDINGS = c,cpp
+
+# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
+# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
+# otherwise compilation will fail.
+# CROSS_COMPILE option should not be used as it works only for linux/ARM.
+ALLJOYN_BASE_OS = openwrt
+ALLJOYN_BASE_CPU = openwrt
+
+# AllJoyn install everything in this relative path
+ALLJOYN_BASE_DISTDIR = \
+	build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist
+
+ALLJOYN_BASE_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS) \
+	V=1 \
+	OS=$(ALLJOYN_BASE_OS) \
+	CPU=$(ALLJOYN_BASE_CPU) \
+	VARIANT=$(ALLJOYN_BASE_VARIANT) \
+	BR=off \
+	CRYPTO=$(ALLJOYN_BASE_CRYPTO) \
+	BINDINGS=$(ALLJOYN_BASE_BINDINGS) \
+	ALLJOYN_DISTDIR="$(STAGING_DIR)"\
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
+ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL), y)
+ALLJOYN_BASE_TARGETS += controlpanel
+endif
+
+ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION), y)
+ALLJOYN_BASE_TARGETS += notification
+endif
+
+ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING), y)
+ALLJOYN_BASE_TARGETS += onboarding
+endif
+
+define ALLJOYN_BASE_BUILD_CMDS
+	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
+		cd $(@D)/$(target); $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
+	)
+endef
+
+define ALLJOYN_BASE_INSTALL_STAGING_CMDS
+	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
+		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
+			$(STAGING_DIR)/usr/lib/
+		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/inc/* \
+			$(STAGING_DIR)/usr/include/
+	)
+endef
+
+define ALLJOYN_BASE_INSTALL_TARGET_CMDS
+	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
+		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
+			$(TARGET_DIR)/usr/lib/
+	)
+endef
+
+$(eval $(generic-package))
