From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Sep 2012 10:45:19 +0200
Subject: [Buildroot] [git commit] schifra: new package
Message-ID: <20120910084611.1667099601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48a68499d17a730fdf83934f5e9032eb373c596d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor fixes/cleanups]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/schifra/Config.in  |   18 ++++++++++++++
 package/schifra/schifra.mk |   55 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7fd26a5..441159d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ source "package/mtdev2tuio/Config.in"
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
index 0000000..0285b62
--- /dev/null
+++ b/package/schifra/schifra.mk
@@ -0,0 +1,55 @@
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
+SCHIFRA_MAKE_OPT = COMPILER="$(TARGET_CXX)" \
+		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o"
+
+# The examples are the only buildable artefacts.
+ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
+define SCHIFRA_BUILD_CMDS
+	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) all
+endef
+
+define SCHIFRA_INSTALL_EXAMPLES
+	cd $(@D) && for i in `find -type f -name 'schifra_*' -executable` ; \
+	do \
+		$(INSTALL) -m 0755 -D $$i (TARGET_DIR)/usr/bin/$$i; \
+	done
+endef
+
+SCHIFRA_POST_TARGET_INSTALL_HOOKS += SCHIFRA_INSTALL_EXAMPLES
+endif
+
+define SCHIFRA_INSTALL_TARGET_CMDS
+	cd $(@D) && for i in schifra_*.hpp; do \
+		$(INSTALL) -m 0644 -D $$i $(TARGET_DIR)/usr/include/$$i; done
+endef
+
+define SCHIFRA_INSTALL_STAGING_CMDS
+	cd $(@D) && for i in schifra_*.hpp; do \
+		$(INSTALL) -m 0644 -D $$i $(STAGING_DIR)/usr/include/$$i; done
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
