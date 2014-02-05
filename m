From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 11:50:10 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
	documentation on target
In-Reply-To: <patchbomb.1391597406@argentina>
References: <patchbomb.1391597406@argentina>
Message-ID: <ab1e96c7872d5567b2a4.1391597410@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes deprecated symbol BR2_HAVE_DOCUMENTATION and all its
usage. Additionally, it removes the now unused BR2_DEPRECATED_SINCE_2012_11.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                                              |  14 --------------
 Config.in.legacy                                       |   7 +++++++
 Makefile                                               |   2 --
 package/Makefile.in                                    |   2 --
 package/avahi/avahi.mk                                 |   2 +-
 package/berkeleydb/berkeleydb.mk                       |   4 ----
 package/enlightenment/enlightenment.mk                 |   2 --
 package/ffmpeg/ffmpeg.mk                               |   2 +-
 package/hdparm/hdparm.mk                               |   7 -------
 package/kmod/kmod.mk                                   |   5 +----
 package/libbsd/libbsd.mk                               |   6 ------
 package/logsurfer/logsurfer.mk                         |  13 -------------
 package/ncurses/ncurses.mk                             |   2 +-
 package/netsnmp/netsnmp.mk                             |   4 +---
 package/opencv/opencv.mk                               |   4 +---
 package/perl/perl.mk                                   |   4 ----
 package/pppd/pppd.mk                                   |  10 ----------
 package/pulseaudio/pulseaudio.mk                       |   2 +-
 package/python-pygame/python-pygame.mk                 |   2 --
 package/samba/samba.mk                                 |   2 --
 package/udisks/udisks.mk                               |   3 +--
 package/vala/vala.mk                                   |  10 ++--------
 package/vim/vim.mk                                     |   2 --
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |   2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk     |   2 +-
 25 files changed, 19 insertions(+), 96 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -264,10 +264,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2012_11
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2013_02
 	bool
 	default y
@@ -476,16 +472,6 @@ config BR2_PREFER_STATIC_LIB
 
 	  WARNING: This is highly experimental at the moment.
 
-config BR2_HAVE_DOCUMENTATION
-	bool "documentation on the target"
-	# We no longer want to support a toolchain on the target
-	depends on BR2_DEPRECATED_SINCE_2012_11
-	help
-	  Install the documentation, including manual pages and info
-	  pages, on the target.
-	  If you say n here, your target will not contain any
-	  documentation.
-
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
 	default "$(TOPDIR)/local.mk"
diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_HAVE_DOCUMENTATION
+	bool "support for documentation on target has been removed"
+	select BR2_LEGACY
+	help
+	  Support for documentation on target has been removed since it has
+	  been deprecated for more than four buildroot releases.
+
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake target package has been removed"
 	select BR2_LEGACY
diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -500,13 +500,11 @@ target-finalize:
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
-endif
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -332,7 +332,6 @@ ifneq ($(BR2_LARGEFILE),y)
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 # The configure option varies, but since unknown options are ignored
 # we can pass all of them.
 DISABLE_DOCUMENTATION = \
@@ -342,7 +341,6 @@ DISABLE_DOCUMENTATION = \
 	--disable-documentation \
 	--with-xmlto=no \
 	--with-fop=no
-endif
 
 ifeq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6= --enable-ipv6
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -78,7 +78,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-monodoc \
 		--disable-stack-protector \
 		--with-distro=none \
-		$(if $(BR2_HAVE_DOCUMENTATION),--enable,--disable)-manpages \
+		--disable-manpages \
 		$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
 		--with-avahi-user=default \
 		--with-avahi-group=default \
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -54,14 +54,10 @@ BERKELEYDB_POST_INSTALL_TARGET_HOOKS += 
 
 endif
 
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-
 define BERKELEYDB_REMOVE_DOCS
 	rm -rf $(TARGET_DIR)/usr/docs
 endef
 
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
-endif
-
 $(eval $(autotools-package))
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -35,13 +35,11 @@ else
 ENLIGHTENMENT_CONF_ENV += enable_alsa=no
 endif
 
-ifeq ($(BR2_HAVE_DOCUMENTATION),)
 define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 	rm -rf $(TARGET_DIR)/usr/share/enlightenment/doc/
 	rm -f $(TARGET_DIR)/usr/share/enlightenment/COPYING
 	rm -f $(TARGET_DIR)/usr/share/enlightenment/AUTHORS
 endef
 ENLIGHTENMENT_POST_INSTALL_TARGET_HOOKS += ENLIGHTENMENT_REMOVE_DOCUMENTATION
-endif
 
 $(eval $(autotools-package))
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -69,7 +69,7 @@ FFMPEG_CONF_OPT = \
 	--disable-vis \
 	--disable-sram \
 	--disable-symver \
-	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
+	--disable-doc
 
 FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -15,15 +15,8 @@ define HDPARM_BUILD_CMDS
 		LDFLAGS="$(TARGET_LDFLAGS)"
 endef
 
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-define HDPARM_INSTALL_DOCUMENTATION
-	$(INSTALL) -D $(@D)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
-endef
-endif
-
 define HDPARM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/hdparm $(TARGET_DIR)/sbin/hdparm
-	$(HDPARM_INSTALL_DOCUMENTATION)
 endef
 
 $(eval $(generic-package))
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -19,12 +19,9 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPT = --disable-static --enable-shared
 
-# manpages not installed to host and needs xsltproc
+# manpages not installed and needs xsltproc
 HOST_KMOD_CONF_OPT = --disable-manpages
-
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 KMOD_CONF_OPT += --disable-manpages
-endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -9,12 +9,6 @@ LIBBSD_SITE            = http://libbsd.f
 LIBBSD_LICENSE         = BSD-3c MIT
 LIBBSD_LICENSE_FILES   = COPYING
 
-# man-pages are BSD-4c, so that license only matters
-# if doc is kept in the target rootfs
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-LIBBSD_LICENSE        += (libraries), BSD-4c (documentation)
-endif
-
 LIBBSD_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
--- a/package/logsurfer/logsurfer.mk
+++ b/package/logsurfer/logsurfer.mk
@@ -12,17 +12,4 @@ define LOGSURFER_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/logsurfer
 endef
 
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-
-define LOGSURFER_INSTALL_TARGET_MAN
-	$(INSTALL) -D -m 0644 $(@D)/man/logsurfer.1 \
-		$(TARGET_DIR)/usr/man/man1/logsurfer.1
-	$(INSTALL) -D -m 0644 $(@D)/man/logsurfer.conf.4 \
-		$(TARGET_DIR)/usr/man/man4/logsurfer.conf.4
-endef
-
-LOGSURFER_POST_INSTALL_TARGET_HOOKS += LOGSURFER_INSTALL_TARGET_MAN
-
-endif
-
 $(eval $(autotools-package))
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -29,7 +29,7 @@ NCURSES_CONF_OPT = \
 	--enable-overwrite \
 	--enable-pc-files \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
-	$(if $(BR2_HAVE_DOCUMENTATION),,--without-manpages)
+	--without-manpages
 
 # Install after busybox for the full-blown versions
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -44,9 +44,7 @@ else
 endif
 
 # Docs
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-	NETSNMP_CONF_OPT += --disable-manuals
-endif
+NETSNMP_CONF_OPT += --disable-manuals
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 	NETSNMP_CONF_OPT += --disable-mib-loading
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -12,7 +12,7 @@ OPENCV_INSTALL_STAGING = YES
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
 	-DBUILD_WITH_STATIC_CRT=OFF                                  \
-	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF)          \
+	-DBUILD_DOCS=OFF                                             \
 	-DBUILD_EXAMPLES=OFF                                         \
 	-DBUILD_PACKAGE=OFF                                          \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
@@ -161,12 +161,10 @@ OPENCV_CONF_OPT += -DWITH_V4L=OFF
 endif
 
 # Installation hooks:
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 define OPENCV_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
 endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
-endif
 
 define OPENCV_CLEAN_INSTALL_CMAKE
 	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -91,10 +91,6 @@ define PERL_INSTALL_STAGING_CMDS
 endef
 
 PERL_INSTALL_TARGET_GOALS = install.perl
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-PERL_INSTALL_TARGET_GOALS += install.man
-endif
-
 
 define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -12,8 +12,6 @@ PPPD_LICENSE_FILES = pppd/tdb.c pppd/plu
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
-PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
-PPPD_RADIUS_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),pppd-radattr pppd-radius)
 PPPD_RADIUS_CONF = dictionary dictionary.ascend dictionary.compat \
 			dictionary.merit dictionary.microsoft \
 			issue port-id-map realms server radiusclient.conf
@@ -65,10 +63,6 @@ define PPPD_INSTALL_RADIUS
 		$(TARGET_DIR)/etc/ppp/radius/radiusclient.conf
 	$(SED) 's:/etc/radiusclient:/etc/ppp/radius:g' \
 		$(TARGET_DIR)/etc/ppp/radius/*
-	for m in $(PPPD_RADIUS_MANPAGES); do \
-		$(INSTALL) -m 644 -D $(PPPD_DIR)/pppd/plugins/radius/$$m.8 \
-			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
 endef
 endif
 
@@ -96,10 +90,6 @@ define PPPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
 	$(PPPD_INSTALL_RADIUS)
-	for m in $(PPPD_MANPAGES); do \
-		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
-			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
 endef
 
 $(eval $(generic-package))
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -15,7 +15,7 @@ PULSEAUDIO_CONF_OPT = \
 	--disable-default-build-tests \
 	--disable-legacy-runtime-dir \
 	--disable-legacy-database-entry-format \
-	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-manpages)
+	--disable-manpages
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool json-c libsndfile speex host-intltool \
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -82,13 +82,11 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
 	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
 endef
 
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 define PYTHON_PYGAME_REMOVE_DOC
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
 endef
 
 PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
-endif
 
 define PYTHON_PYGAME_REMOVE_TESTS
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -157,10 +157,8 @@ endif
 SAMBA_CONF_OPT += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
 
 ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
 endif
-endif
 
 define SAMBA_INSTALL_INITSCRIPTS_CONFIG
 	# install start/stop script
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -20,8 +20,7 @@ UDISKS_DEPENDENCIES = 	\
 	lvm2		\
 	libatasmart
 
-UDISKS_CONF_OPT = --disable-remote-access \
-	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-man-pages)
+UDISKS_CONF_OPT = --disable-remote-access --disable-man-pages
 
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPT += --enable-lvm2
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -15,15 +15,9 @@ VALA_LICENSE_FILES = COPYING
 VALA_DEPENDENCIES = host-flex host-bison libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-# If we want the documentation, then xsltproc is needed. If we don't
-# want the documentation, force Vala to not use the host xsltproc even
-# if available, because it may or may not work with Vala documentation
-# (some versions of xsltproc segfault)
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-VALA_DEPENDENCIES += host-libxslt
-else
+# Force Vala to not use the host xsltproc even if available, because it may or
+# may not work with Vala documentation (some versions of xsltproc segfault)
 VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
-endif
 
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -42,9 +42,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
-endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -10,7 +10,7 @@ XPROTO_XCMISCPROTO_SITE = http://xorg.fr
 XPROTO_XCMISCPROTO_LICENSE = MIT
 XPROTO_XCMISCPROTO_LICENSE_FILES = COPYING
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
-XPROTO_XCMISCPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
+XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
 HOST_XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -10,7 +10,7 @@ XPROTO_XEXTPROTO_SITE = http://xorg.free
 XPROTO_XEXTPROTO_LICENSE = MIT
 XPROTO_XEXTPROTO_LICENSE_FILES = COPYING
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
-XPROTO_XEXTPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
+XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
 HOST_XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
 
 $(eval $(autotools-package))
