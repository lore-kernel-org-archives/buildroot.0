From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:16:45 +0200
Subject: [Buildroot] [PATCH 1/3] package: drop special case for
	target-install with BR2_ENABLE_DEBUG
In-Reply-To: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284812207-31798-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

install-exec isn't used anymore

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/autoconf/autoconf.mk     |    4 ----
 package/automake/automake.mk     |    4 ----
 package/dbus/dbus.mk             |    9 ++-------
 package/haserl/haserl.mk         |    5 ++---
 package/libtool/libtool.mk       |    4 ----
 package/m4/m4.mk                 |    4 ----
 package/pkg-config/pkg-config.mk |    4 ----
 package/rsync/rsync.mk           |    9 ++-------
 package/sawman/sawman.mk         |    5 -----
 9 files changed, 6 insertions(+), 42 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8794466..a21192f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -7,10 +7,6 @@ AUTOCONF_VERSION = 2.65
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-AUTOCONF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 46bb773..a33c9f4 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -7,10 +7,6 @@ AUTOMAKE_VERSION = 1.10
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-AUTOMAKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 141cf69..e568080 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -9,13 +9,6 @@ DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
-ifeq ($(BR2_ENABLE_DEBUG),y)
-# install-exec doesn't install the config file
-DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-else
-# install-strip uses host strip
-DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip STRIPPROG="$(STRIPCMD)"
-endif
 
 DBUS_DEPENDENCIES = host-pkg-config
 
@@ -49,6 +42,8 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
+DBUS_MAKE_ENV = STRIPPROG="$(STRIPCMD)"
+
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
 define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 53b5548..1fe4292 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -8,9 +8,6 @@ HASERL_VERSION:=$(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 HASERL_AUTORECONF:=NO
 HASERL_INSTALL_TARGET:=YES
-ifeq ($(BR2_ENABLE_DEBUG),)
-HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
-endif
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
@@ -22,6 +19,8 @@ ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_DEPENDENCIES += lua
 endif
 
+HASERL_MAKE_ENV = STRIPPROG='$(STRIPCMD)'
+
 define HASERL_REMOVE_EXAMPLES
 	rm -rf $(TARGET_DIR)/usr/share/haserl
 endef
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4278029..a996876 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,10 +7,6 @@ LIBTOOL_VERSION = 1.5.24
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-LIBTOOL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 define HOST_LIBTOOL_CUSTOM_INSTALL
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index a0b56c4..7f2e333 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,10 +7,6 @@ M4_VERSION = 1.4.9
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # no install-exec
-M4_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 7caf37b..330b166 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -7,10 +7,6 @@ PKG_CONFIG_VERSION = 0.23
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 PKG_CONFIG_DEPENDENCIES = libglib2
 
 PKG_CONFIG_CONF_OPT = --with-installed-glib
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e1bb28e..2e70f7f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -10,13 +10,8 @@ RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
 RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-ifeq ($(BR2_ENABLE_DEBUG),y)
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  install
-else
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  STRIPPROG="$(TARGET_STRIP)" install-strip
-endif
 RSYNC_CONF_OPT:=--with-included-popt
 
+RSYNC_MAKE_ENV = STRIPPROG="$(STRIPCMD)"
+
 $(eval $(call AUTOTARGETS,package,rsync))
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 1b53ea9..c9ec06d 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -9,11 +9,6 @@ SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_INSTALL_TARGET = YES
 # SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
-ifeq ($(BR2_ENABLE_DEBUG),y)
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-else
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
-endif
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS,package,sawman))
-- 
1.7.1
