From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 12:08:28 +0200
Subject: [Buildroot] [PATCH 10/10] gtk2-engines: bump,
	rename config option and convert to AUTOTARGETS
In-Reply-To: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3ac5640d9e05230ff98df64e33b4616b36dfef7d.1305713253.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gtk2-engines is bumped from 2.9.1 to 2.20.2 (the latest available
version compatible with Gtk2). The package is converted to the
AUTOTARGETS infrastructure.

The config option is renamed so that it matches the package name
(gtk2-engines instead of libgtk2-engines).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtk2-engines/Config.in       |    2 +-
 package/gtk2-engines/gtk2-engines.mk |   86 ++++------------------------------
 2 files changed, 10 insertions(+), 78 deletions(-)

diff --git a/package/gtk2-engines/Config.in b/package/gtk2-engines/Config.in
index 265f805..756a7d0 100644
--- a/package/gtk2-engines/Config.in
+++ b/package/gtk2-engines/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBGTK2_ENGINES
+config BR2_PACKAGE_GTK2_ENGINES
 	bool "gtk engines"
 	depends on BR2_PACKAGE_LIBGTK2
 	help
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index f188188..aa9e4c3 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -3,16 +3,13 @@
 # gtk2-engines.0
 #
 #############################################################
-GTK2_ENGINES_VERSION:=2.9.1
-GTK2_ENGINES_SOURCE:=gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE:=http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.9
-GTK2_ENGINES_CAT:=$(BZCAT)
-GTK2_ENGINES_DIR:=$(BUILD_DIR)/gtk-engines-$(GTK2_ENGINES_VERSION)
-GTK2_ENGINES_BINARY:=libclearlooks.so
+GTK2_ENGINES_VERSION = 2.20.2
+GTK2_ENGINES_SOURCE  = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
+GTK2_ENGINES_SITE    = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.20
 
-GTK2_ENGINES_BUILD_ENV= \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
+GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
+
+GTK2_ENGINES_CONF_ENV = \
 		ac_cv_func_posix_getpwuid_r=yes \
 		glib_cv_stack_grows=no \
 		glib_cv_uscore=no \
@@ -65,37 +62,7 @@ GTK2_ENGINES_BUILD_ENV= \
 		gl_cv_c_restrict=no \
 		ac_cv_path_CUPS_CONFIG=no
 
-
-$(DL_DIR)/$(GTK2_ENGINES_SOURCE):
-	 $(call DOWNLOAD,$(GTK2_ENGINES_SITE),$(GTK2_ENGINES_SOURCE))
-
-gtk2-engines-source: $(DL_DIR)/$(GTK2_ENGINES_SOURCE)
-
-$(GTK2_ENGINES_DIR)/.unpacked: $(DL_DIR)/$(GTK2_ENGINES_SOURCE)
-	$(GTK2_ENGINES_CAT) $(DL_DIR)/$(GTK2_ENGINES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GTK2_ENGINES_DIR) package/gtk2-engines/ \*.patch*
-	$(CONFIG_UPDATE) $(GTK2_ENGINES_DIR)
-	touch $(GTK2_ENGINES_DIR)/.unpacked
-
-$(GTK2_ENGINES_DIR)/.configured: $(GTK2_ENGINES_DIR)/.unpacked
-	(cd $(GTK2_ENGINES_DIR); rm -rf config.cache; \
-		$(GTK2_ENGINES_BUILD_ENV) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+GTK2_ENGINES_CONF_OPT = \
 		--with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
@@ -114,41 +81,6 @@ $(GTK2_ENGINES_DIR)/.configured: $(GTK2_ENGINES_DIR)/.unpacked
 		--enable-animation \
 		--disable-development \
 		--disable-paranoia \
-		--disable-deprecated \
-	)
-	touch $(GTK2_ENGINES_DIR)/.configured
-
-$(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY): $(GTK2_ENGINES_DIR)/.configured
-	$(GTK2_ENGINES_BUILD_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(GTK2_ENGINES_DIR)
-	touch -c $(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY)
-
-$(STAGING_DIR)/lib/$(GTK2_ENGINES_BINARY): $(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(GTK2_ENGINES_DIR) install
-	touch -c $(STAGING_DIR)/lib/$(GTK2_ENGINES_BINARY)
-
-$(TARGET_DIR)/lib/gtk-2.0/2.10.0/engines/$(GTK2_ENGINES_BINARY): $(STAGING_DIR)/lib/$(GTK2_ENGINES_BINARY)
-	mkdir -p $(TARGET_DIR)/lib/gtk-2.0/2.10.0/engines
-	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/engines/*.so \
-		$(TARGET_DIR)/lib/gtk-2.0/2.10.0/engines/
-	mkdir -p $(TARGET_DIR)/usr/usr/share/themes
-	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
-		$(TARGET_DIR)/usr/share/themes/
-	touch -c $(TARGET_DIR)/lib/gtk-2.0/2.10.0/engines/$(GTK2_ENGINES_BINARY)
+		--disable-deprecated
 
-gtk2-engines: libgtk2 $(TARGET_DIR)/lib/gtk-2.0/2.10.0/engines/$(GTK2_ENGINES_BINARY)
-
-gtk2-engines-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(GTK2_ENGINES_DIR) uninstall
-	-$(MAKE) -C $(GTK2_ENGINES_DIR) clean
-
-gtk2-engines-dirclean:
-	rm -rf $(GTK2_ENGINES_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GTK2_ENGINES),y)
-TARGETS+=gtk2-engines
-endif
+$(eval $(call AUTOTARGETS,package,gtk2-engines))
-- 
1.7.1
