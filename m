From: Ed Spiridonov <edo.rus@gmail.com>
Date: Sat, 23 May 2020 20:34:25 +0300
Subject: [Buildroot] [PATCH] package/lz4: add option to install library only
 (without lz4 binary)
Message-ID: <20200523173425.15367-1-edo.rus@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Often lz4 is used as a library, and not as a standalone program.
Excluding lz4 binary will save some space in this case.

Signed-off-by: Ed Spiridonov <edo.rus@gmail.com>
---
 package/Config.in     |  2 +-
 package/lz4/Config.in |  9 +++++++++
 package/lz4/lz4.mk    | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 2871cab..51a1a2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -70,7 +70,6 @@ menu "Compressors and decompressors"
 	source "package/bzip2/Config.in"
 	source "package/gzip/Config.in"
 	source "package/lrzip/Config.in"
-	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
@@ -1289,6 +1288,7 @@ menu "Compression and decompression"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
+	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index 9f12299..910071f 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -8,3 +8,12 @@ config BR2_PACKAGE_LZ4
 	  speed limits on multi-core systems.
 
 	  http://www.lz4.org/
+
+if BR2_PACKAGE_LZ4
+config BR2_PACKAGE_LZ4_PROGS
+	bool "lz4 programs"
+	default y
+	help
+	  lz4, lz4c, unlz4 and lz4cat binaries
+
+endif
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 1d32666..443cde2 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -32,22 +32,36 @@ define HOST_LZ4_INSTALL_CMDS
 		install -C $(@D)
 endef
 
+ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
 define LZ4_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
 		-C $(@D) lib
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
 		-C $(@D) lz4
 endef
+else
+define LZ4_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
+		-C $(@D) lib
+endef
+endif
 
 define LZ4_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
 		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
 endef
 
+ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
 define LZ4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
 		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
 endef
+else
+define LZ4_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)/lib
+endef
+endif
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.26.2
