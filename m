From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 16:59:02 +0200
Subject: [Buildroot] [git commit] package/lz4: make program installation
 optional
Message-ID: <20200727145412.CBF74869F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2acb27e298c54935f890111fc5897a11350b913b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Often lz4 is used as a library, and not as a standalone program.
Excluding lz4 binary will save some space in this case. Indeed, the
lz4 program is always statically linked against its library, which
makes it duplicate the whole library size:

$ ls -l usr/lib/liblz4.so.1.9.2 usr/bin/lz4
-rwxr-xr-x 1 thomas thomas 226724 27 juil. 16:33 usr/bin/lz4
-rwxr-xr-x 1 thomas thomas 156996 27 juil. 16:33 usr/lib/liblz4.so.1.9.2

Since lz4 is now primarily a library, it's moved to the "Libraries"
section.

Of course, installation of programs defaults to "yes" to preserve
backward compatibility.

Signed-off-by: Ed Spiridonov <edo.rus@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in     |  2 +-
 package/lz4/Config.in | 10 ++++++++++
 package/lz4/lz4.mk    | 20 ++++++++++++++------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5c30d27b7a..d7e79f4795 100644
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
@@ -1296,6 +1295,7 @@ menu "Compression and decompression"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
+	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index 9f12299ceb..dbe3f2e243 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -8,3 +8,13 @@ config BR2_PACKAGE_LZ4
 	  speed limits on multi-core systems.
 
 	  http://www.lz4.org/
+
+if BR2_PACKAGE_LZ4
+
+config BR2_PACKAGE_LZ4_PROGS
+	bool "install programs"
+	default y
+	help
+	  lz4, lz4c, unlz4 and lz4cat binaries
+
+endif
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 1d32666ccc..1cdd39106c 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -32,21 +32,29 @@ define HOST_LZ4_INSTALL_CMDS
 		install -C $(@D)
 endef
 
+ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
+LZ4_BUILD_TARGETS = lib lz4
+LZ4_INSTALL_OPTS = install -C $(@D)
+else
+LZ4_BUILD_TARGETS = lib
+LZ4_INSTALL_OPTS = install -C $(@D)/lib
+endif
+
 define LZ4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
-		-C $(@D) lib
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
-		-C $(@D) lz4
+	$(foreach target,$(LZ4_BUILD_TARGETS),\
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
+			-C $(@D) $(target)
+	)
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
-		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
+		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
+		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
 endef
 
 $(eval $(generic-package))
