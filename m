From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 20:33:17 +0200
Subject: [Buildroot] [PATCH 5/5] microwin: remove deprecated package
In-Reply-To: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6b567a857071986ab366f14d97f5a3fc880e73f5.1284316269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Microwin is disabled in Buildroot since January 2007
(726abd4e519f97eda6f6dfc1b6b9505fc37e8b23) and nobody
complained. Moreover, the upstream project hasn't done any release
since five years, so let's remove this package, as announced in the
notes of 2010.08 release.

The project maintainer has announced in June 2010 that he is working
again on the project, and he has switched to Git. When a new release
is done, we can re-introduce it if people need it (this old package
needed serious work to be converted to the new package infrastructure
anyway).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    3 --
 package/microwin/Config.in   |    9 ------
 package/microwin/microwin.mk |   61 ------------------------------------------
 3 files changed, 0 insertions(+), 73 deletions(-)
 delete mode 100644 package/microwin/Config.in
 delete mode 100644 package/microwin/microwin.mk

diff --git a/package/Config.in b/package/Config.in
index 50f8841..2209b55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -107,9 +107,6 @@ source "package/sdl_gfx/Config.in"
 
 comment "other GUIs"
 source "package/qt/Config.in"
-
-#source "package/microwin/Config.in"
-
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/microwin/Config.in b/package/microwin/Config.in
deleted file mode 100644
index 35a0370..0000000
--- a/package/microwin/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_MICROWIN
-	bool "microwin"
-	# Old, unmaintained graphics stack
-	depends on BR2_DEPRECATED
-	help
-	 Microwindows Graphical User Interface for small and
-	 embedded enviroments.
-	
-	 http://microwindows.censoft.com/
diff --git a/package/microwin/microwin.mk b/package/microwin/microwin.mk
deleted file mode 100644
index 5c7d303..0000000
--- a/package/microwin/microwin.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-#############################################################
-#
-# Microwindows - 2003/11/17 Greg Haerr
-# (requires CVS 2003/11/17 or later)
-#
-#############################################################
-MICROWIN_SITE:=ftp://ftp.microwindows.org/pub/microwindows
-MICROWIN_SOURCE:=microwindows-src-snapshot.tar.gz
-MICROWIN_DIR:=$(BUILD_DIR)/microwin
-#MICROWIN_SOURCE:=microwindows-0.91.tar.gz
-#MICROWIN_DIR:=$(BUILD_DIR)/microwindows-0.91
-
-MICROWIN_CAT:=$(ZCAT)
-MICROWIN_BINARY:=$(MICROWIN_DIR)/src/bin/nano-X
-MICROWIN_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/nano-X
-MICROWIN_VERSION=$(subst $(MICROWIN_DIR)/microwindows-,,$(wildcard $(MICROWIN_DIR)/microwindows-*))
-
-MICROWIN_CONFIG:=$(MICROWIN_DIR)/src/Configs/config.uclibc
-
-$(DL_DIR)/$(MICROWIN_SOURCE):
-	 $(call DOWNLOAD,$(MICROWIN_SITE),$(MICROWIN_SOURCE))
-
-microwin-source: $(DL_DIR)/$(MICROWIN_SOURCE)
-
-$(MICROWIN_DIR)/.unpacked: $(DL_DIR)/$(MICROWIN_SOURCE)
-	[ -d $(MICROWIN_DIR) ] || mkdir $(MICROWIN_DIR)
-	$(MICROWIN_CAT) $(DL_DIR)/$(MICROWIN_SOURCE) | tar -C $(MICROWIN_DIR) $(TAR_OPTIONS) -
-	touch $(MICROWIN_DIR)/.unpacked
-
-$(MICROWIN_DIR)/.prepared: $(MICROWIN_DIR)/.unpacked
-	mv $(MICROWIN_DIR)/microwindows-$(MICROWIN_VERSION)/* $(MICROWIN_DIR)
-	toolchain/patch-kernel.sh $(MICROWIN_DIR) package/microwin/ microwindows-$(MICROWIN_VERSION)\*.patch
-	touch $(MICROWIN_DIR)/.prepared
-
-$(MICROWIN_DIR)/.configured: $(MICROWIN_DIR)/.prepared
-	(cd $(MICROWIN_DIR); \
-	)
-	touch $(MICROWIN_DIR)/.configured
-
-$(MICROWIN_BINARY): $(MICROWIN_DIR)/.configured
-	$(MAKE) ARCH=LINUX-$(shell echo $(ARCH) | tr a-z A-Z) $(shell echo $(ARCH) | tr a-z A-Z)TOOLSPREFIX=$(TARGET_CROSS) CC="$(TARGET_CC)" -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG)
-
-$(MICROWIN_TARGET_BINARY): $(MICROWIN_BINARY)
-	$(MAKE) INSTALL_PREFIX=$(TARGET_DIR)/usr INSTALL_OWNER1= INSTALL_OWNER2= CC="$(TARGET_CC)" -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG) install
-
-microwin: $(MICROWIN_TARGET_BINARY)
-
-microwin-clean:
-	-$(MAKE) -C $(MICROWIN_DIR)/src clean
-
-microwin-dirclean:
-	rm -rf $(MICROWIN_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MICROWIN),y)
-TARGETS+=microwin
-endif
-- 
1.7.0.4
