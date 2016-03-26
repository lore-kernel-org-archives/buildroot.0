From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:09 -0300
Subject: [Buildroot] [PATCH 3/5] midori: bump to version 0.5.11
In-Reply-To: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459020911-20593-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop BR2_PACKAGE_MIDORI_HTTPS option since it's now handled in the
webkitgtk package to satisfy MiniBrowser.

This version can't work with the older webkitgtk24 engine so it switches
to the new version.

Also make gcr support conditional on x11 support for libgtk3, it doesn't
work otherwise.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/midori/0001-disable-libnotify.patch | 43 ----------------------------
 package/midori/0001-fix-bug-1492932.patch   | 44 +++++++++++++++++++++++++++++
 package/midori/0002-gcr-for-x11-only.patch  | 32 +++++++++++++++++++++
 package/midori/0002-new-vala.patch          | 26 -----------------
 package/midori/Config.in                    | 36 ++++++++---------------
 package/midori/midori.hash                  |  2 +-
 package/midori/midori.mk                    | 36 ++++++-----------------
 7 files changed, 98 insertions(+), 121 deletions(-)
 delete mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/0001-fix-bug-1492932.patch
 create mode 100644 package/midori/0002-gcr-for-x11-only.patch
 delete mode 100644 package/midori/0002-new-vala.patch

diff --git a/package/midori/0001-disable-libnotify.patch b/package/midori/0001-disable-libnotify.patch
deleted file mode 100644
index 830ecff..0000000
--- a/package/midori/0001-disable-libnotify.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Disable libnotify support, we've got no package and it's not very useful
-in embedded targets anyway.
-The webmedia extension requires libnotify as well.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura midori-0.5.9.orig/CMakeLists.txt midori-0.5.9/CMakeLists.txt
---- midori-0.5.9.orig/CMakeLists.txt	2015-03-30 15:57:29.554632932 -0300
-+++ midori-0.5.9/CMakeLists.txt	2015-03-30 15:57:35.299830192 -0300
-@@ -143,16 +143,7 @@
-     endif ()
- endif ()
- 
--if (WIN32)
--    add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
--else ()
--    pkg_check_modules(NOTIFY REQUIRED libnotify)
--    add_definitions("-DLIBNOTIFY_VERSION=\"${NOTIFY_VERSION}\"")
--    add_definitions("-DHAVE_LIBNOTIFY")
--    set(OPTS_INCLUDE_DIRS "${OPTS_INCLUDE_DIRS};${NOTIFY_INCLUDE_DIRS}")
--    set(OPTS_LIBRARIES "${OPTS_LIBRARIES};${NOTIFY_LIBRARIES}")
--    set(PKGS ${PKGS} libnotify)
--endif ()
-+add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
- 
- option(USE_GTK3 "Use GTK+3" OFF)
- option(HALF_BRO_INCOM_WEBKIT2 "Serve as a guniea pig" OFF)
-diff -Nura midori-0.5.9.orig/extensions/CMakeLists.txt midori-0.5.9/extensions/CMakeLists.txt
---- midori-0.5.9.orig/extensions/CMakeLists.txt	2015-03-30 15:57:29.544632589 -0300
-+++ midori-0.5.9/extensions/CMakeLists.txt	2015-03-30 15:57:51.777395949 -0300
-@@ -24,11 +24,7 @@
-          )
- endif ()
- 
--# FIXME: re-enable webmedia extension
--# once we have working notifications on win
--if (WIN32)
--    list(REMOVE_ITEM EXTENSIONS "webmedia-now-playing.vala")
--endif()
-+list(REMOVE_ITEM EXTENSIONS "webmedia-now-playing.vala")
- 
- foreach(UNIT_SRC ${EXTENSIONS})
-     string(FIND ${UNIT_SRC} ".c" UNIT_EXTENSION)
diff --git a/package/midori/0001-fix-bug-1492932.patch b/package/midori/0001-fix-bug-1492932.patch
new file mode 100644
index 0000000..27ad283
--- /dev/null
+++ b/package/midori/0001-fix-bug-1492932.patch
@@ -0,0 +1,44 @@
+Fix for https://bugs.launchpad.net/midori/+bug/1492932
+Patch status: upstream
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/midori/midori-browser.c	2015-07-11 16:03:43 +0000
++++ b/midori/midori-browser.c	2015-09-25 21:30:31 +0000
+@@ -5953,11 +5953,6 @@
+                       G_CALLBACK (midori_browser_destroy_cb), NULL);
+     gtk_window_set_role (GTK_WINDOW (browser), "browser");
+     gtk_window_set_icon_name (GTK_WINDOW (browser), MIDORI_STOCK_WEB_BROWSER);
+-    #if GTK_CHECK_VERSION (3, 4, 0)
+-    #ifndef HAVE_GRANITE
+-    gtk_window_set_hide_titlebar_when_maximized (GTK_WINDOW (browser), TRUE);
+-    #endif
+-    #endif
+     vbox = gtk_vbox_new (FALSE, 0);
+     /* gtk_container_add (GTK_CONTAINER (browser), vbox);
+     gtk_widget_show (vbox); */
+
+--- a/midori/midori-view.c	2015-07-06 21:26:46 +0000
++++ b/midori/midori-view.c	2015-09-25 21:30:31 +0000
+@@ -3495,9 +3495,6 @@
+     }
+     else
+         gtk_window_set_icon_name (GTK_WINDOW (window), icon_name);
+-    #if GTK_CHECK_VERSION (3, 4, 0)
+-    gtk_window_set_hide_titlebar_when_maximized (GTK_WINDOW (window), TRUE);
+-    #endif
+     gtk_widget_set_size_request (GTK_WIDGET (inspector_view), 700, 100);
+     #if GTK_CHECK_VERSION (3, 0, 0)
+     scrolled = gtk_scrolled_window_new (NULL, NULL);
+
+--- a/midori/midori-window.vala	2015-08-16 00:14:26 +0000
++++ b/midori/midori-window.vala	2015-09-25 21:30:31 +0000
+@@ -28,7 +28,6 @@
+                 toolbar.show_arrow = true;
+ #if HAVE_GTK3
+                 toolbar.get_style_context ().add_class ("primary-toolbar");
+-                hide_titlebar_when_maximized = true;
+ #endif
+                 toolbar.popup_context_menu.connect ((x, y, button) => {
+                     return button == 3 && context_menu (toolbar); });
+
diff --git a/package/midori/0002-gcr-for-x11-only.patch b/package/midori/0002-gcr-for-x11-only.patch
new file mode 100644
index 0000000..85e7697
--- /dev/null
+++ b/package/midori/0002-gcr-for-x11-only.patch
@@ -0,0 +1,32 @@
+GCR support only works/is useful with X11 support.
+
+Reported upstream: https://bugs.launchpad.net/midori/+bug/1515985
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura midori-0.5.11.orig/CMakeLists.txt midori-0.5.11/CMakeLists.txt
+--- midori-0.5.11.orig/CMakeLists.txt	2015-11-12 13:41:02.045898814 -0300
++++ midori-0.5.11/CMakeLists.txt	2015-11-12 14:00:09.765545018 -0300
+@@ -175,18 +175,14 @@
+     set(PKGS ${PKGS} zeitgeist-2.0)
+ endif()
+ 
+-if (WIN32)
+-    add_definitions("-DGCR_VERSION=\"No\"")
+-else ()
+-    if (USE_GTK3)
+-        pkg_check_modules(GCR REQUIRED gcr-3>=2.32)
+-    else ()
+-        pkg_check_modules(GCR REQUIRED gcr-base-3>=2.32)
+-    endif ()
++if (USE_GTK3 AND X11)
++    pkg_check_modules(GCR REQUIRED gcr-3>=2.32)
+     add_definitions("-DGCR_VERSION=\"${GCR_VERSION}\"")
+     add_definitions("-DHAVE_GCR")
+     set(OPTS_INCLUDE_DIRS ${OPTS_INCLUDE_DIRS} ${GCR_INCLUDE_DIRS})
+     set(OPTS_LIBRARIES ${OPTS_LIBRARIES} ${GCR_LIBRARIES})
++else ()
++    add_definitions("-DGCR_VERSION=\"No\"")
+ endif ()
+ 
+ if (HALF_BRO_INCOM_WEBKIT2)
diff --git a/package/midori/0002-new-vala.patch b/package/midori/0002-new-vala.patch
deleted file mode 100644
index 600ff49..0000000
--- a/package/midori/0002-new-vala.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix build with newer (0.28+) vala versions, from:
-http://www.linuxquestions.org/questions/slackware-14/midori-compile-fail-ambiguous-reference-between-glib-and-gtk-4175542325/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura midori-0.5.9.orig/extensions/history-list.vala midori-0.5.9/extensions/history-list.vala
---- midori-0.5.9.orig/extensions/history-list.vala	2015-07-03 21:05:01.183360199 -0300
-+++ midori-0.5.9/extensions/history-list.vala	2015-07-03 21:05:48.959900926 -0300
-@@ -319,7 +319,7 @@
-         }
- 
-         private void create_widgets () {
--            ListStore model;
-+            Gtk.ListStore model;
-             TreeIter iter;
-             TreeIter? active_iter = null;
- 
-@@ -331,7 +331,7 @@
- 
-             var tab_closing_behavior = this.hl_manager.get_integer ("TabClosingBehavior");
- 
--            model = new ListStore (2, typeof (string), typeof (int));
-+            model = new Gtk.ListStore (2, typeof (string), typeof (int));
- 
-             model.append (out iter);
-             model.set (iter, TabClosingBehaviorModel.TEXT, _("Do nothing"),
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 11a2806..ba8ea5a 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,37 +1,25 @@
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_LIBGTK2 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "midori needs libgtk3 and an (e)glibc toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
+	# GCR can only be used with the X11 backend
+	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_GRANITE
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBSOUP_GNOME
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_WEBKITGTK24
+	select BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
-	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk24
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # webkitgtk24
-	depends on BR2_USE_WCHAR # webkitgtk24
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # webkitgtk24
-	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND
+	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://www.midori-browser.org/
-
-if BR2_PACKAGE_MIDORI
-
-config BR2_PACKAGE_MIDORI_HTTPS
-	bool "HTTPS support"
-	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	select BR2_PACKAGE_GLIB_NETWORKING
-	select BR2_PACKAGE_GNUTLS # for glib-networking
-	help
-	  Enable HTTPS protocol support
-
-endif
diff --git a/package/midori/midori.hash b/package/midori/midori.hash
index 7aae4c1..f548c42 100644
--- a/package/midori/midori.hash
+++ b/package/midori/midori.hash
@@ -1,2 +1,2 @@
 # From download link @ http://midori-browser.org/download/source/
-sha1	475614dcc89a214a3c2fdc2aaefc817a5fa0ca03	midori_0.5.9_all_.tar.bz2
+sha1	64c86935028feb5f89d799c2acacaad67764da6f	midori_0.5.11_all_.tar.bz2
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 7927400..5aa83c6 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MIDORI_VERSION = 0.5.9
+MIDORI_VERSION = 0.5.11
 MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
-MIDORI_SITE = https://launchpad.net/midori/trunk/$(MIDORI_VERSION)/+download
+MIDORI_SITE = http://midori-browser.org/downloads
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
@@ -15,38 +15,20 @@ MIDORI_DEPENDENCIES = \
 	host-pkgconf \
 	host-vala \
 	host-python \
+	$(if $(BR2_PACKAGE_LIBGTK3_X11),gcr) \
+	granite \
+	libgtk3 \
 	libsoup \
 	libxml2 \
 	sqlite \
-	webkitgtk24 \
+	webkitgtk \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 MIDORI_CONF_OPTS = \
+	-DHALF_BRO_INCOM_WEBKIT2=ON \
+	-DUSE_GRANITE=ON \
+	-DUSE_GTK3=ON \
 	-DUSE_ZEITGEIST=OFF
 
-# Requires uClibc backtrace support, normally not enabled
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-define MIDORI_REMOVE_DEVPET
-	rm -f $(@D)/extensions/devpet.vala
-endef
-MIDORI_POST_PATCH_HOOKS += MIDORI_REMOVE_DEVPET
-endif
-
-ifeq ($(BR2_PACKAGE_MIDORI_HTTPS),y)
-MIDORI_DEPENDENCIES += glib-networking
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
-MIDORI_DEPENDENCIES += libgtk3
-# Only useful with gtk3
-ifeq ($(BR2_PACKAGE_GCR),y)
-MIDORI_DEPENDENCIES += gcr
-endif
-else
-MIDORI_CONF_OPTS += -DUSE_GTK3=OFF
-MIDORI_DEPENDENCIES += libgtk2
-endif
-
 $(eval $(cmake-package))
-- 
2.7.3
