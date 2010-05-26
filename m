From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] Update packages to
	BR2_NEEDS_GETTEXT_IF_LOCALE
Message-ID: <20100526122000.4853B1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dbdb4e33f04a52757232a6d00da23e8ba232c7d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/Config.in          |    4 ++--
 package/avahi/avahi.mk           |    2 +-
 package/gmpc/Config.in           |    4 ++--
 package/gmpc/gmpc.mk             |    2 +-
 package/grep/Config.in           |    4 ++--
 package/grep/grep.mk             |    2 +-
 package/hal/Config.in            |    4 ++--
 package/hal/hal.mk               |    2 +-
 package/libidn/Config.in         |    1 +
 package/libidn/libidn.mk         |    2 +-
 package/libsoup/Config.in        |    2 ++
 package/libsoup/libsoup.mk       |    2 +-
 package/make/Config.in           |    4 ++--
 package/make/make.mk             |    2 +-
 package/pango/Config.in          |    2 ++
 package/pango/pango.mk           |    2 +-
 package/psmisc/Config.in         |    4 ++--
 package/psmisc/psmisc.mk         |    2 +-
 package/sshfs/Config.in          |    4 ++--
 package/sshfs/sshfs.mk           |    2 +-
 package/util-linux/Config.in     |    4 ++--
 package/util-linux/util-linux.mk |    2 +-
 22 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 3386005..eb3ccb6 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index ca55e27..66e2e63 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -82,7 +82,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-intltool
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 056f5a0..979df48 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index aa74a2e..6016e7c 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -12,7 +12,7 @@ GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
 GMPC_CONF_OPT = --disable-mmkeys
 
 GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intltool \
-	$(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
 GMPC_DEPENENCIES += xlib_libSM
diff --git a/package/grep/Config.in b/package/grep/Config.in
index f898fdf..430616b 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 93c6caf..5b945d5 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,6 +8,6 @@ GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
 GREP_SITE:=$(BR2_GNU_MIRROR)/grep
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,grep))
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 9518f13..0420568 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_HAL
 	bool "hal"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_EXPAT
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 62eca70..801fe92 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -79,7 +79,7 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
 	done
 
-hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(if $(BR2_NEEDS_GETTEXT),gettext libintl) $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index 793fbc3..04f8900 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Libidn's purpose is to encode and decode internationalized 
 	  domain names. 
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index bc8e001..4b3bea3 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_INSTALL_TARGET = YES
 LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
 LIBIDN_LIBTOOL_PATCH = NO
-LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(call AUTOTARGETS,package,libidn))
 
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 6bccd11..b3d4b5f 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 45f62e8..9757698 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -26,6 +26,6 @@ LIBSOUP_CONF_OPT = \
 	--without-gnome		\
 	--disable-gtk-doc
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
 $(eval $(call AUTOTARGETS,package,libsoup))
diff --git a/package/make/Config.in b/package/make/Config.in
index 674e245..364bb1e 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index 5dd0637..0b2657d 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -56,7 +56,7 @@ $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY): $(GNUMAKE_DIR)/$(GNUMAKE_BINARY)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
-make: $(if $(BR2_NEEDS_GETTEXT),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
+make: $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
 
 make-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) uninstall
diff --git a/package/pango/Config.in b/package/pango/Config.in
index bf2fc6e..2c02219 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index c640045..ad38246 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,7 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 PANGO_CONF_OPT = --enable-shared --enable-static \
 		--enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext libintl) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 31e982c..a138204 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index b82883f..e4301da 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -7,6 +7,6 @@ PSMISC_VERSION:=22.8
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_AUTORECONF:=NO
-PSMISC_DEPENDENCIES:=ncurses $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+PSMISC_DEPENDENCIES:=ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,psmisc))
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index fc820a3..8d7a2a2 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index d15aa00..09f1e93 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -11,6 +11,6 @@ SSHFS_AUTORECONF:=NO
 SSHFS_INSTALL_STAGING:=NO
 SSHFS_INSTALL_TARGET:=YES
 
-SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,sshfs))
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 533ef69..434dae9 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UTIL-LINUX
 	bool "util-linux"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_INET_RPC
 	help
 	  Various useful/essential Linux utilities.
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6446d37..001ca75 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -18,7 +18,7 @@ else
 UTIL-LINUX_SCHED_UTILS:=--disable-schedutils
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL-LINUX_DEPENDENCIES += gettext libintl
 UTIL-LINUX_MAKE_OPT = LIBS=-lintl
 endif
-- 
1.6.3.3
