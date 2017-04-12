From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:55 +0200
Subject: [Buildroot] [PATCH 21/53] Globally replace $(HOST_DIR)/usr/include
	with $(HOST_DIR)/include
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-22-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/include' | xargs sed -i 's%$(HOST_DIR)/usr/include%$(HOST_DIR)/include%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in                                    | 2 +-
 package/cmake/cmake.mk                                 | 2 +-
 package/execline/execline.mk                           | 2 +-
 package/google-breakpad/google-breakpad.mk             | 2 +-
 package/gutenprint/gutenprint.mk                       | 4 ++--
 package/leafnode2/leafnode2.mk                         | 2 +-
 package/libselinux/libselinux.mk                       | 4 ++--
 package/libsemanage/libsemanage.mk                     | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk       | 2 +-
 package/linux-syscall-support/linux-syscall-support.mk | 2 +-
 package/mfgtools/mfgtools.mk                           | 2 +-
 package/openocd/openocd.mk                             | 4 ++--
 package/s6-rc/s6-rc.mk                                 | 2 +-
 package/s6/s6.mk                                       | 2 +-
 package/setools/setools.mk                             | 2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk               | 2 +-
 package/zic/zic.mk                                     | 2 +-
 17 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 75200a832e..3ec4a43e04 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -217,7 +217,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
-HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
+HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 47b4a325db..7076668850 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -32,7 +32,7 @@ CMAKE_CONF_OPTS = \
 	-DBUILD_CursesDialog=OFF
 
 # Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
-# header available in $(HOST_DIR)/usr/include is used instead of a
+# header available in $(HOST_DIR)/include is used instead of a
 # CMake internal header, e.g. lzma* headers of the xz package
 HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 7e1797e72d..2aeba2cc83 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -48,7 +48,7 @@ HOST_EXECLINE_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--shebangdir=/usr/bin \
 	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/usr/include \
+	--with-include=$(HOST_DIR)/include \
 	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 191ee5bec2..c09f9987b7 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -20,7 +20,7 @@ HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
 # Avoid using depot-tools to download this file.
 define HOST_GOOGLE_BREAKPAD_LSS
 	$(INSTALL) -D -m 0644 \
-		$(HOST_DIR)/usr/include/linux_syscall_support.h \
+		$(HOST_DIR)/include/linux_syscall_support.h \
 		$(@D)/src/third_party/lss/linux_syscall_support.h
 endef
 HOST_GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += HOST_GOOGLE_BREAKPAD_LSS
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 99d1f4324c..2e0ff3d906 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -43,7 +43,7 @@ GUTENPRINT_CONF_OPTS = \
 	--disable-cups-ppds
 
 # USE_PREGEN_XMLI18N_TMP_H is added by our patch
-GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/usr/include/xmli18n-tmp.h
+GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/include/xmli18n-tmp.h
 
 HOST_GUTENPRINT_DEPENDENCIES = host-pkgconf
 # The host-gutenprint shall create the required header
@@ -78,7 +78,7 @@ GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 
 define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
-	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
+	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/include
 endef
 HOST_GUTENPRINT_POST_BUILD_HOOKS += HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
 
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 7efe9445ad..a02aad4302 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -30,7 +30,7 @@ define LEAFNODE2_BUILD_SORTNL_TOOL
 	cd $(@D); \
 	$(HOSTCC) $(HOST_CFLAGS) -o b_sortnl_host \
 		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
-		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/usr/include \
+		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/include \
 		-L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib -lpcre
 endef
 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 9c76d1ed2c..81c2d225d1 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -71,11 +71,11 @@ HOST_LIBSELINUX_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 HOST_LIBSELINUX_DEPENDENCIES += host-python
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 15bc664bd3..efeb1fcd20 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -35,13 +35,13 @@ HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/" \
+	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/" \
 	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 else
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python
 HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYINC="-I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/" \
 	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
 endif
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 08bc8bb59f..4a3b196448 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -16,7 +16,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
 			PREFIX=$(HOST_DIR) \
 			EXPATLIBPATH=$(HOST_DIR)/lib \
-			EXPATINCPATH=$(HOST_DIR)/usr/include \
+			EXPATINCPATH=$(HOST_DIR)/include \
 			INSTALLDIRS=site \
 			INSTALLSITELIB=$(HOST_DIR)/lib/perl \
 			INSTALLSITEARCH=$(HOST_DIR)/lib/perl \
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
index c02610d80d..b8145de496 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -22,7 +22,7 @@ endef
 
 define HOST_LINUX_SYSCALL_SUPPORT_INSTALL_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
-		$(HOST_DIR)/usr/include/linux_syscall_support.h
+		$(HOST_DIR)/include/linux_syscall_support.h
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 1afd47b13f..00a011af85 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -14,7 +14,7 @@ HOST_MFGTOOLS_DEPENDENCIES = host-libusb
 HOST_MFGTOOLS_CFLAGS = \
 	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
 	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
-	-lusb-1.0 -I$(HOST_DIR)/usr/include/libusb-1.0 \
+	-lusb-1.0 -I$(HOST_DIR)/include/libusb-1.0 \
 	-fpermissive -Wno-write-strings
 
 define HOST_MFGTOOLS_CLI_BUILD
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 911d31168d..b435dc604f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -89,8 +89,8 @@ HOST_OPENOCD_CONF_OPTS = \
 	--enable-openjtag_ftdi \
 	--enable-buspirate \
 	--enable-sysfsgpio \
-	--oldincludedir=$(HOST_DIR)/usr/include \
-	--includedir=$(HOST_DIR)/usr/include \
+	--oldincludedir=$(HOST_DIR)/include \
+	--includedir=$(HOST_DIR)/include \
 	--disable-doxygen-html \
 	--with-jim-shared=no \
 	--disable-shared \
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index c3f6aaab74..ce128b0106 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -50,7 +50,7 @@ HOST_S6_RC_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--libexecdir=/usr/libexec \
 	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/usr/include \
+	--with-include=$(HOST_DIR)/include \
 	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 7ed9ef4e36..33e5c00f5e 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -48,7 +48,7 @@ HOST_S6_DEPENDENCIES = host-execline
 HOST_S6_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/usr/include \
+	--with-include=$(HOST_DIR)/include \
 	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 960e5be921..5e101b1d86 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -49,7 +49,7 @@ HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
 endif
 
 HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
-HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
+HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/include/python$(HOST_SETOOLS_PYTHON_VERSION)
 HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
 
 # Notes: Need "disable-selinux-check" so the configure does not check to see
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fe1a7c3bc5..64344da737 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -48,7 +48,7 @@ HOST_XLIB_LIBX11_CONF_OPTS = \
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
 # doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
-# we know the X11 includes are in $(HOST_DIR)/usr/include, which are already
+# we know the X11 includes are in $(HOST_DIR)/include, which are already
 # in the CFLAGS_FOR_BUILD, so we can just remove the X11_CFLAGS
 define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 	$(SED) '/X11_CFLAGS/d' $(@D)/src/util/Makefile*
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index ad2acdff20..f179f9ce8f 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -16,7 +16,7 @@ endef
 
 define HOST_ZIC_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/sbin/zic
-	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/usr/include/tzfile.h
+	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/include/tzfile.h
 endef
 
 $(eval $(host-generic-package))
-- 
2.11.0
