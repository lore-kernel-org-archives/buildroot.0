From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:54 +0200
Subject: [Buildroot] [PATCH 20/53] Globally replace $(HOST_DIR)/usr/lib with
	$(HOST_DIR)/lib
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-21-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/lib' | xargs sed -i 's%$(HOST_DIR)/usr/lib%$(HOST_DIR)/lib%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/grub2/grub2.mk                              | 4 ++--
 package/4th/4th.mk                               | 4 ++--
 package/Makefile.in                              | 6 +++---
 package/acl/acl.mk                               | 2 +-
 package/efl/efl.mk                               | 2 +-
 package/ejabberd/ejabberd.mk                     | 2 +-
 package/execline/execline.mk                     | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                 | 4 ++--
 package/go-bootstrap/go-bootstrap.mk             | 2 +-
 package/go/go.mk                                 | 2 +-
 package/gtest/gtest.mk                           | 2 +-
 package/heimdal/heimdal.mk                       | 4 ++--
 package/leafnode2/leafnode2.mk                   | 2 +-
 package/libselinux/libselinux.mk                 | 8 ++++----
 package/libsemanage/libsemanage.mk               | 4 ++--
 package/libsepol/libsepol.mk                     | 2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk | 6 +++---
 package/lua/lua.mk                               | 2 +-
 package/mfgtools/mfgtools.mk                     | 2 +-
 package/mono/mono.mk                             | 4 ++--
 package/monolite/monolite.mk                     | 4 ++--
 package/owfs/owfs.mk                             | 2 +-
 package/pseudo/pseudo.mk                         | 4 ++--
 package/python-cffi/python-cffi.mk               | 2 +-
 package/s6-rc/s6-rc.mk                           | 4 ++--
 package/s6/s6.mk                                 | 4 ++--
 package/scons/scons.mk                           | 2 +-
 package/setools/setools.mk                       | 4 ++--
 28 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 698cb19980..80f06c7f02 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -79,7 +79,7 @@ GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 define GRUB2_IMAGE_INSTALL_ELTORITO
-	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
+	cat $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
 		$(BINARIES_DIR)/grub-eltorito.img
 endef
 endif
@@ -87,7 +87,7 @@ endif
 define GRUB2_IMAGE_INSTALLATION
 	mkdir -p $(dir $(GRUB2_IMAGE))
 	$(HOST_DIR)/bin/grub-mkimage \
-		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
+		-d $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE) \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		-p "$(GRUB2_PREFIX)" \
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 7076519d16..c10b1db15c 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -60,10 +60,10 @@ endef
 
 define HOST_4TH_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/bin
-	mkdir -p $(HOST_DIR)/usr/lib
+	mkdir -p $(HOST_DIR)/lib
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources mostlyinstall \
 		BINARIES=$(HOST_DIR)/bin \
-		LIBRARIES=$(HOST_DIR)/usr/lib
+		LIBRARIES=$(HOST_DIR)/lib
 endef
 
 $(eval $(generic-package))
diff --git a/package/Makefile.in b/package/Makefile.in
index e287af03df..75200a832e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -230,9 +230,9 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 export PERL=$(shell which perl)
 
 # host-intltool needs libxml-parser-perl, which Buildroot installs in
-# $(HOST_DIR)/usr/lib/perl, so we must make sure that the system perl
+# $(HOST_DIR)/lib/perl, so we must make sure that the system perl
 # finds this perl module by exporting the proper value for PERL5LIB.
-export PERL5LIB=$(HOST_DIR)/usr/lib/perl
+export PERL5LIB=$(HOST_DIR)/lib/perl
 
 TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
@@ -283,7 +283,7 @@ HOST_MAKE_ENV = \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
 
 HOST_CONFIGURE_OPTS = \
 	$(HOST_MAKE_ENV) \
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 9e57d09131..4d30059390 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -49,7 +49,7 @@ HOST_ACL_MAKE_ENV = CFLAGS="$(HOST_CFLAGS)"
 HOST_ACL_INSTALL_OPTS = \
 	prefix=$(HOST_DIR) \
 	exec_prefix=$(HOST_DIR) \
-	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
+	PKG_DEVLIB_DIR=$(HOST_DIR)/lib \
 	install-dev install-lib
 # For the host, libacl.la is correct, no fixup needed.
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 466ea3d9f1..403950e9a2 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -370,7 +370,7 @@ endif
 # system bus which is non-existent and does not contain
 # any upower service in it.
 define HOST_EFL_HOOK_REMOVE_UPOWER
-	rm -fr $(HOST_DIR)/usr/lib/ecore/system/upower
+	rm -fr $(HOST_DIR)/lib/ecore/system/upower
 endef
 HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
 
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 66686616ce..483f8faf05 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -26,7 +26,7 @@ EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
 # Guess answers for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling.
 EJABBERD_CONF_ENV = \
-	ac_cv_erlang_root_dir="$(HOST_DIR)/usr/lib/erlang" \
+	ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
 	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
 		ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
 
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 6cd9dc1736..7e1797e72d 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -47,9 +47,9 @@ HOST_EXECLINE_DEPENDENCIES = host-skalibs
 HOST_EXECLINE_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--shebangdir=/usr/bin \
-	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
-	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
 	--disable-allstatic
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 688688316b..ac92e23c18 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -58,7 +58,7 @@ endif
 # need to sanitize (strip) them.
 ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
-	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
+	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 	$(SED) "s,$(HOST_DIR),,g" \
@@ -77,7 +77,7 @@ GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_DISABLE_TESTS
 # thumbnailer. Use the host-built since it matches the target options
 # regarding mime types (which is the used information).
 define GDK_PIXBUF_COPY_LOADERS_CACHE
-	cp -f $(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache \
+	cp -f $(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache \
 		$(@D)/gdk-pixbuf
 endef
 GDK_PIXBUF_PRE_BUILD_HOOKS += GDK_PIXBUF_COPY_LOADERS_CACHE
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 28a113ec89..6710e31561 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -17,7 +17,7 @@ GO_BOOTSTRAP_LICENSE_FILES = LICENSE
 # host-go-bootstrap.
 HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
 
-HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
+HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_VERSION)
 
 # The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
 # here.  See https://github.com/golang/go/issues/11685.
diff --git a/package/go/go.mk b/package/go/go.mk
index 0bbf9430b0..77cfc17c53 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -37,7 +37,7 @@ GO_GOARCH = mips64le
 endif
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
-HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
+HOST_GO_ROOT = $(HOST_DIR)/lib/go
 
 # For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index c82287e501..d7b47e93aa 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -26,7 +26,7 @@ HOST_GTEST_DEPENDENCIES += host-python
 endif
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
-	$(HOST_DIR)/usr/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
+	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 1658740839..5af7926854 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -30,10 +30,10 @@ HEIMDAL_LICENSE_FILES = LICENSE
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
-	ln -sf $(HOST_DIR)/usr/libexec/heimdal/asn1_compile \
+	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
 		$(HOST_DIR)/bin/asn1_compile
 	ln -sf $(HOST_DIR)/bin/compile_et \
-		$(HOST_DIR)/usr/libexec/heimdal/compile_et
+		$(HOST_DIR)/libexec/heimdal/compile_et
 endef
 
 HOST_HEIMDAL_POST_INSTALL_HOOKS += HOST_HEIMDAL_MAKE_SYMLINK
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 4a920ccf92..7efe9445ad 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -31,7 +31,7 @@ define LEAFNODE2_BUILD_SORTNL_TOOL
 	$(HOSTCC) $(HOST_CFLAGS) -o b_sortnl_host \
 		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
 		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/usr/include \
-		-L $(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib -lpcre
+		-L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib -lpcre
 endef
 
 LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 75cf8e30e3..9c76d1ed2c 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -83,7 +83,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
-	PYSITEDIR="$(HOST_DIR)/usr/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
+	PYSITEDIR="$(HOST_DIR)/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
 	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
 
 define HOST_LIBSELINUX_BUILD_CMDS
@@ -91,7 +91,7 @@ define HOST_LIBSELINUX_BUILD_CMDS
 	# header paths.
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib all
+		SHLIBDIR=$(HOST_DIR)/lib all
 	# Generate python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
@@ -100,8 +100,8 @@ endef
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/sbin install
-	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
+		SHLIBDIR=$(HOST_DIR)/lib SBINDIR=$(HOST_DIR)/sbin install
+	(cd $(HOST_DIR)/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index c9f0f57f6f..15bc664bd3 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -36,13 +36,13 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 else
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
 endif
 
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 233334eea2..710ab25112 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -44,7 +44,7 @@ endef
 
 define HOST_LIBSEPOL_INSTALL_CMDS
 	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS)
-	ln -sf libsepol.so.1 $(HOST_DIR)/usr/lib/libsepol.so
+	ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index bca1c34a8f..08bc8bb59f 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -15,11 +15,11 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
 			PREFIX=$(HOST_DIR) \
-			EXPATLIBPATH=$(HOST_DIR)/usr/lib \
+			EXPATLIBPATH=$(HOST_DIR)/lib \
 			EXPATINCPATH=$(HOST_DIR)/usr/include \
 			INSTALLDIRS=site \
-			INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
-			INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+			INSTALLSITELIB=$(HOST_DIR)/lib/perl \
+			INSTALLSITEARCH=$(HOST_DIR)/lib/perl \
 	)
 endef
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 5ef61e039e..871d4f29ff 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -96,7 +96,7 @@ endef
 define HOST_LUA_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
+		$(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
 
 $(eval $(generic-package))
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index e37c4dc719..1afd47b13f 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -26,7 +26,7 @@ HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
 
 define HOST_MFGTOOLS_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
-		$(HOST_DIR)/usr/lib/libMfgToolLib.so
+		$(HOST_DIR)/lib/libMfgToolLib.so
 	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
 		$(HOST_DIR)/bin/mfgtoolcli
 endef
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 58dfab70b4..07116a2a32 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -28,7 +28,7 @@ MONO_CONF_OPTS = --with-mcs-docs=no \
 # architecture-independent, we simply copy them to the target.
 define MONO_INSTALL_LIBS
 	rsync -av --exclude=*.so --exclude=*.mdb \
-		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+		$(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
 	rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
 endef
 
@@ -55,7 +55,7 @@ HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
 define HOST_MONO_SETUP_MONOLITE
 	rm -rf $(@D)/mcs/class/lib/monolite
-	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/usr/lib/monolite monolite)
+	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/lib/monolite monolite)
 endef
 
 HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 6b982b3441..9b7794a000 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -10,8 +10,8 @@ MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/lib/monolite
-	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
+	mkdir -p $(HOST_DIR)/lib/monolite
+	cp $(@D)/* $(HOST_DIR)/lib/monolite
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index ee37a30558..dceb6b6b5c 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -68,7 +68,7 @@ OWFS_MAKE_ENV += \
 OWFS_DEPENDENCIES += python host-swig
 # The configure scripts finds PYSITEDIR as the python_lib directory of
 # host-python, and then prepends DESTDIR in front of it. So we end up
-# installing things in $(TARGET_DIR)/$(HOST_DIR)/usr/lib/python which is
+# installing things in $(TARGET_DIR)/$(HOST_DIR)/lib/python which is
 # clearly wrong.
 # Patching owfs to do the right thing is not trivial, it's much easier to
 # override the PYSITEDIR variable in make.
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 7a48cec7da..d78fc7aa8a 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -21,9 +21,9 @@ HOST_PSEUDO_DEPENDENCIES = host-attr host-sqlite
 # a warning at configure time.
 HOST_PSEUDO_CONF_OPTS = \
 	--cflags="$(HOSTCFLAGS)" \
-	--with-rpath=$(HOST_DIR)/usr/lib \
+	--with-rpath=$(HOST_DIR)/lib \
 	--bits=$(if $(filter %64,$(HOSTARCH)),64,32) \
-	--libdir=$(HOST_DIR)/usr/lib \
+	--libdir=$(HOST_DIR)/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
 $(eval $(host-autotools-package))
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 8683665496..5e6bd6eefe 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -20,7 +20,7 @@ HOST_PYTHON_CFFI_ENV = \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
 HOST_PYTHON_CFFI_DEPENDENCIES = host-pkgconf host-python-pycparser host-libffi
 
 $(eval $(python-package))
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 23c3c091ca..c3f6aaab74 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -49,9 +49,9 @@ HOST_S6_RC_DEPENDENCIES = host-s6
 HOST_S6_RC_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--libexecdir=/usr/libexec \
-	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
-	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
 	--disable-allstatic
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 4632f5829c..7ed9ef4e36 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -47,9 +47,9 @@ HOST_S6_DEPENDENCIES = host-execline
 
 HOST_S6_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
-	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/usr/include \
-	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
 	--disable-allstatic
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 8e1e8a99f2..c56526c83c 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -13,7 +13,7 @@ SCONS_SETUP_TYPE = distutils
 HOST_SCONS_NEEDS_HOST_PYTHON = python2
 
 HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
+	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
 
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 9aa74d5e65..960e5be921 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -48,7 +48,7 @@ HOST_SETOOLS_DEPENDENCIES += host-python
 HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
 endif
 
-HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
+HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
 HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
 HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
 
@@ -66,7 +66,7 @@ HOST_SETOOLS_CONF_OPTS = \
 	--disable-swig-tcl \
 	--with-sepol-devel="$(HOST_DIR)/usr" \
 	--with-selinux-devel="$(HOST_DIR)/usr" \
-	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
+	PYTHON_LDFLAGS="-L$(HOST_DIR)/lib/" \
 	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
 	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)" \
 	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"
-- 
2.11.0
