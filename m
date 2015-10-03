From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  3 Oct 2015 18:35:05 +0200
Subject: [Buildroot] [PATCH] package/schifra: remove package
Message-ID: <1443890105-2962-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Arnaud R?billout <rebillout@syscom.ch>
Cc: Simon Dawson <spdawson@gmail.com>
---
 Config.in.legacy             |  6 ++++++
 package/Config.in            |  1 -
 package/schifra/Config.in    | 26 --------------------------
 package/schifra/schifra.hash |  3 ---
 package/schifra/schifra.mk   | 44 --------------------------------------------
 5 files changed, 6 insertions(+), 74 deletions(-)
 delete mode 100644 package/schifra/Config.in
 delete mode 100644 package/schifra/schifra.hash
 delete mode 100644 package/schifra/schifra.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8975b95..cfcb533 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_SCHIFRA
+	bool "schifra package has been removed"
+	help
+	  Schifra package has been maked broken since 2014.11 release and
+	  haven't been fixed since then.
+
 # Since FreeRDP has new dependencies, protect this legacy to avoid the
 # infamous "unmet direct dependencies" kconfig error.
 config BR2_PACKAGE_FREERDP_CLIENT
diff --git a/package/Config.in b/package/Config.in
index 2091d4e..066f04c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1135,7 +1135,6 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
-	source "package/schifra/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/schifra/Config.in b/package/schifra/Config.in
deleted file mode 100644
index a3f699a..0000000
--- a/package/schifra/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_SCHIFRA
-	bool "schifra"
-	depends on BR2_INSTALL_LIBSTDCPP
-	# Upstream keep changing the tarball without doing new
-	# releases. This is not acceptable for Buildroot, as
-	# reproducible builds are very important.
-	depends on BR2_BROKEN
-	help
-	  Schifra is a very robust, highly optimized and extremely configurable
-	  Reed-Solomon error correcting code library for both software and IP
-	  core based applications with implementations in C++ and VHDL.
-
-	  http://www.schifra.com/
-
-if BR2_PACKAGE_SCHIFRA
-
-config BR2_PACKAGE_SCHIFRA_EXAMPLES
-	bool "schifra examples"
-	help
-	  Build and install the schifra example applications.
-
-endif
-
-comment "schifra needs a toolchain w/ C++"
-	depends on BR2_BROKEN
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/schifra/schifra.hash b/package/schifra/schifra.hash
deleted file mode 100644
index 7f8e6c0..0000000
--- a/package/schifra/schifra.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Calculated locally after download
-# Upstream doesn't store a version and tarball may change unexpectedly!
-sha256	3e60478cf024d87735d1cc1460aa2176c449e6c7f76914eefda25d3b20d22522	schifra.tgz
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
deleted file mode 100644
index 661ef04..0000000
--- a/package/schifra/schifra.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# schifra
-#
-################################################################################
-
-SCHIFRA_VERSION = 0.0.1
-SCHIFRA_SITE = http://www.schifra.com/downloads
-SCHIFRA_SOURCE = schifra.tgz
-SCHIFRA_INSTALL_STAGING = YES
-SCHIFRA_LICENSE = schifra license
-SCHIFRA_LICENSE_FILES = schifra_license.txt
-
-SCHIFRA_MAKE_OPTS = \
-	COMPILER="$(TARGET_CXX)" \
-	OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
-
-# The examples are the only buildable artefacts.
-ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
-define SCHIFRA_BUILD_CMDS
-	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPTS) all
-endef
-
-define SCHIFRA_INSTALL_EXAMPLES
-	cd $(@D) && for i in `find -type f -name 'schifra_*' -executable` ; \
-	do \
-		$(INSTALL) -m 0755 -D $$i $(TARGET_DIR)/usr/bin/$$i; \
-	done
-endef
-
-SCHIFRA_POST_INSTALL_TARGET_HOOKS += SCHIFRA_INSTALL_EXAMPLES
-endif
-
-define SCHIFRA_INSTALL_TARGET_CMDS
-	cd $(@D) && for i in schifra_*.hpp; do \
-		$(INSTALL) -m 0644 -D $$i $(TARGET_DIR)/usr/include/$$i; done
-endef
-
-define SCHIFRA_INSTALL_STAGING_CMDS
-	cd $(@D) && for i in schifra_*.hpp; do \
-		$(INSTALL) -m 0644 -D $$i $(STAGING_DIR)/usr/include/$$i; done
-endef
-
-$(eval $(generic-package))
-- 
2.4.3
