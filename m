From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:58 +0100
Subject: [Buildroot] [PATCH 7/8 RFC] packages: use TARGET_PATH
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <bfe629a2f300528996a23613fb4661b41e972bac.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that libhid should no longer need that trick, but this woill be
fixed independently in a follow-up patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/Makefile.in          | 4 ++--
 package/faifa/faifa.mk       | 2 +-
 package/freetype/freetype.mk | 2 +-
 package/gpm/gpm.mk           | 2 +-
 package/kodi/kodi.mk         | 2 +-
 package/libhid/libhid.mk     | 2 +-
 package/pkg-cmake.mk         | 2 +-
 package/pkg-python.mk        | 4 ++--
 package/sdl/sdl.mk           | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7517a62..e211001 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -231,7 +231,7 @@ export PERL=$(shell which perl)
 export PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
 TARGET_CONFIGURE_OPTS = \
-	PATH=$(BR_PATH) \
+	PATH=$(TARGET_PATH) \
 	AR="$(TARGET_AR)" \
 	AS="$(TARGET_AS)" \
 	LD="$(TARGET_LD)" \
@@ -268,7 +268,7 @@ TARGET_CONFIGURE_OPTS = \
 	STAGING_DIR="$(STAGING_DIR)" \
 	INTLTOOL_PERL=$(PERL)
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
+TARGET_MAKE_ENV = PATH=$(TARGET_PATH)
 
 
 HOST_CONFIGURE_OPTS = \
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index a56a8c0..1c9ccb5 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -18,7 +18,7 @@ FAIFA_MAKE_OPTS += GIT_REV=$(FAIFA_VERSION)
 # installation commands.
 
 define FAIFA_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(TARGET_PATH) ./autogen.sh
 endef
 FAIFA_PRE_CONFIGURE_HOOKS += FAIFA_RUN_AUTOGEN
 
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fa11b0c..a611b83 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -23,7 +23,7 @@ HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
 # even AUTORECONF with _OPTS doesn't do it properly.
 # POST_PATCH is because we still need to patch libtool after the regen.
 define FREETYPE_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(TARGET_PATH) ./autogen.sh
 endef
 FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
 HOST_FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 6d3b5d2..e753ce7 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -36,7 +36,7 @@ GPM_CONF_OPTS = --without-curses
 # configure is missing but gpm seems not compatible with our autoreconf
 # mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
 define GPM_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(TARGET_PATH) ./autogen.sh
 endef
 GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index bf3aa7a..95442ad 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -224,7 +224,7 @@ endif
 define KODI_BOOTSTRAP
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
-	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
+	cd $(@D) && PATH=$(TARGET_PATH) ./bootstrap
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 8b3cb2a..92a3049 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -13,7 +13,7 @@ LIBHID_LICENSE = GPLv2
 LIBHID_LICENSE_FILES = COPYING
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
+LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
 LIBHID_CONF_OPTS = \
 	--disable-swig \
 	--disable-werror \
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 101a551..ddef2d8 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -84,7 +84,7 @@ define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
-	PATH=$$(BR_PATH) \
+	PATH=$$(TARGET_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index d94a485..e0d9650 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -22,7 +22,7 @@
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
+	PATH=$(TARGET_PATH) \
 	CC="$(TARGET_CC)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -50,7 +50,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH) \
+	PATH=$(TARGET_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index cc1ad06..5896fb1 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+	cd $(@D) && PATH=$(TARGET_PATH) ./autogen.sh
 endef
 
 SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
-- 
1.9.1
