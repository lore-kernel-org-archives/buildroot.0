From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 29 Nov 2017 23:17:13 +0200
Subject: [Buildroot] [PATCH v5 1/2] zlib-ng: rename zlib to libzlib
Message-ID: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
Changes v4 -> v5:

- Added host-zlib support to virtual zlib package

 package/{zlib/zlib.hash => libzlib/libzlib.hash} |  0
 package/libzlib/libzlib.mk                       | 78 ++++++++++++++++++++++++
 package/zlib/Config.in                           | 25 ++++++++
 package/zlib/zlib.mk                             | 73 +---------------------
 4 files changed, 105 insertions(+), 71 deletions(-)
 rename package/{zlib/zlib.hash => libzlib/libzlib.hash} (100%)
 create mode 100644 package/libzlib/libzlib.mk

diff --git a/package/zlib/zlib.hash b/package/libzlib/libzlib.hash
similarity index 100%
rename from package/zlib/zlib.hash
rename to package/libzlib/libzlib.hash
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
new file mode 100644
index 0000000000..eea0c12f22
--- /dev/null
+++ b/package/libzlib/libzlib.mk
@@ -0,0 +1,78 @@
+################################################################################
+#
+# libzlib
+#
+################################################################################
+
+LIBZLIB_VERSION = 1.2.11
+LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
+LIBZLIB_SITE = http://www.zlib.net
+LIBZLIB_LICENSE = Zlib
+LIBZLIB_LICENSE_FILES = README
+LIBZLIB_INSTALL_STAGING = YES
+LIBZLIB_PROVIDES = zlib
+
+# It is not possible to build only a shared version of zlib, so we build both
+# shared and static, unless we only want the static libs, and we eventually
+# selectively remove what we do not want
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBZLIB_PIC =
+LIBZLIB_SHARED = --static
+else
+LIBZLIB_PIC = -fPIC
+LIBZLIB_SHARED = --shared
+endif
+
+define LIBZLIB_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) $(LIBZLIB_PIC)" \
+		./configure \
+		$(LIBZLIB_SHARED) \
+		--prefix=/usr \
+	)
+endef
+
+define HOST_LIBZLIB_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_ARGS) \
+		$(HOST_CONFIGURE_OPTS) \
+		./configure \
+		--prefix="$(HOST_DIR)" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+endef
+
+define LIBZLIB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define HOST_LIBZLIB_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define LIBZLIB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
+endef
+
+define LIBZLIB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
+endef
+
+# We don't care removing the .a from target, since it not used at link
+# time to build other packages, and it is anyway removed later before
+# assembling the filesystem images anyway.
+ifeq ($(BR2_SHARED_LIBS),y)
+define LIBZLIB_RM_STATIC_STAGING
+	rm -f $(STAGING_DIR)/usr/lib/libz.a
+endef
+LIBZLIB_POST_INSTALL_STAGING_HOOKS += LIBZLIB_RM_STATIC_STAGING
+endif
+
+define HOST_LIBZLIB_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 6201aba142..043c3cefa4 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,7 +1,32 @@
 config BR2_PACKAGE_ZLIB
+	bool "zlib support"
+	help
+	  Select the desired Zlib library provider.
+
+if BR2_PACKAGE_ZLIB
+
+choice
+	prompt "zlib variant"
+	default BR2_PACKAGE_LIBZLIB
+	help
+	  Select the desired Zlib library provider.
+
+config BR2_PACKAGE_LIBZLIB
 	bool "zlib"
+	select BR2_PACKAGE_HAS_ZLIB
 	help
 	  Standard (de)compression library. Used by things like
 	  gzip and libpng.
 
 	  http://www.zlib.net
+
+endchoice
+
+config BR2_PACKAGE_HAS_ZLIB
+	bool
+
+config BR2_PACKAGE_PROVIDES_ZLIB
+	string
+	default "libzlib" if BR2_PACKAGE_LIBZLIB
+
+endif
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 9b5f52e807..78f48ff059 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,74 +4,5 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.11
-ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
-ZLIB_SITE = http://www.zlib.net
-ZLIB_LICENSE = Zlib
-ZLIB_LICENSE_FILES = README
-ZLIB_INSTALL_STAGING = YES
-
-# It is not possible to build only a shared version of zlib, so we build both
-# shared and static, unless we only want the static libs, and we eventually
-# selectively remove what we do not want
-ifeq ($(BR2_STATIC_LIBS),y)
-ZLIB_PIC =
-ZLIB_SHARED = --static
-else
-ZLIB_PIC = -fPIC
-ZLIB_SHARED = --shared
-endif
-
-define ZLIB_CONFIGURE_CMDS
-	(cd $(@D); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
-		./configure \
-		$(ZLIB_SHARED) \
-		--prefix=/usr \
-	)
-endef
-
-define HOST_ZLIB_CONFIGURE_CMDS
-	(cd $(@D); rm -rf config.cache; \
-		$(HOST_CONFIGURE_ARGS) \
-		$(HOST_CONFIGURE_OPTS) \
-		./configure \
-		--prefix="$(HOST_DIR)" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-endef
-
-define ZLIB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
-endef
-
-define HOST_ZLIB_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
-endef
-
-define ZLIB_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
-endef
-
-define ZLIB_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
-endef
-
-# We don't care removing the .a from target, since it not used at link
-# time to build other packages, and it is anyway removed later before
-# assembling the filesystem images anyway.
-ifeq ($(BR2_SHARED_LIBS),y)
-define ZLIB_RM_STATIC_STAGING
-	rm -f $(STAGING_DIR)/usr/lib/libz.a
-endef
-ZLIB_POST_INSTALL_STAGING_HOOKS += ZLIB_RM_STATIC_STAGING
-endif
-
-define HOST_ZLIB_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(virtual-package))
+$(eval $(host-virtual-package))
-- 
2.13.6
