From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 16:23:12 +0100
Subject: [Buildroot] [git commit master 1/1] zlib: cleanup,
	fix install for static only build
Message-ID: <20101124152338.714C98DC1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab2f5567c1ca67c7f761486495d3d42f2b7c8eff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use 'make install' for installation, add a patch to make it work for
static only builds, and add uninstall/clean targets while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/zlib/zlib.mk |   44 +++++++++++++++++++++-----------------------
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/CHANGES b/CHANGES
index d8046bc..8a560fe 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: bash, bind, busybox, libglib2,
 	libcurl, libmad, midori, module-init-tools, mtd-utils,
-	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit
+	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 751cfc1..016752e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -10,7 +10,7 @@ ZLIB_INSTALL_STAGING=YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ZLIB_PIC :=
-ZLIB_SHARED :=
+ZLIB_SHARED := --static
 else
 ZLIB_PIC := -fPIC
 ZLIB_SHARED := --shared
@@ -42,42 +42,40 @@ define HOST_ZLIB_CONFIGURE_CMDS
 endef
 
 define ZLIB_BUILD_CMDS
-	$(MAKE1) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D)
 endef
 
 define HOST_ZLIB_BUILD_CMDS
-	$(MAKE1) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D)
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
-	$(INSTALL) -D $(@D)/libz.a $(STAGING_DIR)/usr/lib/libz.a
-	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
-	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
-	cp -dpf $(@D)/libz.so* $(STAGING_DIR)/usr/lib/
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define ZLIB_INSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 define HOST_ZLIB_INSTALL_CMDS
-	$(INSTALL) -D $(@D)/libz.a $(HOST_DIR)/usr/lib/libz.a
-	$(INSTALL) -D $(@D)/zlib.h $(HOST_DIR)/usr/include/zlib.h
-	$(INSTALL) $(@D)/zconf.h $(HOST_DIR)/usr/include/
-	cp -dpf $(@D)/libz.so* $(HOST_DIR)/usr/lib/
+	$(MAKE1) -C $(@D) install
 endef
 
-ifeq ($(BR2_HAVE_DEVFILES),y)
-define ZLIB_INSTALL_TARGET_HEADERS
-	$(INSTALL) -D $(@D)/zlib.h $(TARGET_DIR)/usr/include/zlib.h
-	$(INSTALL) $(@D)/zconf.h $(TARGET_DIR)/usr/include/
+define ZLIB_CLEAN_CMDS
+	-$(MAKE1) -C $(@D) clean
 endef
-endif
 
-define ZLIB_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(@D)/libz.so* $(TARGET_DIR)/usr/lib
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libz.so*
-	$(INSTALL) -D $(@D)/libz.a $(TARGET_DIR)/usr/lib/libz.a
-	$(ZLIB_INSTALL_TARGET_HEADERS)
+define ZLIB_UNINSTALL_STAGING_CMDS
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
+endef
+
+define ZLIB_UNINSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
+endef
+
+define HOST_ZLIB_UNINSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) uninstall
 endef
 
 $(eval $(call GENTARGETS,package,zlib))
 $(eval $(call GENTARGETS,package,zlib,host))
-
-- 
1.7.2.2
