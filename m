From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:42:04 +0100
Subject: [Buildroot] [git commit] zlib: switch to a virtual package
Message-ID: <20180103215303.CE89F8356D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1a657880992a9eafb639a666a8b3ec0928f14c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The existing zlib package is renamed to libzlib, and zlib is turned
into a virtual package. This is done in preparation to the
introduction of zlib-ng as an alternative implementation.

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
[Thomas: define BR2_PACKAGE_PROVIDES_HOST_ZLIB as suggested by Yann
E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/{zlib/zlib.hash => libzlib/libzlib.hash} |  0
 package/{zlib/zlib.mk => libzlib/libzlib.mk}     | 45 ++++++++-------
 package/zlib/Config.in                           | 30 ++++++++++
 package/zlib/zlib.mk                             | 73 +-----------------------
 4 files changed, 55 insertions(+), 93 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/libzlib/libzlib.hash
similarity index 100%
rename from package/zlib/zlib.hash
rename to package/libzlib/libzlib.hash
diff --git a/package/zlib/zlib.mk b/package/libzlib/libzlib.mk
similarity index 66%
copy from package/zlib/zlib.mk
copy to package/libzlib/libzlib.mk
index 9b5f52e..eea0c12 100644
--- a/package/zlib/zlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -1,39 +1,40 @@
 ################################################################################
 #
-# zlib
+# libzlib
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
index 6201aba..bdc1da6 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,7 +1,37 @@
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
+
+# ensure libzlib is used for the host variant
+config BR2_PACKAGE_PROVIDES_HOST_ZLIB
+	string
+	default "host-libzlib"
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 9b5f52e..78f48ff 100644
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
