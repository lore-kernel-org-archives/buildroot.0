From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Wed,  8 Jun 2011 15:57:26 +0200
Subject: [Buildroot] [PATCH 1/3] binutils: Makefile and Config.in rework for
	oprofile ext toolchain compilation
Message-ID: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

  * When select full binutils binaries use the default INSTALL_TARGET_CMDS
from AUTOTARGET.
  * Menu config improvement.
  * Install libiberty into Staging dir.
---
 package/binutils/Config.in   |   15 +++++++++++++--
 package/binutils/binutils.mk |   23 ++++++++++++-----------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 9e4821a..449ba46 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,14 @@
 config BR2_PACKAGE_BINUTILS
-	bool "libbfd (binutils)"
-	depends on BR2_TOOLCHAIN_BUILDROOT
+	bool "binutils"
+	help
+	  Install bintutils on the target.
+
+menu "binutils Options"
+depends on BR2_PACKAGE_BINUTILS
+
+config BR2_PACKAGE_BINUTILS_LIBBFD
+	bool "libbfd"
+	depends on BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -11,6 +19,7 @@ config BR2_PACKAGE_BINUTILS
 config BR2_PACKAGE_BINUTILS_TARGET
 	bool "binutils binaries"
 	depends on BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_BINUTILS_LIBBFD
 	help
 	  The GNU Binutils are a collection of binary tools:
 
@@ -19,3 +28,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 	  and others...
 
 	  http://www.gnu.org/software/binutils/
+
+endmenu
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5454af8..d65e68f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -4,7 +4,13 @@
 #
 #############################################################
 
+# Version is set when using buildroot toolchain.
+# If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
+ifeq ($(BINUTILS_VERSION),)
+BINUTILS_VERSION = 2.21
+endif
+
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
@@ -33,23 +39,18 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			$(BR2_CONFIGURE_STAGING_SYSROOT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
-# We just want libbfd, not the full-blown binutils in staging
+# We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 
-# only libbfd in the target...
-BINUTILS_INSTALL_FROM = $(@D)/bfd
-
-# unless we want full...
-ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
-BINUTILS_INSTALL_FROM = $(@D)
-endif
-
+# If we don't want full binutils on target
+ifneq ($(BR2_PACKAGE_BINUTILS_TARGET), y)
 define BINUTILS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(BINUTILS_INSTALL_FROM) \
-		DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 endef
+endif
 
 $(eval $(call AUTOTARGETS,package,binutils))
 $(eval $(call AUTOTARGETS,package,binutils,host))
-- 
1.7.5.2
