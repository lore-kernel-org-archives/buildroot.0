From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 20:59:11 +0100
Subject: [Buildroot] [PATCH v5 4/4] *.mk: remove all occurences of
	TARGET_PATH and HOST_PATH
In-Reply-To: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1393703951-7059-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the 2 previous patches, the PATH now contains all locations
in which host-packages may install programs.

This patch removes the occurrences TARGET_PATH and HOST_PATH from the
*.mk files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4 -> v5:
- rebase
- remove all occurence of {TARGET,HOST}_PATH
- fixup a couple of PATH definitions

changes v3 -> v4:
- rebase
- fix typo in commit log (ThomasP)
- rename BR2_PATH -> BR_PATH
- make substitution of new occurenrces (gpm.mk)

changes v2 -> v3:
- rebase
- no one-line commit log (ThomasP)

changes v1 -> v2:
- make substitution of new occurenrces (pkg-python.mk and sdl.mk)
---
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 14 ++++----------
 package/gpm/gpm.mk       |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-python.mk    |  8 ++------
 package/sdl/sdl.mk       |  2 +-
 6 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0af955f..ab43483 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -24,7 +24,7 @@ EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
+	$(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 rootfs-ext2-symlink:
diff --git a/package/Makefile.in b/package/Makefile.in
index 0ec237d..3e755c5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -144,9 +144,6 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-# PATH already contains Buildroot host bindirs
-TARGET_PATH = $(PATH)
-
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
@@ -200,8 +197,6 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-# PATH already contains Buildroot host bindirs
-HOST_PATH = $(PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
@@ -210,7 +205,7 @@ HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
 export PERL5LIB := $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
-TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
+TARGET_CONFIGURE_OPTS= \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD)" \
@@ -247,10 +242,9 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
-
+TARGET_MAKE_ENV=
 
-HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
+HOST_CONFIGURE_OPTS= \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD)" \
@@ -272,7 +266,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+HOST_MAKE_ENV= \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 85fdad6..a47fde0 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -27,7 +27,7 @@ GPM_CONF_OPT = --without-curses
 # configure is missing but gpm seems not compatible with our autoreconf
 # mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
 define GPM_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && ./autogen.sh
 endef
 GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 1b9b895..e6aab90 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -11,7 +11,7 @@ LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
+LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(PATH)
 LIBHID_CONF_OPT = \
 	--disable-swig \
 	--disable-werror \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 512ef66..7705a86 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -22,7 +22,6 @@
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(TARGET_PATH)" \
 	CC="$(TARGET_CC)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -39,15 +38,13 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 	--prefix=$(TARGET_DIR)/usr
 
 # Host distutils-based packages
-HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH="$(HOST_PATH)"
+HOST_PKG_PYTHON_DISTUTILS_ENV =
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(TARGET_PATH)" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -60,8 +57,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 	--root=/
 
 # Host setuptools-based packages
-HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(HOST_PATH)"
+HOST_PKG_PYTHON_SETUPTOOLS_ENV =
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index d5fb331..053a3c6 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+	cd $(@D) && ./autogen.sh
 endef
 
 SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
-- 
1.9.0
