From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri, 18 Jul 2014 17:39:39 +0200
Subject: [Buildroot] [PATCH v2 4/4] midori: bump to version 0.5.8
In-Reply-To: <1405697979-23957-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1405697979-23957-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1405697979-23957-5-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - fix typo
---
 package/midori/Config.in                           | 15 ++++---
 .../midori-0001-remove-libnotify-dependency.patch  | 27 ++++++++++++
 package/midori/midori.mk                           | 51 +++++++++-------------
 3 files changed, 57 insertions(+), 36 deletions(-)
 create mode 100644 package/midori/midori-0001-remove-libnotify-dependency.patch

diff --git a/package/midori/Config.in b/package/midori/Config.in
index c3b5a1b..821b306 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,20 +1,23 @@
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
-	select BR2_PACKAGE_LIBSEXY
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP_GNOME
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
-	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_USE_WCHAR # webkit, libsoup -> libglib2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
+comment "midori needs libgtk2 or libgtk3 and a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3)
diff --git a/package/midori/midori-0001-remove-libnotify-dependency.patch b/package/midori/midori-0001-remove-libnotify-dependency.patch
new file mode 100644
index 0000000..edd1e17
--- /dev/null
+++ b/package/midori/midori-0001-remove-libnotify-dependency.patch
@@ -0,0 +1,27 @@
+Remove the libnotify dependency.
+
+For now there is no libnotify package in Buildroot and this feature does not
+seem necessary.
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
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
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index d55f5f1..9bbce37 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,45 +4,36 @@
 #
 ################################################################################
 
-MIDORI_VERSION_MAJOR = 0.4
-MIDORI_VERSION = $(MIDORI_VERSION_MAJOR).6
-MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)/
+MIDORI_VERSION = 0.5.8
+MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
+MIDORI_SITE = http://midori-browser.org/downloads/
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-pkgconf \
 	host-vala \
-	host-python \
-	libgtk2 \
-	libsexy \
+	libsoup \
+	sqlite \
+	libxml2 \
 	webkit \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-ifneq ($(BR2_PACKAGE_XORG7),y)
-define MIDORI_WITHOUT_X11
-	$(SED) "s/check_pkg ('x11')/#check_pkg ('x11')/" $(@D)/wscript
-endef
-endif
-
-define MIDORI_CONFIGURE_CMDS
-	$(MIDORI_WITHOUT_X11)
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS)	\
-		$(HOST_DIR)/usr/bin/python2 ./waf configure \
-		--prefix=/usr			\
-		--disable-libnotify		\
-       )
-endef
+MIDORI_CONF_OPT = -DUSE_ZEITGEIST=OFF
 
-define MIDORI_BUILD_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
-endef
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+# The actual WebKit logic in Buildroot enable webkit2 when WebKit uses GTK+3
+MIDORI_CONF_OPT += \
+	-DUSE_GTK3=ON \
+	-DHALF_BRO_INCOM_WEBKIT2=ON
+MIDORI_DEPENDENCIES += libgtk3
+else
+MIDORI_DEPENDENCIES += libgtk2
+endif
 
-define MIDORI_INSTALL_TARGET_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
+define MIDORI_EXTRACT_CMDS
+	$(call suitable-extractor,$(MIDORI_SOURCE)) $(DL_DIR)/$(MIDORI_SOURCE) \
+		| $(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D) $(TAR_OPTIONS) -
 endef
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.0.1
