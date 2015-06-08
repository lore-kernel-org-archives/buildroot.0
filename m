From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 11:07:18 -0300
Subject: [Buildroot] [PATCHv4 2/4] midori: bump to version 0.5.9
In-Reply-To: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433772440-18090-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 0.5.9 which uses the new webkit2 API (gtk3) or
alternatively fallback to webkit1 compatibility API (gtk2).
The old webkit is completely unsupported now, it makes no sense because
of instability and security issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/midori/0001-disable-libnotify.patch | 43 +++++++++++++++++++++++
 package/midori/Config.in                    | 39 ++++++++++++++-------
 package/midori/midori.hash                  |  2 ++
 package/midori/midori.mk                    | 54 ++++++++++++++---------------
 4 files changed, 99 insertions(+), 39 deletions(-)
 create mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/midori.hash

diff --git a/package/midori/0001-disable-libnotify.patch b/package/midori/0001-disable-libnotify.patch
new file mode 100644
index 0000000..830ecff
--- /dev/null
+++ b/package/midori/0001-disable-libnotify.patch
@@ -0,0 +1,43 @@
+Disable libnotify support, we've got no package and it's not very useful
+in embedded targets anyway.
+The webmedia extension requires libnotify as well.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura midori-0.5.9.orig/CMakeLists.txt midori-0.5.9/CMakeLists.txt
+--- midori-0.5.9.orig/CMakeLists.txt	2015-03-30 15:57:29.554632932 -0300
++++ midori-0.5.9/CMakeLists.txt	2015-03-30 15:57:35.299830192 -0300
+@@ -143,16 +143,7 @@
+     endif ()
+ endif ()
+ 
+-if (WIN32)
+-    add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
+-else ()
+-    pkg_check_modules(NOTIFY REQUIRED libnotify)
+-    add_definitions("-DLIBNOTIFY_VERSION=\"${NOTIFY_VERSION}\"")
+-    add_definitions("-DHAVE_LIBNOTIFY")
+-    set(OPTS_INCLUDE_DIRS "${OPTS_INCLUDE_DIRS};${NOTIFY_INCLUDE_DIRS}")
+-    set(OPTS_LIBRARIES "${OPTS_LIBRARIES};${NOTIFY_LIBRARIES}")
+-    set(PKGS ${PKGS} libnotify)
+-endif ()
++add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
+ 
+ option(USE_GTK3 "Use GTK+3" OFF)
+ option(HALF_BRO_INCOM_WEBKIT2 "Serve as a guniea pig" OFF)
+diff -Nura midori-0.5.9.orig/extensions/CMakeLists.txt midori-0.5.9/extensions/CMakeLists.txt
+--- midori-0.5.9.orig/extensions/CMakeLists.txt	2015-03-30 15:57:29.544632589 -0300
++++ midori-0.5.9/extensions/CMakeLists.txt	2015-03-30 15:57:51.777395949 -0300
+@@ -24,11 +24,7 @@
+          )
+ endif ()
+ 
+-# FIXME: re-enable webmedia extension
+-# once we have working notifications on win
+-if (WIN32)
+-    list(REMOVE_ITEM EXTENSIONS "webmedia-now-playing.vala")
+-endif()
++list(REMOVE_ITEM EXTENSIONS "webmedia-now-playing.vala")
+ 
+ foreach(UNIT_SRC ${EXTENSIONS})
+     string(FIND ${UNIT_SRC} ".c" UNIT_EXTENSION)
diff --git a/package/midori/Config.in b/package/midori/Config.in
index c3b5a1b..b3ab8a9 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,20 +1,35 @@
+comment "midori needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
+	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_MIDORI
 	bool "midori"
-	select BR2_PACKAGE_WEBKIT
-	select BR2_PACKAGE_LIBSEXY
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP_GNOME
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_WEBKITGTK24
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_INSTALL_LIBSTDCPP # webkit
-	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
-	depends on BR2_USE_WCHAR	 # webkit
-	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
+	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
+	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk24
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # webkitgtk24
+	depends on BR2_USE_WCHAR # webkitgtk24
+	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
-	  http://software.twotoasts.de/?page=midori
+	  http://www.midori-browser.org/
 
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
-	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
+if BR2_PACKAGE_MIDORI
+
+config BR2_PACKAGE_MIDORI_HTTPS
+	bool "HTTPS support"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_GLIB_NETWORKING
+	select BR2_PACKAGE_GNUTLS # for glib-networking
+	help
+	  Enable HTTPS protocol support
+
+endif
diff --git a/package/midori/midori.hash b/package/midori/midori.hash
new file mode 100644
index 0000000..7aae4c1
--- /dev/null
+++ b/package/midori/midori.hash
@@ -0,0 +1,2 @@
+# From download link @ http://midori-browser.org/download/source/
+sha1	475614dcc89a214a3c2fdc2aaefc817a5fa0ca03	midori_0.5.9_all_.tar.bz2
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index a8b0b37..ed2cdd8 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,45 +4,45 @@
 #
 ################################################################################
 
-MIDORI_VERSION_MAJOR = 0.4
-MIDORI_VERSION = $(MIDORI_VERSION_MAJOR).6
-MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)
+MIDORI_VERSION = 0.5.9
+MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
+MIDORI_SITE = https://launchpad.net/midori/trunk/$(MIDORI_VERSION)/+download
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
+	host-librsvg \
 	host-pkgconf \
 	host-vala \
 	host-python \
-	libgtk2 \
-	libsexy \
-	webkit \
+	libsoup \
+	libxml2 \
+	sqlite \
+	webkitgtk24 \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-ifneq ($(BR2_PACKAGE_XORG7),y)
-define MIDORI_WITHOUT_X11
-	$(SED) "s/check_pkg ('x11')/#check_pkg ('x11')/" $(@D)/wscript
-endef
-endif
+MIDORI_CONF_OPTS = \
+	-DUSE_ZEITGEIST=OFF
 
-define MIDORI_CONFIGURE_CMDS
-	$(MIDORI_WITHOUT_X11)
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS)	\
-		$(HOST_DIR)/usr/bin/python2 ./waf configure \
-		--prefix=/usr			\
-		--disable-libnotify		\
-	)
+# Requires uClibc backtrace support, normally not enabled
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+define MIDORI_REMOVE_DEVPET
+	rm -f $(@D)/extensions/devpet.vala
 endef
+MIDORI_POST_PATCH_HOOKS += MIDORI_REMOVE_DEVPET
+endif
 
-define MIDORI_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
-endef
+ifeq ($(BR2_PACKAGE_MIDORI_HTTPS),y)
+MIDORI_DEPENDENCIES += glib-networking
+endif
 
-define MIDORI_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
-endef
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
+MIDORI_DEPENDENCIES += libgtk3
+else
+MIDORI_CONF_OPTS += -DUSE_GTK3=OFF
+MIDORI_DEPENDENCIES += libgtk2
+endif
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.3.6
