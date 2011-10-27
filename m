From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Oct 2011 14:04:56 +0200
Subject: [Buildroot] [git commit] binutils: Makefile and Config.in rework
	for oprofile ext toolchain compilation
Message-ID: <20111027132528.187F78F290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48391acd2c63ea373f9771210b3acd54ec97fb00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

  * When select full binutils binaries use the default INSTALL_TARGET_CMDS
    from AUTOTARGET.
  * Menu config improvement.
  * Install libiberty into Staging dir.

[Peter: Fix typos, Config.in fixes, install libiberty to target as well]
Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in   |    7 ++-----
 package/binutils/binutils.mk |   24 +++++++++++++-----------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 9e4821a..e068b20 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,12 +1,9 @@
 config BR2_PACKAGE_BINUTILS
-	bool "libbfd (binutils)"
-	depends on BR2_TOOLCHAIN_BUILDROOT
+	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-	  Install libbfd from binutils in the target.
-
-	  This is used by oprofile to avoid a full-blown target binutils.
+	  Install binutils on the target
 
 config BR2_PACKAGE_BINUTILS_TARGET
 	bool "binutils binaries"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5123568..20de45a 100644
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
@@ -34,23 +40,19 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
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
+ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(BINUTILS_INSTALL_FROM) \
-		DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
+endif
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
