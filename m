From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:57 +0200
Subject: [Buildroot] [PATCH 23/53] Globally replace $(HOST_DIR)/usr with
	$(HOST_DIR)
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-24-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR), the callers should
also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr\>\([^/]\|$\)' | xargs sed -i 's%\$(HOST_DIR)/usr\>\([^/]\|$\)%$(HOST_DIR)\1%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erlang/erlang.mk           |  2 +-
 package/gcc/gcc.mk                 | 10 +++++-----
 package/kodi/kodi.mk               |  4 ++--
 package/libsepol/libsepol.mk       |  2 +-
 package/lua/lua.mk                 |  2 +-
 package/luarocks/luarocks.mk       |  2 +-
 package/omxplayer/omxplayer.mk     |  2 +-
 package/pseudo/pseudo.mk           |  2 +-
 package/qt/qt.mk                   |  4 ++--
 package/qt5/qt5base/qt5base.mk     |  2 +-
 package/setools/setools.mk         |  4 ++--
 package/upx/upx.mk                 |  2 +-
 package/vboot-utils/vboot-utils.mk |  2 +-
 13 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 364085c4dd..325a052e86 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -39,7 +39,7 @@ HOST_ERLANG_CONF_ENV += ERL_TOP=$(@D)
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
 HOST_ERLANG_DEPENDENCIES = host-openssl
-HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
+HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index bdeb956972..ff69209f84 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -92,9 +92,9 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
-	--with-gmp=$(HOST_DIR)/usr \
-	--with-mpc=$(HOST_DIR)/usr \
-	--with-mpfr=$(HOST_DIR)/usr \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
 
@@ -169,12 +169,12 @@ endif
 
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-isl
-HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)
 # gcc 5 doesn't need cloog any more, see
 # https://gcc.gnu.org/gcc-5/changes.html
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 HOST_GCC_COMMON_DEPENDENCIES += host-cloog
-HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)
 endif
 else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ebce84dade..ed9ec78b11 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -66,8 +66,8 @@ KODI_CONF_ENV = \
 	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	PYTHON_NOVERSIONCHECK="no-check" \
 	use_texturepacker_native=yes \
-	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
-	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)" \
+	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)"
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 710ab25112..21ca419c74 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -35,7 +35,7 @@ endef
 
 HOST_LIBSEPOL_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
-	DESTDIR=$(HOST_DIR)/usr \
+	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
 define HOST_LIBSEPOL_BUILD_CMDS
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 871d4f29ff..c5d6c088fd 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -94,7 +94,7 @@ define LUA_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index e965ab2288..2338a8b776 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -21,7 +21,7 @@ endif
 HOST_LUAROCKS_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
-	--with-lua=$(HOST_DIR)/usr
+	--with-lua=$(HOST_DIR)
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 HOST_LUAROCKS_CONF_OPTS += --lua-suffix=jit
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index 7425014d0c..9bb58778c2 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -27,7 +27,7 @@ OMXPLAYER_MAKE_ENV = \
 	BUILDROOT=$(TOP_DIR) \
 	SDKSTAGE=$(STAGING_DIR) \
 	TARGETFS=$(TARGET_DIR) \
-	TOOLCHAIN=$(HOST_DIR)/usr \
+	TOOLCHAIN=$(HOST_DIR) \
 	HOST=$(GNU_TARGET_NAME) \
 	SYSROOT=$(STAGING_DIR) \
 	JOBS=$(PARALLEL_JOBS) \
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index d78fc7aa8a..446427109f 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -24,6 +24,6 @@ HOST_PSEUDO_CONF_OPTS = \
 	--with-rpath=$(HOST_DIR)/lib \
 	--bits=$(if $(filter %64,$(HOSTARCH)),64,32) \
 	--libdir=$(HOST_DIR)/lib \
-	--with-sqlite=$(HOST_DIR)/usr
+	--with-sqlite=$(HOST_DIR)
 
 $(eval $(host-autotools-package))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e941f89624..465e81a778 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -612,10 +612,10 @@ QT_CONF_FILE = $(HOST_DIR)/bin/qt.conf
 define QT_INSTALL_QT_CONF
 	mkdir -p $(dir $(QT_CONF_FILE))
 	echo "[Paths]"                             > $(QT_CONF_FILE)
-	echo "Prefix=$(HOST_DIR)/usr"             >> $(QT_CONF_FILE)
+	echo "Prefix=$(HOST_DIR)"             >> $(QT_CONF_FILE)
 	echo "Headers=$(STAGING_DIR)/usr/include" >> $(QT_CONF_FILE)
 	echo "Libraries=$(STAGING_DIR)/usr/lib"   >> $(QT_CONF_FILE)
-	echo "Data=$(HOST_DIR)/usr"               >> $(QT_CONF_FILE)
+	echo "Data=$(HOST_DIR)"               >> $(QT_CONF_FILE)
 	echo "Binaries=$(HOST_DIR)/bin"       >> $(QT_CONF_FILE)
 endef
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a91c138f68..fed213c53e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -234,7 +234,7 @@ define QT5BASE_CONFIGURE_CMDS
 		./configure \
 		-v \
 		-prefix /usr \
-		-hostprefix $(HOST_DIR)/usr \
+		-hostprefix $(HOST_DIR) \
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 5e101b1d86..d2e9f05998 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -64,8 +64,8 @@ HOST_SETOOLS_CONF_OPTS = \
 	--disable-swig-java \
 	--disable-swig-python \
 	--disable-swig-tcl \
-	--with-sepol-devel="$(HOST_DIR)/usr" \
-	--with-selinux-devel="$(HOST_DIR)/usr" \
+	--with-sepol-devel="$(HOST_DIR)" \
+	--with-selinux-devel="$(HOST_DIR)" \
 	PYTHON_LDFLAGS="-L$(HOST_DIR)/lib/" \
 	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
 	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)" \
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index eec88c743a..1fe7162c21 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -16,7 +16,7 @@ HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 # stating to "please choose a target for 'make'"... :-(
 define HOST_UPX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR) \
 		CXXFLAGS_WERROR= \
 		-C $(@D) all
 endef
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 9879dbab75..a6a67ad317 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -31,7 +31,7 @@ define HOST_VBOOT_UTILS_BUILD_CMDS
 endef
 
 define HOST_VBOOT_UTILS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
 		futil_install cgpt_install devkeys_install
 endef
 
-- 
2.11.0
