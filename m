From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 24 Aug 2012 10:39:54 +0100
Subject: [Buildroot] [PATCH] schifra: new package
Message-ID: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in          |    1 +
 package/schifra/Config.in  |   18 ++++++++++++++++
 package/schifra/schifra.mk |   50 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 package/schifra/Config.in
 create mode 100644 package/schifra/schifra.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..993a5ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -464,6 +464,7 @@ source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
+source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/schifra/Config.in b/package/schifra/Config.in
new file mode 100644
index 0000000..466ac0e
--- /dev/null
+++ b/package/schifra/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_SCHIFRA
+	bool "schifra"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Schifra is a very robust, highly optimized and extremely configurable
+	  Reed-Solomon error correcting code library for both software and IP
+	  core based applications with implementations in C++ and VHDL.
+
+	  http://www.schifra.com/
+
+config BR2_PACKAGE_SCHIFRA_EXAMPLES
+	bool "schifra examples"
+	depends on BR2_PACKAGE_SCHIFRA
+	help
+	  Build and install the schifra example applications.
+
+comment "schifra requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
new file mode 100644
index 0000000..e97dede
--- /dev/null
+++ b/package/schifra/schifra.mk
@@ -0,0 +1,50 @@
+#############################################################
+#
+# schifra
+#
+#############################################################
+SCHIFRA_VERSION = 0.0.1
+SCHIFRA_SITE = http://www.schifra.com/downloads
+SCHIFRA_SOURCE = schifra.tgz
+SCHIFRA_INSTALL_STAGING = YES
+SCHIFRA_LICENSE = schifra license
+SCHIFRA_LICENSE_FILES = schifra_license.txt
+
+SCHIFRA_MAKE_OPT = COMPILER="$(TARGET_CXX)"
+
+# The examples are the only buildable artefacts.
+ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
+define SCHIFRA_BUILD_CMDS
+	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) all
+endef
+endif
+
+define SCHIFRA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/include $(@D)/schifra_*.hpp
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
+	for i in `find $(@D) -type f -name 'schifra_*' -executable` ; \
+	do \
+		$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin $$i ; \
+	done
+endef
+
+define SCHIFRA_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include $(@D)/schifra_*.hpp
+endef
+
+define SCHIFRA_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/include/schifra_*.hpp
+	$(RM) $(TARGET_DIR)/usr/bin/schifra_*
+endef
+
+define SCHIFRA_UNINSTALL_STAGING_CMDS
+	$(RM) $(STAGING_DIR)/usr/include/schifra_*.hpp
+endef
+
+define SCHIFRA_CLEAN_CMDS
+	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
