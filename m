From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 15:19:02 +0200
Subject: [Buildroot] [git commit] generic packages: use $(HOST_DIR) instead
	of $(HOST_DIR)/usr as prefix
Message-ID: <20170705141334.4C2C180794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15bff58f3e627fc328dd2614fabbbae70113794b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

This is a mechanical change with
git grep -l '\$(HOST_DIR)/usr' | xargs sed -i 's%\(prefix\|PREFIX\)=\("\?\)\$(HOST_DIR)/usr%\1=\2$(HOST_DIR)%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acl/acl.mk                               | 4 ++--
 package/acpica/acpica.mk                         | 2 +-
 package/attr/attr.mk                             | 4 ++--
 package/boost/boost.mk                           | 4 ++--
 package/bzip2/bzip2.mk                           | 4 ++--
 package/cmake/cmake.mk                           | 2 +-
 package/cryptopp/cryptopp.mk                     | 2 +-
 package/dtc/dtc.mk                               | 4 ++--
 package/execline/execline.mk                     | 2 +-
 package/faketime/faketime.mk                     | 4 ++--
 package/gcc/gcc-final/gcc-final.mk               | 2 +-
 package/kodi/kodi.mk                             | 2 +-
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
 29 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index edcf4fd..9e57d09 100644
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
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 8cfe793..57cc37f 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -30,7 +30,7 @@ endef
 
 define HOST_ACPICA_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		PREFIX="$(HOST_DIR)/usr" \
+		PREFIX="$(HOST_DIR)" \
 		INSTALLFLAGS=-m755 install
 endef
 
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 0c85701..8d25060 100644
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
index 874c03f..3600cde 100644
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
index 0597ab9..62571ed 100644
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
index 46bd1e4..d5d18ff 100644
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
index 5c5def5..4b121ae 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -24,7 +24,7 @@ define HOST_CRYPTOPP_BUILD_CMDS
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 9d50e35..dd0f30d 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -47,11 +47,11 @@ endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) PREFIX=$(HOST_DIR)
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-bin
 endef
 
 $(eval $(generic-package))
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index cc56a3a..86ed3f2 100644
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
index 03879ea..6c88a71 100644
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
index 12f08c8..78466fa 100644
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
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7a031b7..d595920 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -63,7 +63,7 @@ KODI_CONF_OPTS += \
 	-DENABLE_INTERNAL_FFMPEG=OFF \
 	-DKODI_DEPENDSBUILD=OFF \
 	-DENABLE_OPENSSL=ON \
-	-DNATIVEPREFIX=$(HOST_DIR)/usr \
+	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(@D) \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/usr/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index d360bfb..233334e 100644
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
index 401470d..bca1c34 100644
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
index 300e6db..939fa66 100644
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
index d18056a..646e43b 100644
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
index d350d4c..91ff43b 100644
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
index b5d73be..ecdc9ce 100644
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
index 5f56b44..ec8e6f2 100644
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
index ca23eb0..fb0cec3 100644
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
index 938603a..f0104fb 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -37,7 +37,7 @@ define HOST_PNGQUANT_CONFIGURE_CMDS
 	(cd $(@D) && \
 		$(HOST_CONFIGURE_OPTS) \
 		CC=$(HOSTCC_NOCCACHE) \
-		./configure --prefix=$(HOST_DIR)/usr \
+		./configure --prefix=$(HOST_DIR) \
 		--without-lcms2 \
 	)
 endef
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9335467..e11307c 100644
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
index 16089dc..0e25f03 100644
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
index f0235da..4113457 100644
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
index 6ea657b..ee0712c 100644
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
index c6f97ee..b8526dd 100644
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
index 9bb0b9e..c193769 100644
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
index 66d94b3..0bd3d3c 100644
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
index 23c6e95..9b5f52e 100644
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
