From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:41:40 +0100
Subject: [Buildroot] [PATCH v2 3/6] *.mk: replace (TARGET|HOST)_PATH by
	BR2_PATH
In-Reply-To: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
References: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390074102-15686-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- make substitution of new occurenrces (pkg-python.mk and sdl.mk)
---
 fs/ext2/ext2.mk          | 2 +-
 package/Makefile.in      | 8 ++++----
 package/bustle/bustle.mk | 2 +-
 package/libhid/libhid.mk | 2 +-
 package/pkg-python.mk    | 8 ++++----
 package/sdl/sdl.mk       | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0af955f..7b96dda 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -24,7 +24,7 @@ EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
+	PATH=$(BR2_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 rootfs-ext2-symlink:
diff --git a/package/Makefile.in b/package/Makefile.in
index a940f54..bf6efe1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -206,7 +206,7 @@ HOST_PATH = $(BR2_PATH)
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
-TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
+TARGET_CONFIGURE_OPTS=PATH=$(BR2_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD)" \
@@ -244,10 +244,10 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+TARGET_MAKE_ENV=PATH=$(BR2_PATH) \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
-HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
+HOST_CONFIGURE_OPTS=PATH=$(BR2_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD)" \
@@ -270,7 +270,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+HOST_MAKE_ENV=PATH=$(BR2_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 2330c08..c488dfa 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -11,7 +11,7 @@ BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
 define BUSTLE_BUILD_CMDS
-	PATH=$(TARGET_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	PATH=$(BR2_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		PCAP_FLAGS='-lpcap' -C $(@D) dist/build/bustle-pcap
 endef
 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 97aab5d..ba0ad6b 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -11,7 +11,7 @@ LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
+LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR2_PATH)
 LIBHID_CONF_OPT = \
 	--disable-swig \
 	--disable-werror \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 79e6bcf..357ed8d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -22,7 +22,7 @@
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(TARGET_PATH)" \
+	PATH="$(BR2_PATH)" \
 	CC="$(TARGET_CC)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -40,14 +40,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(HOST_PATH)"
+	PATH="$(BR2_PATH)"
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(TARGET_PATH)" \
+	PATH="$(BR2_PATH)" \
 	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
 	CROSS_COMPILING=yes \
@@ -63,7 +63,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(HOST_PATH)" \
+	PATH="$(BR2_PATH)" \
 	PYTHONXCPREFIX="$(HOST_DIR)/usr/"
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index ba5fbca..4789ea2 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SD_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(BR2_PATH) ./autogen.sh
 endef
 
 SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
-- 
1.8.5.3
