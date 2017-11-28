From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 29 Nov 2017 01:29:35 +0200
Subject: [Buildroot] [PATCH 2/3 v3] rename zlib to libzlib
In-Reply-To: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
References: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
Message-ID: <20171128232936.23067-2-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

- Rename zlib to libzlib to prevent name clash with coming
  virtual zlib package
- Convert libzlib to use virtual package infrastructure

---
 package/{zlib/zlib.hash => libzlib/libzlib.hash} |  0
 package/{zlib/zlib.mk => libzlib/libzlib.mk}     | 43 ++++++++++++------------
 package/zlib/Config.in                           |  7 ----
 3 files changed, 22 insertions(+), 28 deletions(-)
 rename package/{zlib/zlib.hash => libzlib/libzlib.hash} (100%)
 rename package/{zlib/zlib.mk => libzlib/libzlib.mk} (66%)
 delete mode 100644 package/zlib/Config.in

diff --git a/package/zlib/zlib.hash b/package/libzlib/libzlib.hash
similarity index 100%
rename from package/zlib/zlib.hash
rename to package/libzlib/libzlib.hash
diff --git a/package/zlib/zlib.mk b/package/libzlib/libzlib.mk
similarity index 66%
rename from package/zlib/zlib.mk
rename to package/libzlib/libzlib.mk
index 9b5f52e807..153ef0fe90 100644
--- a/package/zlib/zlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,36 +4,37 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.11
-ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
-ZLIB_SITE = http://www.zlib.net
-ZLIB_LICENSE = Zlib
-ZLIB_LICENSE_FILES = README
-ZLIB_INSTALL_STAGING = YES
+LIBZLIB_VERSION = 1.2.11
+LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
+LIBZLIB_SITE = http://www.zlib.net
+LIBZLIB_LICENSE = Zlib
+LIBZLIB_LICENSE_FILES = README
+LIBZLIB_INSTALL_STAGING = YES
+LIBZLIB_PROVIDES = zlib
 
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
 ifeq ($(BR2_STATIC_LIBS),y)
-ZLIB_PIC =
-ZLIB_SHARED = --static
+LIBZLIB_PIC =
+LIBZLIB_SHARED = --static
 else
-ZLIB_PIC = -fPIC
-ZLIB_SHARED = --shared
+LIBZLIB_PIC = -fPIC
+LIBZLIB_SHARED = --shared
 endif
 
-define ZLIB_CONFIGURE_CMDS
+define LIBZLIB_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
+		CFLAGS="$(TARGET_CFLAGS) $(LIBZLIB_PIC)" \
 		./configure \
-		$(ZLIB_SHARED) \
+		$(LIBZLIB_SHARED) \
 		--prefix=/usr \
 	)
 endef
 
-define HOST_ZLIB_CONFIGURE_CMDS
+define HOST_LIBZLIB_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_ARGS) \
 		$(HOST_CONFIGURE_OPTS) \
@@ -43,19 +44,19 @@ define HOST_ZLIB_CONFIGURE_CMDS
 	)
 endef
 
-define ZLIB_BUILD_CMDS
+define LIBZLIB_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
-define HOST_ZLIB_BUILD_CMDS
+define HOST_LIBZLIB_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
-define ZLIB_INSTALL_STAGING_CMDS
+define LIBZLIB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
 endef
 
-define ZLIB_INSTALL_TARGET_CMDS
+define LIBZLIB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
 endef
 
@@ -63,13 +64,13 @@ endef
 # time to build other packages, and it is anyway removed later before
 # assembling the filesystem images anyway.
 ifeq ($(BR2_SHARED_LIBS),y)
-define ZLIB_RM_STATIC_STAGING
+define LIBZLIB_RM_STATIC_STAGING
 	rm -f $(STAGING_DIR)/usr/lib/libz.a
 endef
-ZLIB_POST_INSTALL_STAGING_HOOKS += ZLIB_RM_STATIC_STAGING
+LIBZLIB_POST_INSTALL_STAGING_HOOKS += LIBZLIB_RM_STATIC_STAGING
 endif
 
-define HOST_ZLIB_INSTALL_CMDS
+define HOST_LIBZLIB_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
deleted file mode 100644
index 6201aba142..0000000000
--- a/package/zlib/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_ZLIB
-	bool "zlib"
-	help
-	  Standard (de)compression library. Used by things like
-	  gzip and libpng.
-
-	  http://www.zlib.net
-- 
2.13.6
