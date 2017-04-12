From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:56 +0200
Subject: [Buildroot] [PATCH 22/53] Globally replace $(HOST_DIR)/usr/share
	with $(HOST_DIR)/share
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-23-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/share' | xargs sed -i 's%$(HOST_DIR)/usr/share%$(HOST_DIR)/share%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/syslinux/syslinux.mk                          | 2 +-
 fs/iso9660/iso9660.mk                              | 2 +-
 package/Makefile.in                                | 2 +-
 package/autoconf-archive/autoconf-archive.mk       | 2 +-
 package/automake/automake.mk                       | 2 +-
 package/gettext/gettext.mk                         | 2 +-
 package/gutenprint/gutenprint.mk                   | 2 +-
 package/libselinux/libselinux.mk                   | 4 ++--
 package/libsemanage/libsemanage.mk                 | 2 +-
 package/libsigrok/libsigrok.mk                     | 2 +-
 package/libsvgtiny/libsvgtiny.mk                   | 2 +-
 package/luarocks/luarocks.mk                       | 2 +-
 package/luvi/luvi.mk                               | 2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.mk | 2 +-
 package/python-cffi/python-cffi.mk                 | 2 +-
 package/thrift/thrift.mk                           | 2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk                   | 4 ++--
 package/tz/tz.mk                                   | 6 +++---
 package/tzdata/tzdata.mk                           | 6 +++---
 19 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 9feb48a666..f900567d4d 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -96,7 +96,7 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
 	for i in $(SYSLINUX_C32); do \
-		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
+		$(INSTALL) -D -m 0755 $(HOST_DIR)/share/syslinux/$${i} \
 			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index fec6fe17c2..fafe5b0e84 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -70,7 +70,7 @@ ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/syslinux/ldlinux.c32 \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
 endef
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index 3ec4a43e04..6a91d2abe5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -283,7 +283,7 @@ HOST_MAKE_ENV = \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 
 HOST_CONFIGURE_OPTS = \
 	$(HOST_MAKE_ENV) \
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 053ea33fa9..5c04937c74 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -9,6 +9,6 @@ AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
 AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
-HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/usr/share/autoconf-archive install
+HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/share/autoconf-archive install
 
 $(eval $(host-autotools-package))
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 13041213bb..88c4fb3ee9 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,7 +12,7 @@ AUTOMAKE_LICENSE_FILES = COPYING
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
-ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_HOST_DIR = $(HOST_DIR)/share/aclocal
 
 define GTK_DOC_M4_INSTALL
 	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index c2971a70d9..cc2c8ccec3 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -80,7 +80,7 @@ HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 # host, so do it manually
 define HOST_GETTEXT_ADD_ABOUT_NLS
 	$(INSTALL) -m 0644 $(@D)/$(HOST_GETTEXT_SUBDIR)/ABOUT-NLS \
-		$(HOST_DIR)/usr/share/gettext/ABOUT-NLS
+		$(HOST_DIR)/share/gettext/ABOUT-NLS
 endef
 
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 2e0ff3d906..65b8d31091 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -84,7 +84,7 @@ HOST_GUTENPRINT_POST_BUILD_HOOKS += HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
 
 define GUTENPRINT_POST_INSTALL_TARGET_FIXUP
 	mkdir -p $(TARGET_DIR)/usr/share/gutenprint/5.2
-	cp -rf $(HOST_DIR)/usr/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
+	cp -rf $(HOST_DIR)/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
 endef
 GUTENPRINT_POST_INSTALL_TARGET_HOOKS += GUTENPRINT_POST_INSTALL_TARGET_FIXUP
 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 81c2d225d1..0d97c17e3a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -37,7 +37,7 @@ endif
 LIBSELINUX_MAKE_OPTS += \
 	PYINC="$(LIBSELINUX_PYINC)" \
 	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 LIBSELINUX_MAKE_TARGETS += swigify pywrap
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
@@ -84,7 +84,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
 	PYSITEDIR="$(HOST_DIR)/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 define HOST_LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index efeb1fcd20..5ef2d57e35 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -30,7 +30,7 @@ endef
 HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
 HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 9137165029..82c2c08e2e 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -39,7 +39,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/usr/share/autoconf-archive
+LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/share/autoconf-archive
 LIBSIGROK_DEPENDENCIES += \
 	host-autoconf-archive \
 	glibmm \
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index acd08d72d5..febd3fcec8 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -23,7 +23,7 @@ LIBSVGTINY_COMPONENT_TYPE = lib-static
 endif
 
 define LIBSVGTINY_CONFIGURE_CMDS
-	ln -sf $(HOST_DIR)/usr/share/netsurf-buildsystem $(@D)/build
+	ln -sf $(HOST_DIR)/share/netsurf-buildsystem $(@D)/build
 endef
 
 define LIBSVGTINY_BUILD_CMDS
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cf449ac52c..e965ab2288 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -53,7 +53,7 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
+LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
 LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
 
 define LUAROCKS_FINALIZE_TARGET
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ade63f5fba..8c4cbbe0d7 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -33,7 +33,7 @@ LUVI_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DWithSharedLibluv=ON \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
-	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua
+	-DLUA_PATH=$(HOST_DIR)/share/luajit-2.0.4/?.lua
 
 # Add "rex" module (PCRE via bundled lrexlib)
 ifeq ($(BR2_PACKAGE_PCRE),y)
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
index f316eb126b..d4efec0e1d 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.mk
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.mk
@@ -10,7 +10,7 @@ NETSURF_BUILDSYSTEM_SITE_METHOD = git
 NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3-Clause (for llvm/* files)
 NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
 
-NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/usr/share/netsurf-buildsystem
+NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/share/netsurf-buildsystem
 
 define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
 	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 5e6bd6eefe..e5132d559b 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -20,7 +20,7 @@ HOST_PYTHON_CFFI_ENV = \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 HOST_PYTHON_CFFI_DEPENDENCIES = host-pkgconf host-python-pycparser host-libffi
 
 $(eval $(python-package))
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index cbd5401dce..741d33f571 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -21,7 +21,7 @@ HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
 	--disable-tests \
 	--disable-tutorial
 THRIFT_AUTORECONF = YES
-THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
+THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index d6de05e5da..361a64a34b 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -21,10 +21,10 @@ define HOST_TI_CGT_PRU_EXTRACT_CMDS
 endef
 
 # Since this is largely prebuilt toolchain and likes to live in its
-# own directory, put it in $(HOST_DIR)/usr/share/ti-cgt-pru/.
+# own directory, put it in $(HOST_DIR)/share/ti-cgt-pru/.
 # Packages wanting to use this toolchain need to use this path as TI's
 # standard PRU_CGT path e.g. make PRU_CGT=$(TI_CGT_PRU_INSTALLDIR)...
-TI_CGT_PRU_INSTALLDIR = $(HOST_DIR)/usr/share/ti-cgt-pru
+TI_CGT_PRU_INSTALLDIR = $(HOST_DIR)/share/ti-cgt-pru
 
 define HOST_TI_CGT_PRU_INSTALL_CMDS
 	mkdir -p $(TI_CGT_PRU_INSTALLDIR)
diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index f0daf4658f..5bcc3faa5b 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -10,7 +10,7 @@ TZ_LICENSE = Public domain
 TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
 
 define TZ_BUILD_CMDS
-	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
+	(cd $(HOST_DIR)/share/zoneinfo/posix/;                 \
 		for i in $$(find . -type f); do                    \
 			mkdir -p $(@D)/output/$$(dirname $$i);         \
 			$(TZDUMP) -p . -q $${i#./} | sed '1d' > $(@D)/output/$$i; \
@@ -19,9 +19,9 @@ define TZ_BUILD_CMDS
 endef
 
 define TZ_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/zone.tab \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/zoneinfo/zone.tab \
 		$(TARGET_DIR)/usr/share/zoneinfo/zone.tab
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/iso3166.tab \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/zoneinfo/iso3166.tab \
 		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 7e63bace5b..9400beeef7 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -31,7 +31,7 @@ TZDATA_EXTRACT_CMDS =
 
 define TZDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
-	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(HOST_DIR)/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
@@ -58,8 +58,8 @@ define HOST_TZDATA_BUILD_CMDS
 endef
 
 define HOST_TZDATA_INSTALL_CMDS
-	$(INSTALL) -d -m 0755 $(HOST_DIR)/usr/share/zoneinfo
-	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/usr/share/zoneinfo
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/share/zoneinfo
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
