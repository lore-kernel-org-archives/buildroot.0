From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 17:08:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lua
Message-ID: <20071130010837.EA3DFA4599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 17:08:36 -0800 (Thu, 29 Nov 2007)
New Revision: 20591

Log:
Add lua package

Added:
   trunk/buildroot/package/lua/
   trunk/buildroot/package/lua/Config.in
   trunk/buildroot/package/lua/lua.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-29 13:30:17 UTC (rev 20590)
+++ trunk/buildroot/package/Config.in	2007-11-30 01:08:36 UTC (rev 20591)
@@ -407,6 +407,7 @@
 	  Support for scripting languages, interpreter languages.
 
 if BR2_SCRIPTING_SUPPORT
+source "package/lua/Config.in"
 source "package/microperl/Config.in"
 source "package/python/Config.in"
 source "package/ruby/Config.in"

Added: trunk/buildroot/package/lua/Config.in
===================================================================
--- trunk/buildroot/package/lua/Config.in	                        (rev 0)
+++ trunk/buildroot/package/lua/Config.in	2007-11-30 01:08:36 UTC (rev 20591)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA
+	bool "lua"
+	default n
+	depends on BR2_READLINE
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Lua is a powerful, fast, light-weight, embeddable scripting language.
+
+	  http://www.lua.org/
+
+comment "lua		- disabled (requires readline and ncurses)"
+	depends on !BR2_READLINE && !BR2_PACKAGE_NCURSES

Added: trunk/buildroot/package/lua/lua.mk
===================================================================
--- trunk/buildroot/package/lua/lua.mk	                        (rev 0)
+++ trunk/buildroot/package/lua/lua.mk	2007-11-30 01:08:36 UTC (rev 20591)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# lua
+#
+#############################################################
+
+LUA_VERSION=5.1.2
+
+LUA_SOURCE=lua-$(LUA_VERSION).tar.gz
+LUA_CAT:=$(ZCAT)
+LUA_SITE=http://www.lua.org/ftp
+
+LUA_DIR=$(BUILD_DIR)/lua-$(LUA_VERSION)
+
+LUA_CFLAGS=-DLUA_USE_LINUX 
+LUA_MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
+
+$(DL_DIR)/$(LUA_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LUA_SITE)/$(LUA_SOURCE)
+
+$(LUA_DIR)/.unpacked: $(DL_DIR)/$(LUA_SOURCE)
+	$(LUA_CAT) $(DL_DIR)/$(LUA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LUA_DIR)/.unpacked
+
+$(LUA_DIR)/src/lua: $(LUA_DIR)/.unpacked
+	rm -f $@
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		MYCFLAGS=$(LUA_CFLAGS) \
+		MYLIBS=$(LUA_MYLIBS) \
+		AR="$(TARGET_CROSS)ar rcu" \
+		-C $(LUA_DIR)/src all
+
+$(LUA_DIR)/src/luac: $(LUA_DIR)/src/lua
+
+$(LUA_DIR)/src/liblua.a: $(LUA_DIR)/src/lua
+
+$(STAGING_DIR)/usr/lib/liblua.a: $(LUA_DIR)/src/liblua.a
+	cp -dpf $(LUA_DIR)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
+
+$(STAGING_DIR)/usr/bin/lua: $(LUA_DIR)/src/lua
+	cp -dpf $(LUA_DIR)/src/lua $(STAGING_DIR)/usr/bin/lua
+
+$(STAGING_DIR)/usr/bin/luac: $(LUA_DIR)/src/luac
+	cp -dpf $(LUA_DIR)/src/luac $(STAGING_DIR)/usr/bin/luac
+
+$(TARGET_DIR)/usr/lib/liblua.a: $(STAGING_DIR)/usr/lib/liblua.a
+	cp -dpf $(STAGING_DIR)/usr/lib/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+
+$(TARGET_DIR)/usr/bin/lua: $(STAGING_DIR)/usr/bin/lua
+	cp -dpf $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/lua
+
+$(TARGET_DIR)/usr/bin/luac: $(STAGING_DIR)/usr/bin/luac
+	cp -dpf $(STAGING_DIR)/usr/bin/luac $(TARGET_DIR)/usr/bin/luac
+
+
+lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac 
+
+lua-libs:	$(TARGET_DIR)/usr/lib/liblua.a
+
+lua: uclibc readline ncurses lua-bins lua-libs
+
+lua-source: $(DL_DIR)/$(LUA_SOURCE)
+
+lua-clean:
+	@if [ -d $(LUA_DIR)/Makefile ]; then \
+		$(MAKE) -C $(LUA_DIR) clean; \
+	fi
+
+lua-dirclean:
+	rm -rf $(LUA_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LUA)),y)
+TARGETS+=lua
+endif
