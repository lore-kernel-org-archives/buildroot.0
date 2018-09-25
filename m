From: John Faith <jfaith@impinj.com>
Date: Tue, 25 Sep 2018 23:29:42 +0000
Subject: [Buildroot] [PATCH 1/1] civetweb: bump version to 1.11
Message-ID: <20180925232917.24591-1-jfaith@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v1.11 now has library and header install targets for use by apps
that serve pages.  The config changes allow enabling the civetweb
webserver app binary and/or libs and headers.

If the civetweb lib is enabled, the static lib will always be built
and if BR2_STATIC_LIBS is not on, also build the shared object.
The C++ interface option is automatic based on available C++ support.
If both the library and server options are disabled, don't do a
target install.

The civetweb Makefile sets -fPIC in CFLAGS when linking shared
objects, but not when compiling the objects used in the library
resulting in a link failure, so add -fPIC to COPT which is added
to CFLAGS in its Makefile.

The typo patch has already been incorporated upstream, so it was
removed.

Signed-off-by: John Faith <jfaith@impinj.com>
---
 ...ua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch | 27 -----------------
 package/civetweb/Config.in                         | 25 +++++++++++++++-
 package/civetweb/civetweb.hash                     |  2 +-
 package/civetweb/civetweb.mk                       | 34 +++++++++++++++++++---
 4 files changed, 55 insertions(+), 33 deletions(-)
 delete mode 100644 package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch

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
index d68a1ffd53..a1343caeb9 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_CIVETWEB
+menuconfig BR2_PACKAGE_CIVETWEB
 	bool "civetweb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -9,6 +9,11 @@ config BR2_PACKAGE_CIVETWEB
 
 if BR2_PACKAGE_CIVETWEB
 
+config BR2_PACKAGE_CIVETWEB_SERVER
+	bool "enable the web server application"
+	help
+	  Include the web server and its config files.
+
 config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "enable Lua support"
 	# required by the bundled Sqlite3 and Lua code
@@ -19,7 +24,25 @@ config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	  sources, and not the packages from Buildroot.
 
 comment "lua support needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_CIVETWEB_WITH_LUA
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_CIVETWEB_LIB
+	bool "enable library for embedding"
+
+	select BR2_PACKAGE_CIVETWEB_SHARED_LIB if !BR2_STATIC_LIBS
+
+if BR2_PACKAGE_CIVETWEB_LIB
+config BR2_PACKAGE_CIVETWEB_SHARED_LIB
+	bool
+	depends on !BR2_STATIC_LIBS
+	help
+	  Enable the shared library for embedding civetweb in
+	  applications
+
+comment "shared library support unavailble"
 	depends on BR2_STATIC_LIBS
+endif
 
 endif
 
diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index 745f4a8ce6..b3cbaad71d 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 79a852a26068eb6d2f8de5ee72e021f0d2c8bd176eb81f41909a876b736815d9  civetweb-v1.5.tar.gz
+sha256 de7d5e7a2d9551d325898c71e41d437d5f7b51e754b242af897f7be96e713a42  civetweb-v1.11.tar.gz
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index d29765b87d..742a0ad8e3 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,12 +4,13 @@
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
@@ -34,8 +35,32 @@ define CIVETWEB_BUILD_CMDS
 		COPT="$(CIVETWEB_COPT)" LIBS="$(CIVETWEB_LIBS)"
 endef
 
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
+CIVETWEB_INSTALL_STAGING = YES
+CIVETWEB_STAGING_INSTALL_TARGETS = install-headers install-lib
+ifeq ($(BR2_PACKAGE_CIVETWEB_SHARED_LIB),y)
+CIVETWEB_STAGING_INSTALL_TARGETS += install-slib
+CIVETWEB_COPT += -fPIC
+endif
+define CIVETWEB_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(CIVETWEB_STAGING_INSTALL_TARGETS) \
+		DESTDIR=$(STAGING_DIR) \
+		PREFIX="/usr" \
+		$(CIVETWEB_CONF_OPTS) \
+		COPT='$(CIVETWEB_COPT)'
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_CIVETWEB_SERVER),y)
+CIVETWEB_INSTALL_TARGETS = install
+endif
+ifeq ($(BR2_PACKAGE_CIVETWEB_SHARED_LIB),y)
+CIVETWEB_INSTALL_TARGETS += install-slib
+endif
+
+ifneq ($(CIVETWEB_INSTALL_TARGETS),)
 define CIVETWEB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(CIVETWEB_INSTALL_TARGETS) \
 		DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
 		CONFIG_FILE2="$(CIVETWEB_SYSCONFDIR)/civetweb.conf" \
 		HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
@@ -44,5 +69,6 @@ define CIVETWEB_INSTALL_TARGET_CMDS
 		$(CIVETWEB_CONF_OPTS) \
 		COPT='$(CIVETWEB_COPT)'
 endef
+endif
 
 $(eval $(generic-package))
-- 
2.14.1
