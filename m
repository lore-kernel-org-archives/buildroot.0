From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:29:35 +0200
Subject: [Buildroot] [git commit] alljoyn-tcl-base: new package
Message-ID: <20160720203107.B12BB803CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3a8e11cf170271566094fc15adedeb02abc4b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AllJoyn Base Services are common services used by many devices,
providing a set of interfaces for different devices to interact and
interoperate with one another.

Thin Client Library is designed to bring the benefits of the AllJoyn
distributed programming environment to embedded systems.

https://allseenalliance.org

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/alljoyn-tcl-base/Config.in             | 18 +++++++++++
 package/alljoyn-tcl-base/alljoyn-tcl-base.hash |  2 ++
 package/alljoyn-tcl-base/alljoyn-tcl-base.mk   | 45 ++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b0083ea..6a84f9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1140,6 +1140,7 @@ menu "Networking"
 	source "package/alljoyn/Config.in"
 	source "package/alljoyn-base/Config.in"
 	source "package/alljoyn-tcl/Config.in"
+	source "package/alljoyn-tcl-base/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/alljoyn-tcl-base/Config.in b/package/alljoyn-tcl-base/Config.in
new file mode 100644
index 0000000..ebc3370
--- /dev/null
+++ b/package/alljoyn-tcl-base/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ALLJOYN_TCL_BASE
+	bool "alljoyn-tcl-base"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alljoyn-tcl
+	select BR2_PACKAGE_ALLJOYN_TCL
+	help
+	  AllJoyn Base Services are common services used by many
+	  devices, providing a set of interfaces for different devices
+	  to interact and interoperate with one another.
+
+	  Thin Client Library is designed to bring the benefits of the
+	  AllJoyn distributed programming environment to embedded
+	  systems.
+
+	  https://allseenalliance.org
+
+comment "alljoyn-tcl-base needs a toolchain w/ threads and dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/alljoyn-tcl-base/alljoyn-tcl-base.hash b/package/alljoyn-tcl-base/alljoyn-tcl-base.hash
new file mode 100644
index 0000000..882839d
--- /dev/null
+++ b/package/alljoyn-tcl-base/alljoyn-tcl-base.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	741f7a71929ccd6a66bf75d2b03affc62411e229b70bb89399be9b1b2ce40629	alljoyn-base_tcl-16.04.00.tar.gz
diff --git a/package/alljoyn-tcl-base/alljoyn-tcl-base.mk b/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
new file mode 100644
index 0000000..461cd09
--- /dev/null
+++ b/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# alljoyn-tcl-base
+#
+################################################################################
+
+ALLJOYN_TCL_BASE_REV = 16.04
+ALLJOYN_TCL_BASE_VERSION = $(ALLJOYN_TCL_BASE_REV).00
+ALLJOYN_TCL_BASE_SOURCE = alljoyn-base_tcl-$(ALLJOYN_TCL_BASE_VERSION).tar.gz
+ALLJOYN_TCL_BASE_SITE = \
+	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_BASE_REV)
+# See https://allseenalliance.org/alliance/ip-policy
+ALLJOYN_TCL_BASE_LICENSE = ISC
+
+ALLJOYN_TCL_BASE_DEPENDENCIES = host-scons alljoyn-tcl
+ALLJOYN_TCL_BASE_INSTALL_STAGING = YES
+
+# AllJoyn Base Thin Core can be compiled in debug or release mode. By default,
+# AllJoyn Base Thin Core is built in debug mode.
+ALLJOYN_TCL_BASE_VARIANT = release
+
+ALLJOYN_TCL_BASE_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS) \
+	V=1 \
+	VARIANT=$(ALLJOYN_TCL_BASE_VARIANT) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	AJTCL_DIST=$(STAGING_DIR) \
+	WS=off
+
+define ALLJOYN_TCL_BASE_BUILD_CMDS
+	cd $(@D); $(SCONS) $(ALLJOYN_TCL_BASE_SCONS_OPTS)
+endef
+
+define ALLJOYN_TCL_BASE_INSTALL_STAGING_CMDS
+	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
+	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
+endef
+
+# Only install AllJoyn Base Thin Core dynamic libraries into target directory
+define ALLJOYN_TCL_BASE_INSTALL_TARGET_CMDS
+	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
