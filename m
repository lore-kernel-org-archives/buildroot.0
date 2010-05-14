From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 13:37:25 +0200
Subject: [Buildroot] [PATCH 2/8] Make all package using gettext rely on
	BR2_NEEDS_GETTEXT
In-Reply-To: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f61ebb7ce530c54fccc10e8c0b0314cd6dfe4787.1273836748.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/Config.in             |    4 ++--
 package/avahi/avahi.mk              |    2 +-
 package/gmpc/Config.in              |    4 ++--
 package/gmpc/gmpc.mk                |    3 ++-
 package/grep/Config.in              |    4 ++--
 package/grep/grep.mk                |    2 +-
 package/hal/Config.in               |    4 ++--
 package/hal/hal.mk                  |    2 +-
 package/libglib2/Config.in          |    4 ++--
 package/libglib2/libglib2.mk        |    2 +-
 package/libidn/libidn.mk            |    2 +-
 package/libsoup/libsoup.mk          |    2 +-
 package/make/Config.in              |    4 ++--
 package/make/make.mk                |    2 +-
 package/multimedia/libmpd/Config.in |    2 --
 package/pango/pango.mk              |    2 +-
 package/php/Config.ext              |    2 +-
 package/php/php.mk                  |    2 +-
 package/psmisc/Config.in            |    4 ++--
 package/psmisc/psmisc.mk            |    8 +-------
 package/sshfs/Config.in             |    4 ++--
 package/sshfs/sshfs.mk              |    2 +-
 package/util-linux/Config.in        |    4 ++--
 package/util-linux/util-linux.mk    |    4 ++--
 24 files changed, 34 insertions(+), 41 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 35b7c27..3386005 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9940d28..5e64047 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -82,7 +82,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext) host-intltool
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-intltool
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index a834361..056f5a0 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 0db89b9..aa74a2e 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,7 +11,8 @@ GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
 		ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys
 
-GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intltool
+GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intltool \
+	$(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
 GMPC_DEPENENCIES += xlib_libSM
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 3795330..f898fdf 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
-	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index acef6e9..93c6caf 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,6 +8,6 @@ GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
 GREP_SITE:=$(BR2_GNU_MIRROR)/grep
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
-GREP_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
+GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,grep))
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 250e005..9518f13 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_HAL
 	bool "hal"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_EXPAT
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 262fc41..62eca70 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -79,7 +79,7 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
 	done
 
-hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(if $(BR2_NEEDS_GETTEXT),gettext libintl) $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index d947eb6..cc1d6e2 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 72a1396..43b1a89 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,7 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config
 
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 6ee1a96..bc8e001 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_INSTALL_TARGET = YES
 LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
 LIBIDN_LIBTOOL_PATCH = NO
-LIBIDN_DEPENDENCIES = host-pkg-config gettext $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(call AUTOTARGETS,package,libidn))
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 3829a81..45f62e8 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -26,6 +26,6 @@ LIBSOUP_CONF_OPT = \
 	--without-gnome		\
 	--disable-gtk-doc
 
-LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
 $(eval $(call AUTOTARGETS,package,libsoup))
diff --git a/package/make/Config.in b/package/make/Config.in
index 5264005..674e245 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
-	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index 29c7af4..5dd0637 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -56,7 +56,7 @@ $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY): $(GNUMAKE_DIR)/$(GNUMAKE_BINARY)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
-make: $(if $(BR2_PACKAGE_GETTEXT),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
+make: $(if $(BR2_NEEDS_GETTEXT),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
 
 make-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) uninstall
diff --git a/package/multimedia/libmpd/Config.in b/package/multimedia/libmpd/Config.in
index c79203c..4f3a714 100644
--- a/package/multimedia/libmpd/Config.in
+++ b/package/multimedia/libmpd/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  High-level client library for accessing Music Player Daemon.
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 38e163e..812a4c8 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -45,7 +45,7 @@ HOST_PANGO_CONF_OPT = \
 		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
 		--disable-debug \
 
-PANGO_DEPENDENCIES = gettext libintl host-pkg-config host-pango libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config host-pango libglib2 cairo
 
 HOST_PANGO_DEPENDENCIES = host-pkg-config host-cairo host-libglib2 host-autoconf host-automake
 
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 9b53e87..2fbd05e 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -67,7 +67,7 @@ config BR2_PACKAGE_PHP_EXT_FTP
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
-	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  gettext support
 
diff --git a/package/php/php.mk b/package/php/php.mk
index cd5ed9e..c5f9c14 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -84,7 +84,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
 	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += gettext
+	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index e7ce704..31e982c 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index e04923d..b82883f 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -7,12 +7,6 @@ PSMISC_VERSION:=22.8
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_AUTORECONF:=NO
-PSMISC_DEPENDENCIES:=ncurses
-
-ifeq ($(BR2_ENABLE_LOCALE),y)
-# psmisc gets confused and forgets to link with libintl
-PSMISC_MAKE_OPT:=LIBS=-lintl
-PSMISC_DEPENDENCIES+= gettext libintl
-endif
+PSMISC_DEPENDENCIES:=ncurses $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,psmisc))
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 12d98f6..7ddd0c1 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_OPENSSH
 	help
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 4acc293..d15aa00 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -11,6 +11,6 @@ SSHFS_AUTORECONF:=NO
 SSHFS_INSTALL_STAGING:=NO
 SSHFS_INSTALL_TARGET:=YES
 
-SSHFS_DEPENDENCIES = libglib2 libfuse
+SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,sshfs))
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e21daf6..533ef69 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UTIL-LINUX
 	bool "util-linux"
-	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	depends on BR2_INET_RPC
 	help
 	  Various useful/essential Linux utilities.
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e2135e7..6446d37 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -18,8 +18,8 @@ else
 UTIL-LINUX_SCHED_UTILS:=--disable-schedutils
 endif
 
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-UTIL-LINUX_DEPENDENCIES += libintl
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+UTIL-LINUX_DEPENDENCIES += gettext libintl
 UTIL-LINUX_MAKE_OPT = LIBS=-lintl
 endif
 
-- 
1.6.3.3
