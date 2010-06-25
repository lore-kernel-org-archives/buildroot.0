From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 13:49:36 +0200
Subject: [Buildroot] [git commit master 1/1] package: Remove portage,
	it's obsolete
Message-ID: <20100625115337.9654981DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=237c98b29517d50b723e5d8b63e7e1770e9f9a8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1975

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 +-
 package/Config.in          |    1 -
 package/portage/Config.in  |   11 ---
 package/portage/portage.mk |  163 --------------------------------------------
 4 files changed, 2 insertions(+), 176 deletions(-)
 delete mode 100644 package/portage/Config.in
 delete mode 100644 package/portage/portage.mk

diff --git a/CHANGES b/CHANGES
index 8b0fb71..4046b67 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
 	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config
 
-	Removed packages: modutils, rxvt
+	Removed packages: modutils, portage, rxvt
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -42,6 +42,7 @@
 	#1945: PHP: add sqlite3 dependency when using external lib
 	#1951: Bump openssl to 0.9.8o
 	#1957: Bump sqlite to 3.6.23.1
+	#1975: Package removal/deprecation
 	#1987: intltool: Fix spelling mistake
 	#1999: Typo in path checking
 	#2005: Bump dnsmasq to 2.55 and migrate to gentargets
diff --git a/package/Config.in b/package/Config.in
index 0b8ecfd..253f47a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,7 +441,6 @@ endmenu
 
 menu "Package managers"
 source "package/ipkg/Config.in"
-source "package/portage/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rpm/Config.in"
 endif
diff --git a/package/portage/Config.in b/package/portage/Config.in
deleted file mode 100644
index 83778ff..0000000
--- a/package/portage/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_PORTAGE
-	bool "portage"
-	select BR2_PACKAGE_PYTHON
-	depends on BR2_USE_WCHAR
-	help
-	  Portage, the Gentoo package management tool.
-
-	  http://www.gentoo.org/
-
-comment "portage requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
diff --git a/package/portage/portage.mk b/package/portage/portage.mk
deleted file mode 100644
index 3661e9b..0000000
--- a/package/portage/portage.mk
+++ /dev/null
@@ -1,163 +0,0 @@
-#############################################################
-#
-# portage
-#
-#############################################################
-PORTAGE_BASE_VERSION:=2.1.4
-PORTAGE_DOWNLOAD_VERSION:=$(PORTAGE_BASE_VERSION)
-PORTAGE_PATCH_APPLY:=n
-PORTAGE_PATCH_VERSION:=.4
-ifeq ($(PORTAGE_PATCH_APPLY),n)
-PORTAGE_PATCH_VERSION:=
-endif
-PORTAGE_VERSION:=$(PORTAGE_BASE_VERSION)$(PORTAGE_PATCH_VERSION)
-PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
-
-PORTAGE_SOURCE:=portage-$(PORTAGE_DOWNLOAD_VERSION).tar.bz2
-PORTAGE_SITE:=http://gentoo.osuosl.org/distfiles
-PORTAGE_CAT:=$(BZCAT)
-PORTAGE_DOWNLOAD_DIR:=$(BUILD_DIR)/portage-$(PORTAGE_DOWNLOAD_VERSION)
-PORTAGE_DIR:=$(BUILD_DIR)/portage-$(PORTAGE_VERSION)
-PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
-PORTAGE_TARGET_BINARY:=usr/bin/emerge
-
-SANDBOX_VERSION:=1.2.18.1
-SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
-SANDBOX_SITE:=$(PORTAGE_SITE)
-SANDBOX_CAT:=$(PORTAGE_CAT)
-SANDBOX_DIR:=$(BUILD_DIR)/sandbox-$(SANDBOX_VERSION)
-SANDBOX_TARGET_BINARY:=usr/bin/sandbox
-
-ifeq ($(BR2_cris),y)
-	PORTAGE_ARCH:=x86
-endif
-ifeq ($(BR2_mipsel),y)
-	PORTAGE_ARCH:=mips
-endif
-ifeq ($(BR2_powerpc),y)
-	PORTAGE_ARCH:=ppc
-endif
-ifeq ($(BR2_sh4),y)
-	PORTAGE_ARCH:=sh
-endif
-ifeq ($(BR2_sh64),y)
-	PORTAGE_ARCH:=sh
-endif
-ifeq ($(BR2_i386),y)
-	PORTAGE_ARCH:=x86
-endif
-ifeq ($(PORTAGE_ARCH),)
-	PORTAGE_ARCH:=$(ARCH)
-endif
-
-$(DL_DIR)/$(PORTAGE_SOURCE):
-	$(call DOWNLOAD,$(PORTAGE_SITE),$(PORTAGE_SOURCE))
-
-$(DL_DIR)/$(SANDBOX_SOURCE):
-	$(call DOWNLOAD,$(SANDBOX_SITE),$(SANDBOX_SOURCE))
-
-portage-source: $(DL_DIR)/$(PORTAGE_SOURCE)
-sandbox-source: $(DL_DIR)/$(SANDBOX_SOURCE)
-
-$(PORTAGE_DOWNLOAD_DIR)/.unpacked: $(DL_DIR)/$(PORTAGE_SOURCE)
-	$(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_SOURCE) | tar -C $(BUILD_DIR) -xf -
-	touch $@
-
-ifeq ($(PORTAGE_PATCH_APPLY),y)
-$(DL_DIR)/$(PORTAGE_PATCH):
-	$(call DOWNLOAD,$(PORTAGE_SITE),$(PORTAGE_PATCH))
-
-$(PORTAGE_DIR)/.patched: $(PORTAGE_DOWNLOAD_DIR)/.unpacked $(DL_DIR)/$(PORTAGE_PATCH)
-	mv -f $(BUILD_DIR)/portage-$(PORTAGE_DOWNLOAD_VERSION) $(PORTAGE_DIR)
-	rm -f $(PORTAGE_DIR)/bin/tbz2tool
-	(cd $(PORTAGE_DIR); $(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_PATCH) | patch -p0)
-	touch $@
-else
-$(PORTAGE_DIR)/.patched: $(PORTAGE_DOWNLOAD_DIR)/.unpacked
-	rm -f $(PORTAGE_DIR)/bin/tbz2tool
-	touch $@
-endif
-
-$(SANDBOX_DIR)/.unpacked: $(DL_DIR)/$(SANDBOX_SOURCE)
-	$(SANDBOX_CAT) $(DL_DIR)/$(SANDBOX_SOURCE) | tar -C $(BUILD_DIR) -xf -
-	touch $@
-
-$(PORTAGE_DIR)/.compiled: $(PORTAGE_DIR)/.patched
-	$(TARGET_CC) $(TARGET_CFLAGS) $(PORTAGE_DIR)/src/tbz2tool.c -o $(PORTAGE_DIR)/src/tbz2tool
-	touch $@
-
-$(SANDBOX_DIR)/.compiled: $(SANDBOX_DIR)/.unpacked
-	touch $@
-
-newins=install -D
-doins=install
-dodir=install -d
-doexe=install -D -m 755
-dosym=ln -sf
-$(TARGET_DIR)/$(PORTAGE_TARGET_BINARY): $(PORTAGE_DIR)/.compiled
-	(cd $(PORTAGE_DIR)/cnf; \
-		$(newins) make.globals $(TARGET_DIR)/etc/make.globals; \
-		$(newins) make.conf $(TARGET_DIR)/etc/make.conf; \
-		cp $(TARGET_DIR)/etc/make.conf $(TARGET_DIR)/etc/make.conf.$(PORTAGE_ARCH); \
-		patch $(TARGET_DIR)/etc/make.conf.$(PORTAGE_ARCH) $(PORTAGE_DIR)/cnf/make.conf.$(PORTAGE_ARCH).diff; \
-		$(doins) etc-update.conf dispatch-conf.conf $(TARGET_DIR)/etc; \
-	)
-# $(newins) make.globals.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.globals; \
-# $(newins) make.conf.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.conf; \
-
-	$(dodir) $(PORTAGE_TARGET_DIR)/pym
-	$(doins) $(PORTAGE_DIR)/pym/*.py $(PORTAGE_TARGET_DIR)/pym/
-	mkdir -p $(PORTAGE_TARGET_DIR)/pym/cache
-	$(doins) $(PORTAGE_DIR)/pym/cache/*.py $(PORTAGE_TARGET_DIR)/pym
-	mkdir -p $(PORTAGE_TARGET_DIR)/pym/elog_modules
-	$(doins) $(PORTAGE_DIR)/pym/elog_modules/*.py $(PORTAGE_TARGET_DIR)/pym/elog_modules
-
-	$(dodir) $(PORTAGE_TARGET_DIR)/bin
-	$(doexe) $(PORTAGE_DIR)/bin/* $(PORTAGE_DIR)/src/tbz2tool $(PORTAGE_TARGET_DIR)/bin/
-
-	mkdir -p $(TARGET_DIR)/usr/portage/distfiles
-	mkdir -p $(TARGET_DIR)/var/lib/portage
-
-	$(dodir) $(PORTAGE_TARGET_DIR)/usr/bin
-	$(dodir) $(PORTAGE_TARGET_DIR)/usr/sbin
-	$(dosym) newins $(PORTAGE_TARGET_DIR)/bin/donewins
-	for sbin in pkgmerge ebuild ebuild.sh etc-update dispatch-conf \
-		archive-conf fixpackages env-update regenworld emerge-webrsync; do \
-		$(dosym) ../lib/portage/bin/$${sbin} $(TARGET_DIR)/usr/sbin/$${sbin}; \
-	done
-	for bin in xpak repoman tbz2tool portageq g-cpan.pl quickpkg emerge; do \
-		$(dosym) ../lib/portage/bin/$${bin} $(TARGET_DIR)/usr/bin/$${bin}; \
-	done
-$(TARGET_DIR)/$(SANDBOX_TARGET_BINARY): $(SANDBOX_DIR)/.compiled
-	touch $(TARGET_DIR)/$(SANDBOX_TARGET_BINARY)
-
-sandbox: $(TARGET_DIR)/$(SANDBOX_TARGET_BINARY)
-portage: sandbox python $(TARGET_DIR)/$(PORTAGE_TARGET_BINARY)
-
-portage-clean:
-	(cd $(TARGET_DIR)/etc; \
-		rm -f make.globals make.conf etc-update.conf dispatch-conf.conf)
-	rm -rf $(PORTAGE_TARGET_DIR)
-
-	for sbin in pkgmerge ebuild ebuild.sh etc-update dispatch-conf \
-		archive-conf fixpackages env-update regenworld emerge-webrsync; do \
-		rm -f $(TARGET_DIR)/usr/sbin/$${sbin}; \
-	done
-	for bin in xpak repoman tbz2tool portageq g-cpan.pl quickpkg emerge; do \
-		rm -f $(TARGET_DIR)/usr/bin/$${bin}; \
-	done
-sandbox-clean:
-
-
-portage-dirclean:
-	rm -rf $(PORTAGE_DIR)
-sandbox-dirclean:
-	rm -rf $(SANDBOX_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PORTAGE),y)
-TARGETS+=portage sandbox
-endif
-- 
1.7.1
