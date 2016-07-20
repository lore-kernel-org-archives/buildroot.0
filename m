From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:21:48 +0200
Subject: [Buildroot] [git commit] alljoyn-tcl: new package
Message-ID: <20160720202756.E4D2F8042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a4df8327970f3c880d33b422a6762a480604635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/alljoyn-tcl/Config.in        | 20 +++++++++++++++++
 package/alljoyn-tcl/alljoyn-tcl.hash |  2 ++
 package/alljoyn-tcl/alljoyn-tcl.mk   | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 97a1bf8..b0083ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1139,6 +1139,7 @@ menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/alljoyn/Config.in"
 	source "package/alljoyn-base/Config.in"
+	source "package/alljoyn-tcl/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/alljoyn-tcl/Config.in b/package/alljoyn-tcl/Config.in
new file mode 100644
index 0000000..fe54af0
--- /dev/null
+++ b/package/alljoyn-tcl/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ALLJOYN_TCL
+	bool "alljoyn-tcl"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The AllJoyn framework defines a common way for devices and
+	  apps to communicate with one another regardless of brands,
+	  categories, transports, and OSes. Developers write
+	  applications that discover nearby devices, and communicate
+	  with each other directly and through the cloud, unleashing
+	  new possibilities in the Internet of Things.
+
+	  AllJoyn Thin Core Library (AJTCL) is designed to bring the
+	  benefits of the AllJoyn distributed programming environment
+	  to embedded systems.
+
+	  https://allseenalliance.org
+
+comment "alljoyn-tcl needs a toolchain w/ threads and dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/alljoyn-tcl/alljoyn-tcl.hash b/package/alljoyn-tcl/alljoyn-tcl.hash
new file mode 100644
index 0000000..a1cdf16
--- /dev/null
+++ b/package/alljoyn-tcl/alljoyn-tcl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	ce6a05a67ff405ba6274e85fe750d98f40cbe7ab2c968218c7741a10bd86e21a	ajtcl-16.04.00-src.tar.gz
diff --git a/package/alljoyn-tcl/alljoyn-tcl.mk b/package/alljoyn-tcl/alljoyn-tcl.mk
new file mode 100644
index 0000000..a5c7e4e
--- /dev/null
+++ b/package/alljoyn-tcl/alljoyn-tcl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# alljoyn-tcl
+#
+################################################################################
+
+ALLJOYN_TCL_REV = 16.04
+ALLJOYN_TCL_VERSION = $(ALLJOYN_TCL_REV).00
+ALLJOYN_TCL_SOURCE = ajtcl-$(ALLJOYN_TCL_VERSION)-src.tar.gz
+ALLJOYN_TCL_SITE = \
+	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_REV)
+# See https://allseenalliance.org/alliance/ip-policy
+ALLJOYN_TCL_LICENSE = ISC
+
+ALLJOYN_TCL_DEPENDENCIES = host-scons
+ALLJOYN_TCL_INSTALL_STAGING = YES
+
+# AllJoyn Thin Core can be compiled in debug or release mode. By default,
+# AllJoyn Thin Core is built in debug mode.
+ALLJOYN_TCL_VARIANT = release
+
+ALLJOYN_TCL_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS) \
+	V=1 \
+	VARIANT=$(ALLJOYN_TCL_VARIANT) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)"
+
+define ALLJOYN_TCL_BUILD_CMDS
+	cd $(@D); $(SCONS) $(ALLJOYN_TCL_SCONS_OPTS)
+endef
+
+define ALLJOYN_TCL_INSTALL_STAGING_CMDS
+	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
+	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
+endef
+
+# Only install AllJoyn Thin Core dynamic libraries into target directory
+define ALLJOYN_TCL_INSTALL_TARGET_CMDS
+	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
