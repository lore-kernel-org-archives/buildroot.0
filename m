From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:13 +0200
Subject: [Buildroot] [RFCv2 18/19] Remove BR2_HAVE_DEVFILES
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This finally removes the BR2_HAVE_DEVFILES option, that was used to
install/keep development files on target. With the recent migration of
the internal backend to the package infrastructure, we had anyway lost
the ability to build gcc for the target, and install the uClibc
development files on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                           |  8 --------
 Makefile                            |  4 ----
 package/dbus/dbus.mk                |  2 --
 package/libdnet/libdnet.mk          |  2 --
 package/libglib2/libglib2.mk        |  2 --
 package/lua/lua.mk                  | 13 -------------
 package/multimedia/mpg123/mpg123.mk |  3 +--
 package/ncurses/ncurses.mk          | 20 --------------------
 package/opencv/opencv.mk            |  2 --
 package/openssl/openssl.mk          | 12 ------------
 package/orc/orc.mk                  |  3 ---
 package/pkg-generic.mk              |  2 --
 package/python/python.mk            | 16 +++-------------
 package/python3/python3.mk          | 16 +++-------------
 package/sdl_sound/sdl_sound.mk      |  2 +-
 package/taglib/taglib.mk            |  2 --
 package/usbutils/usbutils.mk        |  2 --
 package/xenomai/xenomai.mk          |  2 --
 18 files changed, 8 insertions(+), 105 deletions(-)

diff --git a/Config.in b/Config.in
index bbb9885..78dea3b 100644
--- a/Config.in
+++ b/Config.in
@@ -419,14 +419,6 @@ config BR2_HAVE_DOCUMENTATION
 	  If you say n here, your target will not contain any
 	  documentation.
 
-config BR2_HAVE_DEVFILES
-	bool "development files in target filesystem"
-	# We no longer want to support a toolchain on the target
-	depends on BR2_DEPRECATED
-	help
-	  Install headers and static libraries in the
-	  target filesystem
-
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
 	default "$(TOPDIR)/local.mk"
diff --git a/Makefile b/Makefile
index 823a397..9a97791 100644
--- a/Makefile
+++ b/Makefile
@@ -444,16 +444,12 @@ STRIP_FIND_CMD += -type f -perm +111
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 target-finalize:
-ifeq ($(BR2_HAVE_DEVFILES),y)
-	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
-else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
-endif
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index cb72f1f..37960f2 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -61,9 +61,7 @@ define DBUS_REMOVE_DEVFILES
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 endef
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
-endif
 
 define DBUS_INSTALL_TARGET_FIXUP
 	rm -rf $(TARGET_DIR)/var/lib/dbus
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 78f0ae0..ea10251 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -34,8 +34,6 @@ define LIBDNET_REMOVE_CONFIG_SCRIPT
 	$(RM) -f $(TARGET_DIR)/usr/bin/dnet-config
 endef
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
-endif
 
 $(eval $(autotools-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4821a76..8fb10f2 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -103,9 +103,7 @@ define LIBGLIB2_REMOVE_DEV_FILES
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
 endef
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
-endif
 
 define LIBGLIB2_REMOVE_GDB_FILES
 	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ac75fe6..904ca52 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -64,18 +64,6 @@ define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include/lauxlib.h
 endef
 
-ifeq ($(BR2_HAVE_DEVFILES),y)
-define LUA_INSTALL_DEVFILES
-	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(TARGET_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(TARGET_DIR)/usr/include/lua.h
-	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(TARGET_DIR)/usr/include/luaconf.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(TARGET_DIR)/usr/include/lualib.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(TARGET_DIR)/usr/include/lauxlib.h
-endef
-endif
-
-
 define LUA_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
 	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
@@ -83,7 +71,6 @@ define LUA_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
 	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-	$(LUA_INSTALL_DEVFILES)
 endef
 
 define HOST_LUA_INSTALL_CMDS
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index f554043..e9d074f 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -61,8 +61,7 @@ MPG123_CONF_OPT += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 MPG123_DEPENDENCIES += libtool
-# .la files gets stripped unless HAVE_DEVFILES is enabled, so directly
-# load .so files rather than .la
+# .la files gets stripped , so directly load .so files rather than .la
 MPG123_CONF_OPT += --with-modules --with-module-suffix=.so
 endif
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5381bd1..dbb514e 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -38,25 +38,6 @@ define NCURSES_BUILD_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
-ifeq ($(BR2_HAVE_DEVFILES),y)
-define NCURSES_INSTALL_TARGET_DEVFILES
-	mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/curses.h
-	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
-	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
-	(cd $(TARGET_DIR)/usr/lib; \
-	 ln -fs libncurses.a libcurses.a; \
-	 ln -fs libncurses.a libtermcap.a; \
-	)
-	(cd $(TARGET_DIR)/usr/include; ln -fs curses.h ncurses.h)
-	rm -f $(TARGET_DIR)/usr/lib/libncurses.so
-	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.so.$(NCURSES_VERSION) libncurses.so)
-endef
-endif
-
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
@@ -101,7 +82,6 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
-	$(NCURSES_INSTALL_TARGET_DEVFILES)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
 #
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 3bf7ee9..b9ed8cb 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -169,12 +169,10 @@ endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
 endif
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 define OPENCV_CLEAN_INSTALL_CMAKE
 	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
 endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
-endif
 
 ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
 define OPENCV_CLEAN_INSTALL_DATA
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index e16c91f..a0e103b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -105,22 +105,10 @@ endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
-endef
-
-define OPENSSL_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_DEV_FILES
-endif
-
-define OPENSSL_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS
-
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 
 # libraries gets installed read only, so strip fails
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 9d9921a..dc93882 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -20,10 +20,7 @@ define ORC_REMOVE_DEVFILES
 endef
 
 ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_BUGREPORT
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
 ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
-endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 56fca6b..668f011 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -153,11 +153,9 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
-ifeq ($(BR2_HAVE_DEVFILES),)
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
-endif
 	$(Q)touch $@
 
 # Clean package
diff --git a/package/python/python.mk b/package/python/python.mk
index 363513d..975d6f4 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -151,23 +151,13 @@ endef
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_SMTPD
 
 #
-# Development files removal
-#
-define PYTHON_REMOVE_DEVFILES
-	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
-	rm -f $(TARGET_DIR)/usr/bin/python2-config
-	rm -f $(TARGET_DIR)/usr/bin/python-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_DEVFILES
-endif
-
-#
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
 #
 define PYTHON_REMOVE_USELESS_FILES
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python2-config
+	rm -f $(TARGET_DIR)/usr/bin/python-config
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 11ffe61..bf78ee6 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -127,23 +127,13 @@ endef
 PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_LIBDIR
 
 #
-# Development files removal
-#
-define PYTHON3_REMOVE_DEVFILES
-	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
-	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
-	rm -f $(TARGET_DIR)/usr/bin/python3-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_DEVFILES
-endif
-
-#
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
 #
 define PYTHON3_REMOVE_USELESS_FILES
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
+	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index ae449ae..cd1ed3e 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -48,7 +48,7 @@ SDL_SOUND_POST_INSTALL_TARGET_HOOKS += SDL_SOUND_REMOVE_PLAYSOUND
 endif
 
 # target shared libs doesn't get removed by make uninstall if the .la
-# files are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
+# files are removed
 define SDL_SOUND_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 8260293..75e8e67 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -22,8 +22,6 @@ define TAGLIB_REMOVE_DEVFILE
 	rm -f $(TARGET_DIR)/usr/bin/taglib-config
 endef
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
-endif
 
 $(eval $(cmake-package))
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index e679b26..c56702b 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -51,8 +51,6 @@ define USBUTILS_REMOVE_DEVFILES
 	rm -f $(TARGET_DIR)/usr/bin/libusb-config
 endef
 
-ifneq ($(BR2_HAVE_DEVFILES),y)
 USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
-endif
 
 $(eval $(autotools-package))
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 14c616e..8598953 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -19,7 +19,6 @@ XENOMAI_INSTALL_STAGING = YES
 
 XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
 
-ifeq ($(BR2_HAVE_DEVFILES),)
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
@@ -27,7 +26,6 @@ define XENOMAI_REMOVE_DEVFILES
 endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DEVFILES
-endif
 
 ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
 define XENOMAI_REMOVE_TESTSUITE
-- 
1.8.1.2
