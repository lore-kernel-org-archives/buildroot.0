From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2013 11:16:12 +0100
Subject: [Buildroot] [pkg-luarocks infra 5/5] refactor with luarocks
	infrastructure
In-Reply-To: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
References: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1383214572-8216-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(only pure Lua modules)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/cgilua.mk                      |   15 +++-----------
 package/copas/copas.mk                        |   15 +++-----------
 package/orbit/orbit-01-fix-installation.patch |   26 -------------------------
 package/orbit/orbit.mk                        |   13 +++----------
 package/wsapi/wsapi.mk                        |   16 +++------------
 package/xavante/xavante.mk                    |   16 +++------------
 6 files changed, 15 insertions(+), 86 deletions(-)
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 663cbc4..11b7188 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,17 +4,8 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4
-CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
+CGILUA_VERSION_UPSTREAM = 5.1.4
+CGILUA_VERSION = $(CGILUA_VERSION_UPSTREAM)-1
 CGILUA_LICENSE = MIT
 
-define CGILUA_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
-endef
-
-define CGILUA_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/5.1/cgilua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/5.1/cgilua.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 99aacbc..3680a5b 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,17 +4,8 @@
 #
 ################################################################################
 
-COPAS_VERSION = 1.1.6
-COPAS_SITE = http://github.com/downloads/keplerproject/copas
+COPAS_VERSION_UPSTREAM = 1.1.6
+COPAS_VERSION = $(COPAS_VERSION_UPSTREAM)-1
 COPAS_LICENSE = MIT
 
-define COPAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/copas.lua
-endef
-
-define COPAS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/5.1/copas.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/orbit/orbit-01-fix-installation.patch b/package/orbit/orbit-01-fix-installation.patch
deleted file mode 100644
index ae50ad9..0000000
--- a/package/orbit/orbit-01-fix-installation.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix installation commands
-
-The installation commands did not match the location of the source
-files within the Orbit source tree.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -11,12 +11,9 @@
- 	mkdir -p $(LUA_DIR)
- 	cp src/orbit.lua $(LUA_DIR)
- 	mkdir -p $(LUA_DIR)/orbit
--	cp src/model.lua $(LUA_DIR)/orbit
--	cp src/cache.lua $(LUA_DIR)/orbit
--	cp src/pages.lua $(LUA_DIR)/orbit
--	cp src/ophandler.lua $(LUA_DIR)/orbit
-+	cp src/orbit/*.lua $(LUA_DIR)/orbit
- 	mkdir -p $(BIN_DIR)
--	cp src/orbit $(BIN_DIR)
-+	cp src/launchers/* $(BIN_DIR)
- 	if [ -f ./wsapi/Makefile ]; then \
- 	  cd wsapi && make install; \
- 	fi
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 7115896..8cbf5e5 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,16 +4,9 @@
 #
 ################################################################################
 
-ORBIT_VERSION = 2.2.0
-ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
+ORBIT_VERSION_UPSTREAM = 2.2.0
+ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-2
 ORBIT_LICENSE = MIT
 ORBIT_LICENSE_FILES = doc/us/license.md
 
-define ORBIT_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) \
-		LUA_DIR=$(TARGET_DIR)/usr/share/lua/5.1/ \
-		BIN_DIR=$(TARGET_DIR)/usr/bin \
-		install
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 743d4b9..1cd33ba 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,18 +4,8 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.5
-WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
+WSAPI_VERSION_UPSTREAM = 1.5
+WSAPI_VERSION = $(WSAPI_VERSION_UPSTREAM)-1
 WSAPI_LICENSE = MIT
 
-define WSAPI_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/lua/5.1/wsapi
-	$(INSTALL) -m 0644 -D $(@D)/src/wsapi/*.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/wsapi
-endef
-
-define WSAPI_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/5.1/wsapi"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 069092d..c21ab06 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,18 +4,8 @@
 #
 ################################################################################
 
-XAVANTE_VERSION = 2.2.1
-XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
+XAVANTE_VERSION_UPSTREAM = 2.2.0
+XAVANTE_VERSION = $(XAVANTE_VERSION_UPSTREAM)-1
 XAVANTE_LICENSE = MIT
 
-define XAVANTE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)/usr" install
-endef
-
-define XAVANTE_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/5.1/xavante"
-	rm -f "$(TARGET_DIR)/usr/share/5.1/xavante.lua"
-	rm -f "$(TARGET_DIR)/usr/share/5.1/sajax.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
-- 
1.7.9.5
