From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 17:00:12 +0100
Subject: [Buildroot] [git commit] ncurses: remove
	BR2_PACKAGE_NCURSES_TARGET_{FORM, MENU, PANEL} options
Message-ID: <20170226160017.D2CAA82138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c5946acc24a36f9dff079edd054d948c69434f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ncurses sub-options BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL}
are currently very badly broken: they only control whether the
libform, libmenu and libpanel libraries are installed in
$(TARGET_DIR), but do absolutely nothing about their installation in
$(STAGING_DIR).

This means that when one of those options is disabled, the
corresponding library is indeed not installed in the target, but is
available in staging. It can therefore be detected by the configure
script of another package and used... even though the library will not
be in the target, causing a runtime failure.

Internally, ncurses.mk uses the "make install" logic of ncurses for
the staging installation, but uses a completely hand-written logic for
the target installation, which is the reason for this
desynchronization between what's installed in staging and target.

When BR2_PACKAGE_NCURSES_WCHAR=y, this also causes some build
failures. Indeed, when BR2_PACKAGE_NCURSES_WCHAR=y, Buildroot creates
some symbolic links lib<foo>.so -> lib<foo>w.so in staging and target,
but only for the lib<foo> that have been enabled by
BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL}. Due to this, a package
that for example needed the libmenu library but forgot to select
BR2_PACKAGE_NCURSES_TARGET_MENU was:

 - Building fine with BR2_PACKAGE_NCURSES_WCHAR disabled (because
   libmenu.so exists in staging), but would fail to run at runtime
   because libmenu.so is not in the target.

 - Fail to build with BR2_PACKAGE_NCURSES_WCHAR=y because only
   libmenuw.so exists, and not the libmenu.so symbolic link.

Since those libraries are small (43K for libform, 21K for libmenu and
8.2K for libpanel), this commit takes the very simple approach of
removing those options, and installing the libraries
unconditionally. It therefore uses the "make install" logic for both
the staging *and* target installation.

In detail, this commit:

 - Removes the NCURSES_PROGS variable, not needed since
   --without-progs already allows to disable the build and
   installation of programs.

 - Removes the NCURSES_LIBS-y variable, and replaces it with a single
   unconditional assignement to NCURSES_LIBS, only used to create the
   lib<foo>w.so -> lib<foo>.so symbolic links when wchar support is
   enabled.

 - Removes NCURSES_INSTALL_TARGET_CMDS and the functions it was
   calling: NCURSES_INSTALL_TARGET_LIBS and
   NCURSES_INSTALL_TARGET_PROGS.

 - Adds a NCURSES_TARGET_SYMLINK_RESET hook to create the reset ->
   tset symbolic link, as was done before.

 - Adds a NCURSES_TARGET_CLEANUP_TERMINFO to cleanup the terminfo
   files in the target, so that we stay in the same situation in terms
   of installed terminfo files.

 - Removes the BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL} options
   from the Config.in files: both their definition and usage.

 - Simplifies all the symlink dance for lib<foo> -> lib<foo>w, because
   as Yann E. Morin suggested, this dance is only needed in staging, not
   in the target. Once binaries have been built, they refer to the
   SONAME of the library, which is the lib<foo>w variant (for shared
   linking). For static linking and .pc files, it's obvious that we
   don't care about them on the target. Therefore the
   NCURSES_LINK_LIBS_STATIC, NCURSES_LINK_LIBS_SHARED and
   NCURSES_LINK_PC functions no longer take any argument: they always
   apply to STAGING_DIR only. NCURSES_LINK_TARGET_LIBS is removed.

It is worth mentioning that adding Config.in.legacy support is *NOT*
necessary. Indeed:

 - If they were disabled before this patch, having them in
   Config.in.legacy would not trigger the legacy warning.

 - If they were enabled before this patch, then the behavior is
   unchanged: all libraries are now unconditionally installed. So
   there is no point in warning the user.

We double-checked the installed size of a filesystem containing just
ncurses before and after this patch, and the only folder that has its
size changed is /usr/lib, growing from 852 KB to 932 KB in the wchar
enabled case. That's a 80 KB system size increase.

This commit fixes the sngrep build failure and potentially numerous
runtime issues with ncurses.

Fixes:

  http://autobuild.buildroot.net/results/7b5db21a6c568e6c6c8fe2b5d5a2f5ca24df510c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in |  3 --
 package/iprutils/Config.in   |  3 --
 package/iptraf-ng/Config.in  |  1 -
 package/kismet/Config.in     |  1 -
 package/ncurses/Config.in    | 15 ----------
 package/ncurses/ncurses.mk   | 65 ++++++++++++++------------------------------
 package/nload/Config.in      |  1 -
 package/samba4/samba4.mk     |  2 +-
 8 files changed, 22 insertions(+), 69 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index b58e658..adc0aab 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -34,9 +34,6 @@ config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_TARGET_PANEL
-	select BR2_PACKAGE_NCURSES_TARGET_FORM
-	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	depends on BR2_USE_WCHAR
 	default y
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index 42f372c..b429e71 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_IPRUTILS
 	bool "iprutils"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_TARGET_PANEL
-	select BR2_PACKAGE_NCURSES_TARGET_FORM
-	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
 	depends on BR2_USE_MMU # fork()
diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index 5574cfa..5afb81d 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_IPTRAF_NG
 	bool "iptraf-ng"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	help
 	  IPTraf-ng is a ncurses-based network monitoring utility. It gathers
 	  data like TCP connection packet and byte counts, interface statistics
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 7265c63..ab91c0e 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_KISMET
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNL
 	help
diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 44713f9..92be164 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -18,21 +18,6 @@ config BR2_PACKAGE_NCURSES_WCHAR
 	help
 	  Enable wide char & UTF-8 support in ncurses libraries
 
-config BR2_PACKAGE_NCURSES_TARGET_PANEL
-	bool "ncurses libpanel in target"
-	help
-	  Includes ncurses dynamic libpanel in target
-
-config BR2_PACKAGE_NCURSES_TARGET_FORM
-	bool "ncurses libform in target"
-	help
-	  Includes ncurses dynamic libform in target
-
-config BR2_PACKAGE_NCURSES_TARGET_MENU
-	bool "ncurses libmenu in target"
-	help
-	  Includes ncurses dynamic libmenu in target
-
 config BR2_PACKAGE_NCURSES_TARGET_PROGS
 	bool "ncurses programs"
 	help
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 343909f..9d1b75d 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -8,7 +8,6 @@ NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
-NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)$(NCURSES_ABI_VERSION)-config
@@ -50,11 +49,6 @@ else
 NCURSES_CONF_OPTS += --without-gpm
 endif
 
-NCURSES_LIBS-y = ncurses
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += menu
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
-
 NCURSES_TERMINFO_FILES = \
 	a/ansi \
 	l/linux \
@@ -73,38 +67,36 @@ NCURSES_TERMINFO_FILES = \
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
+NCURSES_LIBS = ncurses menu panel form
 
 define NCURSES_LINK_LIBS_STATIC
-	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
-		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(1)/usr/lib/$(lib).a
+	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
+		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(STAGING_DIR)/usr/lib/$(lib).a
 	)
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
-		$(1)/usr/lib/libcurses.a
+		$(STAGING_DIR)/usr/lib/libcurses.a
 endef
 
 define NCURSES_LINK_LIBS_SHARED
-	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
-		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(1)/usr/lib/$(lib).so
+	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
+		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(STAGING_DIR)/usr/lib/$(lib).so
 	)
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
-		$(1)/usr/lib/libcurses.so
+		$(STAGING_DIR)/usr/lib/libcurses.so
 endef
 
 define NCURSES_LINK_PC
-	$(foreach pc,$(NCURSES_LIBS-y), \
+	$(foreach pc,$(NCURSES_LIBS), \
 		ln -sf $(pc)$(NCURSES_LIB_SUFFIX).pc \
-			$(1)/usr/lib/pkgconfig/$(pc).pc
+			$(STAGING_DIR)/usr/lib/pkgconfig/$(pc).pc
 	)
 endef
 
-NCURSES_LINK_TARGET_LIBS = \
-	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR));) \
-	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(TARGET_DIR)))
 NCURSES_LINK_STAGING_LIBS = \
-	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR));) \
-	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC);) \
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED))
 
-NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
+NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC)
 
 NCURSES_CONF_OPTS += --enable-ext-colors
 NCURSES_ABI_VERSION = 6
@@ -132,36 +124,21 @@ define NCURSES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
-ifneq ($(BR2_STATIC_LIBS),y)
-define NCURSES_INSTALL_TARGET_LIBS
-	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
-		cp -dpf $(NCURSES_DIR)/lib/$(lib)$(NCURSES_LIB_SUFFIX).so* \
-			$(TARGET_DIR)/usr/lib/
-	)
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
-define NCURSES_INSTALL_TARGET_PROGS
-	$(foreach prog,$(NCURSES_PROGS), \
-		$(INSTALL) -m 0755 $(NCURSES_DIR)/progs/$(prog) \
-			$(TARGET_DIR)/usr/bin/$(prog)
-	)
+define NCURSES_TARGET_SYMLINK_RESET
 	ln -sf tset $(TARGET_DIR)/usr/bin/reset
 endef
+NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_TARGET_SYMLINK_RESET
 endif
 
-define NCURSES_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	$(NCURSES_INSTALL_TARGET_LIBS)
-	$(NCURSES_LINK_TARGET_LIBS)
-	$(NCURSES_INSTALL_TARGET_PROGS)
-	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
-	$(foreach terminfo,$(NCURSES_TERMINFO_FILES),\
-		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/terminfo/$(terminfo) \
-			$(TARGET_DIR)/usr/share/terminfo/$(terminfo)
+define NCURSES_TARGET_CLEANUP_TERMINFO
+	$(RM) -rf $(TARGET_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/share/tabset
+	$(foreach t,$(NCURSES_TERMINFO_FILES), \
+		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/terminfo/$(t) \
+			$(TARGET_DIR)/usr/share/terminfo/$(t)
 	)
-endef # NCURSES_INSTALL_TARGET_CMDS
+endef
+NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_TARGET_CLEANUP_TERMINFO
 
 #
 # On systems with an older version of tic, the installation of ncurses hangs
diff --git a/package/nload/Config.in b/package/nload/Config.in
index 68ddbe6..c938d8e 100644
--- a/package/nload/Config.in
+++ b/package/nload/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_NLOAD
 	bool "nload"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	help
 	  nload is a console application which monitors network traffic
 	  and bandwidth usage in real time. It visualizes the in- and
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4020caa..f64b684 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -59,7 +59,7 @@ else
 SAMBA4_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
+ifeq ($(BR2_PACKAGE_NCURSES),y)
 SAMBA4_CONF_ENV += NCURSES_CONFIG="$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)"
 SAMBA4_DEPENDENCIES += ncurses
 else
