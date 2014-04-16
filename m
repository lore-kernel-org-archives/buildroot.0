From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:28:56 +0200
Subject: [Buildroot] [git commit] *.mk: replace (TARGET|HOST)_PATH by BR_PATH
Message-ID: <20140416172939.5F11A9BF11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84455017408652b8ec87013709ec78e17d52802c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the 2 previous patches of the series, BR_PATH contains
all locations in which host-packages may install programs.

This patch replaces the occurrences TARGET_PATH and HOST_PATH with
BR_PATH, everywhere these variables are used in the *.mk files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/ext2.mk          |    2 +-
 package/Makefile.in      |    8 ++++----
 package/gpm/gpm.mk       |    2 +-
 package/libhid/libhid.mk |    2 +-
 package/pkg-python.mk    |    8 ++++----
 package/sdl/sdl.mk       |    2 +-
 package/xbmc/xbmc.mk     |    2 +-
 package/znc/znc.mk       |    2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0af955f..1bc49da 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -24,7 +24,7 @@ EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
+	PATH=$(BR_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 rootfs-ext2-symlink:
diff --git a/package/Makefile.in b/package/Makefile.in
index f7c9bca..0bce599 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -232,7 +232,7 @@ HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
 export PERL5LIB := $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
-TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
+TARGET_CONFIGURE_OPTS=PATH=$(BR_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD)" \
@@ -269,10 +269,10 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+TARGET_MAKE_ENV=PATH=$(BR_PATH)
 
 
-HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
+HOST_CONFIGURE_OPTS=PATH=$(BR_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD)" \
@@ -294,7 +294,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+HOST_MAKE_ENV=PATH=$(BR_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 85fdad6..d927bab 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -27,7 +27,7 @@ GPM_CONF_OPT = --without-curses
 # configure is missing but gpm seems not compatible with our autoreconf
 # mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
 define GPM_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
 endef
 GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 1b9b895..30501d5 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -11,7 +11,7 @@ LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
+LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
 LIBHID_CONF_OPT = \
 	--disable-swig \
 	--disable-werror \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index d6786a3..e903c23 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -22,7 +22,7 @@
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(TARGET_PATH)" \
+	PATH=$(BR_PATH) \
 	CC="$(TARGET_CC)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -40,14 +40,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(HOST_PATH)"
+	PATH=$(BR_PATH)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(TARGET_PATH)" \
+	PATH=$(BR_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -61,7 +61,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(HOST_PATH)"
+	PATH=$(BR_PATH)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 086f5e9..d36f3ff 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
 endef
 
 SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 69bb1ef..7453db5 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -129,7 +129,7 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
-	cd $(@D) && PATH=$(HOST_PATH) ./bootstrap
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
 
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 5e9b45b..6d367dc 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -14,7 +14,7 @@ ZNC_CONF_OPT = --disable-perl
 # The standard <pkg>_AUTORECONF = YES invocation doesn't work for this
 # package, because it does not use automake in a normal way.
 define ZNC_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
 endef
 ZNC_PRE_CONFIGURE_HOOKS += ZNC_RUN_AUTOGEN
 
