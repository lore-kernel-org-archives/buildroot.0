From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Jan 2021 13:42:12 -0600
Subject: [Buildroot] [RFC 2/2] flatpak: new package
In-Reply-To: <20210126194212.20688-1-matthew.weber@rockwellcollins.com>
References: <20210126194212.20688-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210126194212.20688-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Flatpak is a system for building, distributing, and running sandboxed desktop
applications on Linux.

DO NOT MERGE, this patch is being provided as an example that was used
for some prototyping that wasn't completed.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                             |  1 +
 ...ve-quirks-in-autotools-setup-process.patch | 53 +++++++++++
 ...ECTION-does-not-appear-in-AM_CONDITI.patch | 46 ++++++++++
 package/flatpak/Config.in                     | 36 ++++++++
 package/flatpak/flatpak.hash                  |  3 +
 package/flatpak/flatpak.mk                    | 87 +++++++++++++++++++
 package/flatpak/flatpak.pc.in                 | 16 ++++
 7 files changed, 242 insertions(+)
 create mode 100644 package/flatpak/0001-Remove-quirks-in-autotools-setup-process.patch
 create mode 100644 package/flatpak/0002-Fix-HAVE_INTROSPECTION-does-not-appear-in-AM_CONDITI.patch
 create mode 100644 package/flatpak/Config.in
 create mode 100644 package/flatpak/flatpak.hash
 create mode 100644 package/flatpak/flatpak.mk
 create mode 100644 package/flatpak/flatpak.pc.in

diff --git a/package/Config.in b/package/Config.in
index 735c080989..9db8ef10da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2428,6 +2428,7 @@ menu "System tools"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
+	source "package/flatpak/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
diff --git a/package/flatpak/0001-Remove-quirks-in-autotools-setup-process.patch b/package/flatpak/0001-Remove-quirks-in-autotools-setup-process.patch
new file mode 100644
index 0000000000..69e3c886bd
--- /dev/null
+++ b/package/flatpak/0001-Remove-quirks-in-autotools-setup-process.patch
@@ -0,0 +1,53 @@
+From e2bba019451770372b51b1eabcea078454d4de38 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Fri, 7 Dec 2018 00:16:42 -0800
+Subject: [PATCH 1/2] Remove quirks in autotools setup process
+
+The autogen.sh script ordinarily creates the gtk-doc.make file. The configure.ac
+file has an error, the po/Makefile.in is written twice in the array, which
+causes a configure-time error. This patch creates the gtk-doc.make file and
+removes the duplicate makefile array entry.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ .gitignore   | 1 -
+ configure.ac | 1 -
+ gtk-doc.make | 2 ++
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+ create mode 100644 gtk-doc.make
+
+diff --git a/.gitignore b/.gitignore
+index 7d643205..310c332d 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -29,7 +29,6 @@ missing
+ stamp-h1
+ config.h.in
+ stamp-*
+-gtk-doc.make
+ flatpak
+ flatpak-*.tar.xz
+ flatpak-session-helper
+diff --git a/configure.ac b/configure.ac
+index 91f9b826..21f3cf38 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -436,7 +436,6 @@ flatpak.pc
+ common/flatpak-version-macros.h
+ doc/reference/version.xml
+ doc/flatpak-docs.xml
+-po/Makefile.in
+ ])
+ AC_OUTPUT
+ 
+diff --git a/gtk-doc.make b/gtk-doc.make
+new file mode 100644
+index 00000000..14f18fd4
+--- /dev/null
++++ b/gtk-doc.make
+@@ -0,0 +1,2 @@
++EXTRA_DIST =
++CLEANFILES =
+-- 
+2.18.1
+
diff --git a/package/flatpak/0002-Fix-HAVE_INTROSPECTION-does-not-appear-in-AM_CONDITI.patch b/package/flatpak/0002-Fix-HAVE_INTROSPECTION-does-not-appear-in-AM_CONDITI.patch
new file mode 100644
index 0000000000..fa4b2a5d40
--- /dev/null
+++ b/package/flatpak/0002-Fix-HAVE_INTROSPECTION-does-not-appear-in-AM_CONDITI.patch
@@ -0,0 +1,46 @@
+From 983639ae3d607893653deaaea834cea37b5df5f9 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Fri, 7 Dec 2018 00:20:31 -0800
+Subject: [PATCH 2/2] Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+
+This is a fix for HAVE_INTROSPECTION related errors derived from a fix
+originally submitted to the Buildroot project by the author:
+
+Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+Apply the fix to the same issue in Flatpak:
+
+During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolved because we
+don't have introspection which provides its custom m4 macro. Reconfigure fails
+with:
+
+gdk/Makefile.am:196: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+gtk/Makefile.am:1347: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+
+We avoid to add a copy of introspection.m4 in the m4 directory of libgtk3 by
+adding a check, as performed in Systemd.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 21f3cf38..2be0d3a2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -316,7 +316,10 @@ if test x$enable_documentation = xyes; then
+ fi
+ AM_CONDITIONAL(BUILD_DOCUMENTATION, test x$enable_documentation = xyes)
+ 
+-GOBJECT_INTROSPECTION_CHECK([1.40.0])
++m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
++         [GOBJECT_INTROSPECTION_CHECK(1.40.0)],
++         [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
++          enable_introspection=no])
+ 
+ # gtkdocize greps for ^GTK_DOC_CHECK, so we need to put it on its own line
+ m4_ifdef([GTK_DOC_CHECK], [
+-- 
+2.18.1
+
diff --git a/package/flatpak/Config.in b/package/flatpak/Config.in
new file mode 100644
index 0000000000..714cffbcb8
--- /dev/null
+++ b/package/flatpak/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_FLATPAK
+	bool "flatpak"
+	depends on !BR2_STATIC_LIBS # ostree, libfuse
+	depends on !BR2_TOOLCHAIN_USES_MUSL # ostree
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ostree, glib2
+	depends on BR2_USE_MMU # ostree, e2fsprogs, libfuse, libgpgme, glib2
+	depends on BR2_USE_WCHAR # ostree, glib2
+	select BR2_PACKAGE_APPSTREAM_GLIB
+	select BR2_PACKAGE_GDK_PIXBUF # appstream-glib
+	select BR2_PACKAGE_JSON_GLIB # appstream-glib
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBGLIB2 # json-glib appstream-glib
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBOSTREE
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBYAML # appstream-glib
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XORGPROTO # libXau
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS # libXau
+	help
+	  Flatpak is a system for building, distributing, and running sandboxed
+	  desktop applications on Linux.
+
+	  https://github.com/flatpak/flatpak
+
+comment "flatpak needs a toolchain w/ C++, threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+	  || !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL \
+	  || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
diff --git a/package/flatpak/flatpak.hash b/package/flatpak/flatpak.hash
new file mode 100644
index 0000000000..06a4a9cbb7
--- /dev/null
+++ b/package/flatpak/flatpak.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 c45ad363d34b23a1a46e706593eeb61dcb5d6dadb0f5a4db4926ba9b89c6d447  flatpak-1.0.6.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/flatpak/flatpak.mk b/package/flatpak/flatpak.mk
new file mode 100644
index 0000000000..ce8f6f3aff
--- /dev/null
+++ b/package/flatpak/flatpak.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# flatpak
+#
+################################################################################
+
+FLATPAK_VERSION = 1.0.6
+FLATPAK_SITE = https://github.com/flatpak/flatpak
+FLATPAK_SITE_METHOD = git
+FLATPAK_GIT_SUBMODULES = YES
+
+FLATPAK_AUTORECONF = YES
+FLATPAK_GETTEXTIZE = YES
+FLATPAK_LICENSE = LGPL-2.1+
+FLATPAK_LICENSE_FILES = COPYING
+
+FLATPAK_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+
+FLATPAK_CONF_OPTS = \
+	--enable-sandboxed-triggers \
+	--enable-xauth \
+	--without-system-bubblewrap \
+	--with-system-helper
+FLATPAK_CONF_ENV += \
+	ac_cv_path_GPGME_CONFIG=$(STAGING_DIR)/usr/bin/gpgme-config \
+	ac_cv_path_GPGERR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
+FLATPAK_DEPENDENCIES = \
+	appstream-glib \
+	host-autoconf \
+	host-automake \
+	host-libtool \
+	host-pkgconf \
+	json-glib \
+	libarchive \
+	libcap \
+	libglib2 \
+	libgpgme \
+	libostree \
+	libsoup \
+	libxml2 \
+	polkit \
+	xlib_libXau \
+	xorgproto \
+	xutil_util-macros
+
+# see autogen.sh in flatpak
+define FLATPAK_TOUCHUP_VENDOR
+	cd $(@D); \
+		sed -e 's,$$(libglnx_srcpath),libglnx,g' <\
+			libglnx/Makefile-libglnx.am >\
+			libglnx/Makefile-libglnx.am.inc; \
+		sed -e 's,$$(bwrap_srcpath),bubblewrap,g' <\
+			bubblewrap/Makefile-bwrap.am >\
+			bubblewrap/Makefile-bwrap.am.inc
+endef
+FLATPAK_PRE_CONFIGURE_HOOKS += FLATPAK_TOUCHUP_VENDOR
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FLATPAK_CONF_OPTS += --with-systemd=/usr/lib/systemd/system \
+	--enable-systemd
+FLATPAK_DEPENDENCIES += systemd
+else
+FLATPAK_CONF_OPTS += --disable-systemd
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+FLATPAK_CONF_OPTS += --enable-dbus
+FLATPAK_DEPENDENCIES += dbus
+else
+FLATPAK_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+FLATPAK_CONF_OPTS += --enable-gnutls
+FLATPAK_DEPENDENCIES += gnutls
+else
+FLATPAK_CONF_OPTS += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+FLATPAK_CONF_OPTS += --enable-seccomp
+FLATPAK_DEPENDENCIES += libseccomp host-pkgconf
+else
+FLATPAK_CONF_OPTS += --disable-seccomp
+endif
+
+$(eval $(autotools-package))
diff --git a/package/flatpak/flatpak.pc.in b/package/flatpak/flatpak.pc.in
new file mode 100644
index 0000000000..382a90a357
--- /dev/null
+++ b/package/flatpak/flatpak.pc.in
@@ -0,0 +1,16 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+datarootdir=@datarootdir@
+datadir=@datadir@
+
+interfaces_dir=${datadir}/dbus-1/interfaces/
+
+Name: flatpak
+Description: Application sandboxing framework
+Version: @PACKAGE_VERSION@
+Requires: glib-2.0 gio-2.0
+Requires.private: gio-unix-2.0 ostree-1
+Libs: -L${libdir} -lflatpak
+Cflags: -I${includedir}/flatpak
\ No newline at end of file
-- 
2.17.1
