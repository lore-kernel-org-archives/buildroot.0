From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:45:53 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libsquish: really
 install shared library
Message-ID: <20190124154611.89B7C8E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02401f9ea16462f733de3d166ce077fc02d5fad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

While testing the new supertuxkart 0.10-beta1 version, the build
failed due to missing libsquash shared library.

Indeed, by default (see config file) the shared library is not build
and all symlinks created by LIBSQUISH_INSTALL_{STAGING,TARGET}_CMDS
are curently broken.

To fix that, add USE_SHARED=1 to LIBSQUISH_MAKE_ENV.

Also add a patch to allow reinstall the package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b621273755ef0a9d673100168d1c93750ed7bd6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-f-option-for-ln-to-remove-existing-dest.patch | 32 ++++++++++++++++++++++
 package/libsquish/libsquish.mk                     | 11 ++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch b/package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch
new file mode 100644
index 0000000000..ab9e64f0ff
--- /dev/null
+++ b/package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch
@@ -0,0 +1,32 @@
+From 1e541293ac19c49f886220b64de6006c5c700144 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 12 Jan 2019 12:50:54 +0100
+Subject: [PATCH] Makefile: add -f option for ln to remove existing destination
+ files
+
+While reinstalling the library, all symlinks are present.
+Ask ln to remove them with -f.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fd7d6c8..2683819 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,8 +25,8 @@ install: $(LIB) $(LIBA) libsquish.pc
+ 	$(INSTALL_FILE) $(LIBA) $(INSTALL_DIR)/$(LIB_PATH)
+ ifneq ($(USE_SHARED),0)
+ 	$(INSTALL_FILE) $(LIB) $(INSTALL_DIR)/$(LIB_PATH)
+-	ln -s $(LIB) $(INSTALL_DIR)/$(LIB_PATH)/$(SOLIB)
+-	ln -s $(LIB) $(INSTALL_DIR)/$(LIB_PATH)/libsquish.so
++	ln -sf $(LIB) $(INSTALL_DIR)/$(LIB_PATH)/$(SOLIB)
++	ln -sf $(LIB) $(INSTALL_DIR)/$(LIB_PATH)/libsquish.so
+ 	$(INSTALL_DIRECTORY) $(INSTALL_DIR)/$(LIB_PATH)/pkgconfig
+ 	$(INSTALL_FILE) libsquish.pc $(INSTALL_DIR)/$(LIB_PATH)/pkgconfig
+ endif
+-- 
+2.14.5
+
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index 67892dd9eb..b1a80e5b60 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -12,26 +12,25 @@ LIBSQUISH_STRIP_COMPONENTS = 0
 LIBSQUISH_LICENSE = MIT
 LIBSQUISH_LICENSE_FILES = LICENSE.txt
 
+LIBSQUISH_MAKE_ENV = USE_SHARED=1
+
 define LIBSQUISH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(LIBSQUISH_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LIBSQUISH_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/include
 	mkdir -p $(STAGING_DIR)/usr/lib
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+	$(TARGET_CONFIGURE_OPTS) $(LIBSQUISH_MAKE_ENV) $(MAKE) -C $(@D) \
 		install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
 	$(INSTALL) -D -m 644 $(@D)/libsquish.pc $(STAGING_DIR)/usr/lib/pkgconfig/libsquish.pc
-	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so
-	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so.0
 endef
 
 define LIBSQUISH_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/include
 	mkdir -p $(TARGET_DIR)/usr/lib
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+	$(TARGET_CONFIGURE_OPTS) $(LIBSQUISH_MAKE_ENV) $(MAKE) -C $(@D) \
 		install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
-	ln -sf libsquish.so.0.0 $(TARGET_DIR)/usr/lib/libsquish.so.0
 endef
 
 $(eval $(generic-package))
