From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:36 +0200
Subject: [Buildroot] [RFC v4 02/16] packages: for staging stuff use backtick
	instead of the shell function
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the shell function execute the command before the per-package
staging directory is created, use the backtick that is executed after
the per-package staging directory is created.

This commit prevents build failures when the per-package staging feature
is added.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/dbus-python/dbus-python.mk       |  8 ++++----
 package/python-gobject/python-gobject.mk |  4 ++--
 package/python-pygame/python-pygame.mk   |  6 +++---
 package/qt/qt.mk                         | 14 +++++++-------
 package/tcpreplay/tcpreplay.mk           |  6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 9bda018..4079967 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -17,15 +17,15 @@ DBUS_PYTHON_DEPENDENCIES += python host-python
 
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)" \
-	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python2-config --ldflags)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)" \
-	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python3-config --ldflags)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index c47954c..74cb054 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -20,13 +20,13 @@ PYTHON_GOBJECT_DEPENDENCIES += python host-python
 
 PYTHON_GOBJECT_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
 else
 PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
 
 PYTHON_GOBJECT_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 51f1c20..995f80a 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -66,14 +66,14 @@ define PYTHON_PYGAME_UNCONFIGURE_SCRAP
 endef
 endif
 
-PYTHON_PYGAME_SDL_FLAGS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
-PYTHON_PYGAME_SDL_FLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)
+PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
+PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
 
 # Pygame needs a Setup file where options should be commented out if
 # dependencies are not available
 define PYTHON_PYGAME_CONFIGURE_CMDS
 	cp -f $(@D)/Setup.in $(@D)/Setup
-	$(SED) 's~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~' $(@D)/Setup
+	$(SED) "s~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~" $(@D)/Setup
 	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
 	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
 	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b2b9bbe..a4a55ec 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -230,9 +230,9 @@ QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
                 xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
 # Using pkg-config avoids us some logic to redefine and sed again mkspecs files
 # to add X11 include path and link options
-QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
-QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
-QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs x11 xext)
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs x11 xext`
 QT_CONFIGURE_OPTS += -arch $(QT_EMB_PLATFORM) \
 		-xplatform qws/linux-$(QT_EMB_PLATFORM)-g++ -x11 -no-gtkstyle -no-sm \
 		-no-openvg
@@ -329,9 +329,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
 QT_DEPENDENCIES += libgles libegl
-QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs egl`
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
@@ -473,7 +473,7 @@ QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 ################################################################################
 define QT_QMAKE_SET
 	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) "/include.*qws.conf/a$(1) = $(2)" $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
 ifneq ($(QT_CONFIG_FILE),)
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 1dbe453..f6bd08f 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -16,9 +16,9 @@ TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
 # libpcap may depend on symbols in other libs
-TCPREPLAY_LIBS = $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --libs)
-TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)' \
-	LIBS="$(TCPREPLAY_LIBS)"
+TCPREPLAY_LIBS = $(STAGING_DIR)/usr/bin/pcap-config --static --libs
+TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close="`$(TCPREPLAY_LIBS)`" \
+	LIBS="`$(TCPREPLAY_LIBS)`"
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
-- 
2.4.3
