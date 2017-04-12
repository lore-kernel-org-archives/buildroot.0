From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:51 +0200
Subject: [Buildroot] [PATCH 17/53] generic packages: use $(HOST_DIR) instead
	of $(HOST_DIR)/usr as prefix
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-18-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

This is a mechanical change with
git grep -l '\$(HOST_DIR)/usr' | xargs sed -i 's%\(prefix\|PREFIX\)=\("\?\)\$(HOST_DIR)/usr%\1=\2$(HOST_DIR)%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/acl/acl.mk                               | 4 ++--
 package/attr/attr.mk                             | 4 ++--
 package/boost/boost.mk                           | 4 ++--
 package/bzip2/bzip2.mk                           | 4 ++--
 package/cmake/cmake.mk                           | 2 +-
 package/cryptopp/cryptopp.mk                     | 2 +-
 package/doxygen/doxygen.mk                       | 2 +-
 package/dtc/dtc.mk                               | 4 ++--
 package/execline/execline.mk                     | 2 +-
 package/faketime/faketime.mk                     | 4 ++--
 package/gcc/gcc-final/gcc-final.mk               | 2 +-
 package/libsepol/libsepol.mk                     | 2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 package/luajit/luajit.mk                         | 4 ++--
 package/luarocks/luarocks.mk                     | 4 ++--
 package/lz4/lz4.mk                               | 2 +-
 package/nodejs/nodejs.mk                         | 2 +-
 package/openssl/openssl.mk                       | 2 +-
 package/perl/perl.mk                             | 2 +-
 package/pngquant/pngquant.mk                     | 2 +-
 package/qemu/qemu.mk                             | 2 +-
 package/s6-rc/s6-rc.mk                           | 2 +-
 package/s6/s6.mk                                 | 2 +-
 package/sdl_image/sdl_image.mk                   | 4 ++--
 package/skalibs/skalibs.mk                       | 2 +-
 package/sunxi-tools/sunxi-tools.mk               | 4 ++--
 package/zip/zip.mk                               | 2 +-
 package/zlib/zlib.mk                             | 2 +-
 28 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index edcf4fd8ed..9e57d09131 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -47,8 +47,8 @@ HOST_ACL_DEPENDENCIES = host-attr
 HOST_ACL_CONF_OPTS = --enable-gettext=no
 HOST_ACL_MAKE_ENV = CFLAGS="$(HOST_CFLAGS)"
 HOST_ACL_INSTALL_OPTS = \
-	prefix=$(HOST_DIR)/usr \
-	exec_prefix=$(HOST_DIR)/usr \
+	prefix=$(HOST_DIR) \
+	exec_prefix=$(HOST_DIR) \
 	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
 	install-dev install-lib
 # For the host, libacl.la is correct, no fixup needed.
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 0c85701e07..8d250608b7 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -28,8 +28,8 @@ ATTR_INSTALL_TARGET_OPTS = \
 	install install-lib
 
 HOST_ATTR_INSTALL_OPTS = \
-	prefix=$(HOST_DIR)/usr \
-	exec_prefix=$(HOST_DIR)/usr \
+	prefix=$(HOST_DIR) \
+	exec_prefix=$(HOST_DIR) \
 	install-dev install-lib
 
 # The libdir variable in libattr.la is empty, so let's fix it. This is
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 874c03fcb6..3600cdea84 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -167,14 +167,14 @@ define HOST_BOOST_BUILD_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--ignore-site-config \
-	--prefix=$(HOST_DIR)/usr )
+	--prefix=$(HOST_DIR) )
 endef
 
 define HOST_BOOST_INSTALL_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--ignore-site-config \
 	--layout=$(BOOST_LAYOUT) install )
 endef
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 0597ab97d6..62571ed5a3 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -60,9 +60,9 @@ endef
 
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
-		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+		$(MAKE) PREFIX=$(HOST_DIR) -C $(@D) install
 	$(HOST_MAKE_ENV) \
-		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
+		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d9eea32857..47b4a325db 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -41,7 +41,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
-		./bootstrap --prefix=$(HOST_DIR)/usr \
+		./bootstrap --prefix=$(HOST_DIR) \
 			--parallel=$(PARALLEL_JOBS) -- \
 			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
 			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_CXXFLAGS)" \
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 5c5def5bc5..4b121aef2d 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -24,7 +24,7 @@ define HOST_CRYPTOPP_BUILD_CMDS
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 428747b117..89a4748400 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -12,7 +12,7 @@ DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
 define HOST_DOXYGEN_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
+	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR))
 endef
 
 define HOST_DOXYGEN_BUILD_CMDS
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 5bb2ca26a3..262f8bf56a 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -47,11 +47,11 @@ endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-bin
 endef
 
 $(eval $(generic-package))
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index ca7c73e775..6cd9dc1736 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -45,7 +45,7 @@ endef
 HOST_EXECLINE_DEPENDENCIES = host-skalibs
 
 HOST_EXECLINE_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--shebangdir=/usr/bin \
 	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 03879ea65c..6c88a71aa3 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -10,11 +10,11 @@ FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
 
 define HOST_FAKETIME_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)
 endef
 
 define HOST_FAKETIME_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 12f08c81a8..78466fa4da 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -43,7 +43,7 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		$(HOST_GCC_FINAL_CONF_ENV) \
 		./configure \
-		--prefix="$(HOST_DIR)/usr" \
+		--prefix="$(HOST_DIR)" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-static \
 		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index d360bfbcb1..233334eea2 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -36,7 +36,7 @@ endef
 HOST_LIBSEPOL_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
 	DESTDIR=$(HOST_DIR)/usr \
-	PREFIX=$(HOST_DIR)/usr
+	PREFIX=$(HOST_DIR)
 
 define HOST_LIBSEPOL_BUILD_CMDS
 	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 401470d907..bca1c34a8f 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -14,7 +14,7 @@ LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
-			PREFIX=$(HOST_DIR)/usr \
+			PREFIX=$(HOST_DIR) \
 			EXPATLIBPATH=$(HOST_DIR)/usr/lib \
 			EXPATINCPATH=$(HOST_DIR)/usr/include \
 			INSTALLDIRS=site \
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d3ef3b7599..f20ba51482 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -66,13 +66,13 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
 # host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" BUILDMODE=dynamic \
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
 		-C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" LDCONFIG=true -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index d18056a527..646e43b668 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -19,7 +19,7 @@ LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 HOST_LUAROCKS_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
 	--with-lua=$(HOST_DIR)/usr
 
@@ -34,7 +34,7 @@ endef
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install \
-		PREFIX=$(HOST_DIR)/usr
+		PREFIX=$(HOST_DIR)
 	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LUA_INCDIR = [[$(STAGING_DIR)/usr/include]],"  >> $(LUAROCKS_CONFIG_FILE)
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index d350d4c099..91ff43b052 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -22,7 +22,7 @@ define HOST_LZ4_BUILD_CMDS
 endef
 
 define HOST_LZ4_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX=$(HOST_DIR) \
 		install -C $(@D)
 endef
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ad0b26df45..a9c96cad91 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -55,7 +55,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
-		--prefix=$(HOST_DIR)/usr \
+		--prefix=$(HOST_DIR) \
 		--without-snapshot \
 		--without-dtrace \
 		--without-etw \
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 1536982f8b..ebced44ea4 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -61,7 +61,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
-		--prefix=$(HOST_DIR)/usr \
+		--prefix=$(HOST_DIR) \
 		--openssldir=$(HOST_DIR)/etc/ssl \
 		--libdir=/lib \
 		shared \
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 130441f703..a4679ebe26 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -91,7 +91,7 @@ endef
 
 HOST_PERL_CONF_OPTS = \
 	-des \
-	-Dprefix="$(HOST_DIR)/usr" \
+	-Dprefix="$(HOST_DIR)" \
 	-Dcc="$(HOSTCC)"
 
 define HOST_PERL_CONFIGURE_CMDS
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 4a6f32fdca..744d9f4090 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -36,7 +36,7 @@ endef
 define HOST_PNGQUANT_CONFIGURE_CMDS
 	(cd $(@D) && \
 		$(HOST_CONFIGURE_OPTS) \
-		./configure --prefix=$(HOST_DIR)/usr \
+		./configure --prefix=$(HOST_DIR) \
 		--without-lcms2 \
 	)
 endef
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2b6aafbae8..6df3b3db8b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -126,7 +126,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 	cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
 		./configure \
 		--target-list="$(HOST_QEMU_TARGETS)" \
-		--prefix="$(HOST_DIR)/usr" \
+		--prefix="$(HOST_DIR)" \
 		--interp-prefix=$(STAGING_DIR) \
 		--cc="$(HOSTCC)" \
 		--host-cc="$(HOSTCC)" \
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 1c28dcb88a..39c18852f1 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -47,7 +47,7 @@ endef
 HOST_S6_RC_DEPENDENCIES = host-s6
 
 HOST_S6_RC_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--libexecdir=/usr/libexec \
 	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index de08f67848..4632f5829c 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -46,7 +46,7 @@ endef
 HOST_S6_DEPENDENCIES = host-execline
 
 HOST_S6_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
 	--with-dynlib=$(HOST_DIR)/usr/lib \
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 6ea657bcff..ee0712cc27 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -37,8 +37,8 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
 HOST_SDL_IMAGE_CONF_OPTS = \
-	--with-sdl-prefix=$(HOST_DIR)/usr \
-	--with-sdl-exec-prefix=$(HOST_DIR)/usr \
+	--with-sdl-prefix=$(HOST_DIR) \
+	--with-sdl-exec-prefix=$(HOST_DIR) \
 	--disable-sdltest \
 	--disable-static \
 	--disable-jpg-shared \
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 55b8a293a7..de2ead704a 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -33,7 +33,7 @@ define SKALIBS_INSTALL_STAGING_CMDS
 endef
 
 HOST_SKALIBS_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--disable-static \
 	--enable-shared \
 	--disable-allstatic
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 9bb0b9eff9..c193769c10 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -12,13 +12,13 @@ HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR) \
 		EXTRA_CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
 		-C $(@D) tools
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR) \
 		-C $(@D) install-tools
 endef
 
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 66d94b3c68..0bd3d3c11f 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -47,7 +47,7 @@ endef
 
 define HOST_ZIP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
-		prefix=$(HOST_DIR)/usr
+		prefix=$(HOST_DIR)
 endef
 
 $(eval $(generic-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 23c6e95cfa..9b5f52e807 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -38,7 +38,7 @@ define HOST_ZLIB_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_ARGS) \
 		$(HOST_CONFIGURE_OPTS) \
 		./configure \
-		--prefix="$(HOST_DIR)/usr" \
+		--prefix="$(HOST_DIR)" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 	)
 endef
-- 
2.11.0
