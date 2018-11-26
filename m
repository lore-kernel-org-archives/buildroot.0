From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:21:13 +0100
Subject: [Buildroot] [git commit] package/civetweb: bump version to 1.11
Message-ID: <20181202071559.DEA8A803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db47bc99976c2d4ffb509620a76cfdd369b30559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v1.11 now has library and header install targets for use by apps that
serve pages.  The config changes allow enabling the civetweb webserver
app binary and/or libs and headers.

The C++ interface option is automatically enabled if C++ support is
available.

The civetweb Makefile sets -fPIC in CFLAGS when linking shared
objects, but not when compiling the objects used in the library
resulting in a link failure, so add -fPIC to COPT which is added
to CFLAGS in its Makefile.

The typo patch has already been incorporated upstream, so it was
removed.

Signed-off-by: John Faith <jfaith@impinj.com>
[Thomas:
 - keep using "config", a "menuconfig" for just three sub-options is
   not relevant
 - move the BR2_PACKAGE_CIVETWEB_LIB option near the existing
   BR2_PACKAGE_CIVETWEB_SERVER option, since both allow to select what
   should be built/installed
 - remove BR2_PACKAGE_CIVETWEB_SHARED_LIB, the .mk file will use
   BR2_STATIC_LIBS/BR2_SHARED_LIBS/BR2_STATIC_SHARED_LIBS to know what
   to do
 - select BR2_PACKAGE_CIVETWEB_SERVER if BR2_PACKAGE_CIVETWEB_LIB is
   not enabled to ensure at least the server *or* the library is
   selected
 - introduce CIVETWEB_BUILD_TARGETS in the .mk file to properly use
   the appropriate make targets to build the server, static library
   and/or shared library
 - cleanup the use of CIVETWEB_INSTALL_TARGETS, and use it for both
   target and staging installation
 - factorize common installation options into a CIVETWEB_INSTALL_OPTS
   variable that is used for both the target and staging installation]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch | 27 -----------
 package/civetweb/Config.in                         | 12 +++++
 package/civetweb/civetweb.hash                     |  2 +-
 package/civetweb/civetweb.mk                       | 53 ++++++++++++++++++----
 4 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch b/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch
deleted file mode 100644
index aee3cfcbff..0000000000
--- a/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0821066f9adf8410891cd07684ecac50a9bc36a4 Mon Sep 17 00:00:00 2001
-From: Fabio Porcedda <fabio.porcedda@gmail>
-Date: Wed, 25 Feb 2015 18:40:24 +0100
-Subject: [PATCH] Lua: fix a typo changing %(LFS_DIR) to $(LFS_DIR)
-
-Also this fix a error on GNU Make v4.0:
-  Makefile:203: *** mixed implicit and normal rules.  Stop.
-
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail>
----
- resources/Makefile.in-lua | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/resources/Makefile.in-lua b/resources/Makefile.in-lua
-index 0902f11..f3d95fd 100644
---- a/resources/Makefile.in-lua
-+++ b/resources/Makefile.in-lua
-@@ -57,5 +57,5 @@ LFS_CFLAGS = -I$(LFS_DIR)
- 
- OBJECTS += $(LUA_OBJECTS) $(SQLITE_OBJECTS) $(LFS_OBJECTS)
- CFLAGS += $(LUA_CFLAGS) $(SQLITE_CFLAGS) $(LFS_CFLAGS) -DUSE_LUA -DUSE_LUA_SQLITE3 -DUSE_LUA_FILE_SYSTEM
--SOURCE_DIRS = $(LUA_DIR) $(SQLITE_DIR) %(LFS_DIR)
-+SOURCE_DIRS = $(LUA_DIR) $(SQLITE_DIR) $(LFS_DIR)
- 
--- 
-2.3.0
-
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index d68a1ffd53..9e43969085 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CIVETWEB
 	bool "civetweb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_CIVETWEB_SERVER if !BR2_PACKAGE_CIVETWEB_LIB
 	help
 	  Full featured embedded web server with Lua support.
 
@@ -9,6 +10,17 @@ config BR2_PACKAGE_CIVETWEB
 
 if BR2_PACKAGE_CIVETWEB
 
+config BR2_PACKAGE_CIVETWEB_SERVER
+	bool "enable the web server application"
+	help
+	  Include the web server and its config files.
+
+config BR2_PACKAGE_CIVETWEB_LIB
+	bool "enable library for embedding"
+	help
+	  Enable the civetweb library for embedding in another
+	  application.
+
 config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "enable Lua support"
 	# required by the bundled Sqlite3 and Lua code
diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index 745f4a8ce6..b3cbaad71d 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 79a852a26068eb6d2f8de5ee72e021f0d2c8bd176eb81f41909a876b736815d9  civetweb-v1.5.tar.gz
+sha256 de7d5e7a2d9551d325898c71e41d437d5f7b51e754b242af897f7be96e713a42  civetweb-v1.11.tar.gz
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index d29765b87d..4c3c443db7 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,16 +4,22 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = v1.5
-CIVETWEB_SITE = $(call github,sunsetbrew,civetweb,$(CIVETWEB_VERSION))
+CIVETWEB_VERSION = v1.11
+CIVETWEB_SITE = $(call github,civetweb,civetweb,$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
-CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1
+CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
+	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
 CIVETWEB_COPT = -DHAVE_POSIX_FALLOCATE=0
 CIVETWEB_LIBS = -lpthread -lm
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
+CIVETWEB_INSTALL_OPTS = \
+	DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
+	CONFIG_FILE2="$(CIVETWEB_SYSCONFDIR)/civetweb.conf" \
+	HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
+	SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)"
 
 ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
@@ -28,19 +34,48 @@ else
 CIVETWEB_COPT += -DNO_SSL
 endif
 
+ifeq ($(BR2_PACKAGE_CIVETWEB_SERVER),y)
+CIVETWEB_BUILD_TARGETS += build
+CIVETWEB_INSTALL_TARGETS += install
+endif
+
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
+CIVETWEB_INSTALL_STAGING = YES
+CIVETWEB_INSTALL_TARGETS += install-headers
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+CIVETWEB_BUILD_TARGETS += lib
+CIVETWEB_INSTALL_TARGETS += install-lib
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+CIVETWEB_BUILD_TARGETS += slib
+CIVETWEB_INSTALL_TARGETS += install-slib
+CIVETWEB_COPT += -fPIC
+endif
+
+endif # BR2_PACKAGE_CIVETWEB_LIB
+
 define CIVETWEB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) build \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(CIVETWEB_BUILD_TARGETS) \
 		$(CIVETWEB_CONF_OPTS) \
 		COPT="$(CIVETWEB_COPT)" LIBS="$(CIVETWEB_LIBS)"
 endef
 
+define CIVETWEB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(CIVETWEB_INSTALL_TARGETS) \
+		PREFIX="$(STAGING_DIR)/usr" \
+		$(CIVETWEB_INSTALL_OPTS) \
+		$(CIVETWEB_CONF_OPTS) \
+		COPT='$(CIVETWEB_COPT)'
+endef
+
 define CIVETWEB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
-		DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
-		CONFIG_FILE2="$(CIVETWEB_SYSCONFDIR)/civetweb.conf" \
-		HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
-		SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)" \
+	mkdir -p $(TARGET_DIR)/usr/include
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(CIVETWEB_INSTALL_TARGETS) \
 		PREFIX="$(TARGET_DIR)/usr" \
+		$(CIVETWEB_INSTALL_OPTS) \
 		$(CIVETWEB_CONF_OPTS) \
 		COPT='$(CIVETWEB_COPT)'
 endef
