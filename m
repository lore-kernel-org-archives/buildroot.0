From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] Merge TARGET_CONFIGURE_ENV into
	TARGET_CONFIGURE_OPTS
Message-ID: <20100708115826.0CC848269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e721a7c07e0a9ab4a6a8fe7aff9f378ac4144df6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_CONFIGURE_ENV defines CFLAGS, LDFLAGS, CXXFLAGS and FCFLAGS,
separatly from all other variables that are part of
TARGET_CONFIGURE_OPTS. This is useless and not consistent with the
HOST_CONFIGURE_ variables, therefore we merge TARGET_CONFIGURE_ENV
into TARGET_CONFIGURE_OPTS and fix the few users of
TARGET_CONFIGURE_ENV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in            |    1 -
 package/Makefile.in                      |   10 ++++------
 package/lockfile-progs/lockfile-progs.mk |    3 +--
 package/mtd/mtd.mk                       |    3 +--
 package/multimedia/ffmpeg/ffmpeg.mk      |    1 -
 5 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 337aee4..1ccf44c 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -90,7 +90,6 @@ define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
-	$$(TARGET_CONFIGURE_ENV) \
 	$$($$(PKG)_CONF_ENV) \
 	./configure \
 		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
diff --git a/package/Makefile.in b/package/Makefile.in
index 1c965c9..189806d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -194,18 +194,16 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_CONFIGURE_ENV=\
-	CFLAGS="$(TARGET_CFLAGS)" \
-	CXXFLAGS="$(TARGET_CXXFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
-	FCFLAGS="$(TARGET_FCFLAGS)" \
-
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 4098330..3925ca3 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -21,8 +21,7 @@ $(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ENV) \
-		-C $(LOCKFILE_PROGS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LOCKFILE_PROGS_DIR)
 	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0c9ed42..c573849 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -65,8 +65,7 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
 MTD_MAKE_COMMON_FLAGS = \
-	$(TARGET_CONFIGURE_ENV) \
-	CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
+	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
 	WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1
 
 ifneq ($(MTD_TARGETS_y),)
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 81984f1..aac39c1 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -121,7 +121,6 @@ define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
-	$(TARGET_CONFIGURE_ENV) \
 	$(FFMPEG_CONF_ENV) \
 	./configure \
 		--enable-cross-compile	\
-- 
1.7.1
