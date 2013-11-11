From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 21:59:43 +0100
Subject: [Buildroot] [PATCH 3/6] *.mk: replace (TARGET|HOST)_PATH by BR2_PATH
In-Reply-To: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203586-17790-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 fs/ext2/ext2.mk                            | 2 +-
 package/Makefile.in                        | 8 ++++----
 package/bustle/bustle.mk                   | 2 +-
 package/libhid/libhid.mk                   | 2 +-
 package/python-protobuf/python-protobuf.mk | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

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
index b5829cb..7ce84ce 100644
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
@@ -268,7 +268,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+HOST_MAKE_ENV=PATH=$(BR2_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 68b7b24..6c6c67f 100644
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
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index dcf67c2..1ed366e 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -16,7 +16,7 @@ PYTHON_PROTOBUF_DEPENDENCIES = python host-python-setuptools \
 define PYTHON_PROTOBUF_BUILD_CMDS
 	(cd $(@D)/python; \
 		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
-		PATH=$(HOST_PATH) \
+		PATH=$(BR2_PATH) \
 	$(HOST_DIR)/usr/bin/python setup.py build -x)
 endef
 
-- 
1.8.4.2
