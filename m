From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 29 Mar 2015 18:59:20 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: bump version to 9.10.0
Message-ID: <1427648360-122766-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes:

Patches:
  - 0002 not needed anymore, upstream changed
  - 0003 not needed anymore, merged in upstream
  - 0004 renamed to 0002
  - 0005 renamed to 0003
  - 0006 not needed anymore, upstream changed
  - 0007 not needed anymore, merged in upstream
  - new patch: 0004 uclibc compatibility

Other:
  - libdnet is now required, thus toolchain IPv6 support is mandatory
  - compiled with openssl support if package present (like libfuse)

 package/openvmtools/0002-network_script.patch      |   21 -----------
 ...gs_werror.patch => 0002-no_cflags_werror.patch} |    0
 .../0003-conditionally-define-g_info.patch         |   28 ---------------
 ...pflags.patch => 0003-dont-force-cppflags.patch} |    0
 .../openvmtools/0004-uclibc_secure_getenv.patch    |   18 ++++++++++
 package/openvmtools/0006-ip_route_config.patch     |   27 --------------
 package/openvmtools/0007-sizeof_argument.patch     |   18 ----------
 package/openvmtools/Config.in                      |   18 +++-------
 package/openvmtools/openvmtools.hash               |    6 ++--
 package/openvmtools/openvmtools.mk                 |   37 ++++++++++----------
 10 files changed, 44 insertions(+), 129 deletions(-)
 delete mode 100644 package/openvmtools/0002-network_script.patch
 rename package/openvmtools/{0004-no_cflags_werror.patch => 0002-no_cflags_werror.patch} (100%)
 delete mode 100644 package/openvmtools/0003-conditionally-define-g_info.patch
 rename package/openvmtools/{0005-dont-force-cppflags.patch => 0003-dont-force-cppflags.patch} (100%)
 create mode 100644 package/openvmtools/0004-uclibc_secure_getenv.patch
 delete mode 100644 package/openvmtools/0006-ip_route_config.patch
 delete mode 100644 package/openvmtools/0007-sizeof_argument.patch

diff --git a/package/openvmtools/0002-network_script.patch b/package/openvmtools/0002-network_script.patch
deleted file mode 100644
index 67705cc..0000000
--- a/package/openvmtools/0002-network_script.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-scripts/linux/network: exit normally if no network control script
-
-When using suspend/resume from the hypervisor, openvmtools checks for the
-networking script, and exists with an error if not found, making the hypervisor
-raise a warning message. This workaround silences that error message.
-
-Signed-off-by: Karoly Kasza <kaszak@gmail.com>
-
---- open-vm-tools-9.4.6-1770165.orig/scripts/linux/network	2014-07-02 00:21:14.000000000 +0200
-+++ open-vm-tools-9.4.6-1770165/scripts/linux/network	2014-08-07 16:34:21.963514273 +0200
-@@ -88,7 +88,9 @@
- run_network_script()
- {
-    script=`find_networking_script`
--   [ "$script" != "error" ] || Panic "Cannot find system networking script."
-+#   [ "$script" != "error" ] || Panic "Cannot find system networking script."
-+# Modified for buildroot
-+   [ "$script" != "error" ] || exit 0
- 
-    # Using SysV "service" if it exists, otherwise fall back to run the script directly
-    service=`which service 2>/dev/null`
diff --git a/package/openvmtools/0004-no_cflags_werror.patch b/package/openvmtools/0002-no_cflags_werror.patch
similarity index 100%
rename from package/openvmtools/0004-no_cflags_werror.patch
rename to package/openvmtools/0002-no_cflags_werror.patch
diff --git a/package/openvmtools/0003-conditionally-define-g_info.patch b/package/openvmtools/0003-conditionally-define-g_info.patch
deleted file mode 100644
index fa35f29..0000000
--- a/package/openvmtools/0003-conditionally-define-g_info.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-conditionally define g_info
-
-glib also defines a g_info macro since 2.39.2, conflicting with the one in
-openvmtools:
-
-https://git.gnome.org/browse/glib/commit/?h=glib-2-40&id=36f1a4ce7ed6df6aa8
-
-Patch from Fedora:
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1063847
-http://pkgs.fedoraproject.org/cgit/open-vm-tools.git/tree/g_info_redefine.patch
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-diff -uNr open-vm-tools-9.4.0-1280544.orig/lib/include/vmware/tools/log.h open-vm-tools-9.4.0-1280544/lib/include/vmware/tools/log.h
---- open-vm-tools-9.4.0-1280544.orig/lib/include/vmware/tools/log.h	2013-09-23 19:51:10.000000000 +0400
-+++ open-vm-tools-9.4.0-1280544/lib/include/vmware/tools/log.h	2014-02-18 10:56:50.368604176 +0400
-@@ -134,7 +134,9 @@
-  *******************************************************************************
-  */
- 
--#define g_info(fmt, ...) g_log(G_LOG_DOMAIN, G_LOG_LEVEL_INFO, fmt, ## __VA_ARGS__)
-+#if !defined(g_info)
-+#  define g_info(fmt, ...) g_log(G_LOG_DOMAIN, G_LOG_LEVEL_INFO, fmt, ## __VA_ARGS__)
-+#endif
- 
- 
- /*
diff --git a/package/openvmtools/0005-dont-force-cppflags.patch b/package/openvmtools/0003-dont-force-cppflags.patch
similarity index 100%
rename from package/openvmtools/0005-dont-force-cppflags.patch
rename to package/openvmtools/0003-dont-force-cppflags.patch
diff --git a/package/openvmtools/0004-uclibc_secure_getenv.patch b/package/openvmtools/0004-uclibc_secure_getenv.patch
new file mode 100644
index 0000000..28cfdc4
--- /dev/null
+++ b/package/openvmtools/0004-uclibc_secure_getenv.patch
@@ -0,0 +1,18 @@
+lib/misc/idLinux.c: add uClibc support
+
+uClibc does not have a secure_getenv function, so we use the
+Android method.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- open-vm-tools-9.10.0-2476743.orig/lib/misc/idLinux.c	2015-03-29 12:19:30.776922510 +0200
++++ open-vm-tools-9.10.0-2476743/lib/misc/idLinux.c	2015-03-29 12:30:30.000000000 +0200
+@@ -997,7 +997,7 @@
+ static Bool
+ IdIsSetUGid(void)
+ {
+-#if defined(__ANDROID__)
++#if defined(__ANDROID__) || defined(__UCLIBC__)
+    /* Android does not have a secure_getenv, so be conservative. */
+    return TRUE;
+ #else
diff --git a/package/openvmtools/0006-ip_route_config.patch b/package/openvmtools/0006-ip_route_config.patch
deleted file mode 100644
index 2396413..0000000
--- a/package/openvmtools/0006-ip_route_config.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Patch from Fedora:
-
-http://pkgs.fedoraproject.org/cgit/open-vm-tools.git/commit/?id=f86513592cdc468f9af24c7ed29daae48e2cd26e
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-
---- open-vm-tools-9.4.6-1770165/configure.ac.orig	2015-02-03 18:42:39.431466158 -0800
-+++ open-vm-tools-9.4.6-1770165/configure.ac	2015-02-03 18:43:15.338468630 -0800
-@@ -1032,7 +1032,7 @@
- AM_CONDITIONAL(HAVE_GNU_LD, test "$with_gnu_ld" = "yes")
- AM_CONDITIONAL(HAVE_GTKMM, test "$have_x" = "yes" -a "$with_gtkmm" = "yes")
- AM_CONDITIONAL(HAVE_PAM, test "$with_pam" = "yes")
--AM_CONDITIONAL(USE_SLASH_PROC, test "os" = "linux" -a "$have_glib_2_14" = "yes")
-+AM_CONDITIONAL(USE_SLASH_PROC, test "$os" = "linux" -a "$have_glib_2_14" = "yes")
- AM_CONDITIONAL(USE_PRINTF_WRAPPERS, test "$bsdPrintfWrappers" = "yes")
- 
- if test "$have_xsm" != "yes"; then
---- open-vm-tools-9.4.6-1770165/services/plugins/guestInfo/getlib/Makefile.am.orig	2015-02-03 18:48:55.528772952 -0800
-+++ open-vm-tools-9.4.6-1770165/services/plugins/guestInfo/getlib/Makefile.am	2015-02-03 18:52:51.597199001 -0800
-@@ -28,4 +28,6 @@
- libGuestInfo_la_CPPFLAGS += -I$(srcdir)/..
- 
- AM_CFLAGS = $(DNET_CPPFLAGS)
--
-+if USE_SLASH_PROC
-+AM_CFLAGS += -DUSE_SLASH_PROC
-+endif
diff --git a/package/openvmtools/0007-sizeof_argument.patch b/package/openvmtools/0007-sizeof_argument.patch
deleted file mode 100644
index ec2a3f6..0000000
--- a/package/openvmtools/0007-sizeof_argument.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Patch from Fedora:
-
-http://pkgs.fedoraproject.org/cgit/open-vm-tools.git/commit/sizeof_argument.patch?id=3031fb5279096189aeb50d197b02313c12d701f3
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-
---- open-vm-tools-9.4.6-1770165.orig/lib/syncDriver/syncDriverPosix.c	2014-07-15 13:42:21.043818478 -0700
-+++ open-vm-tools-9.4.6-1770165/lib/syncDriver/syncDriverPosix.c	2014-07-15 13:55:41.724103304 -0700
-@@ -72,8 +72,7 @@
-    size_t i;
- 
-    for (i = 0; i < ARRAYSIZE(gRemoteFSTypes); i++) {
--      if (Str_Strncmp(fsType, gRemoteFSTypes[i],
--                      sizeof gRemoteFSTypes[i]) == 0) {
-+      if (Str_Strcmp(gRemoteFSTypes[i], fsType) == 0) {
-          return TRUE;
-       }
-    }
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 5fc6977..7207926 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -3,17 +3,19 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_INET_IPV6 # libdnet
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBDNET
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
 	  http://open-vm-tools.sourceforge.net/
 
-	  ICU locales and X11 tools are currently not supported.
+	  ICU locales, Xerces, and X11 tools are currently not supported.
 
 	  NOTE: Support for vmblock-fuse will be enabled in openvmtools if the
 		libfuse package is selected.
@@ -30,16 +32,6 @@ config BR2_PACKAGE_OPENVMTOOLS_PROCPS
 comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
-config BR2_PACKAGE_OPENVMTOOLS_DNET
-	bool "dnet support"
-	depends on BR2_INET_IPV6
-	select BR2_PACKAGE_LIBDNET
-	help
-	  Enable support for libdnet / nicinfo
-
-comment "dnet support needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
 	select BR2_PACKAGE_LINUX_PAM
@@ -54,8 +46,8 @@ comment "PAM support needs a toolchain w/ dynamic library"
 
 endif
 
-comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
+comment "openvmtools needs a toolchain w/ wchar, IPv6, threads, RPC, largefile, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || \
 	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE || !BR2_ENABLE_LOCALE
diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
index 98b5438..80eb99f 100644
--- a/package/openvmtools/openvmtools.hash
+++ b/package/openvmtools/openvmtools.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools/stable-9.4.x/
-md5	3969daf1535d34e1c5f0c87a779b7642	open-vm-tools-9.4.6-1770165.tar.gz
-sha1	5d862148167cb0a56219d018e7d8d965118e1dde	open-vm-tools-9.4.6-1770165.tar.gz
+# From http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools/stable-9.10.0/
+md5	d19439b499f0cbc7001e0cc65aa1a5a7	open-vm-tools-9.10.0-2476743.tar.gz
+sha1	5954c2a3eb66f7ffe4be1861f3bf6b43a2b3c6fc	open-vm-tools-9.10.0-2476743.tar.gz
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index f8230b2..a3bcf06 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,16 +4,19 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = 9.4.6-1770165
+OPENVMTOOLS_VERSION = 9.10.0-2476743
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
-OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.10.0
 OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
-# Autoreconf needed because package is distributed without a configure script
-# See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
+# Autoreconf needed or config/missing will run configure again@buildtime
 OPENVMTOOLS_AUTORECONF = YES
-OPENVMTOOLS_CONF_OPTS = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
-OPENVMTOOLS_DEPENDENCIES = libglib2
+OPENVMTOOLS_CONF_OPTS = --with-dnet \
+	--without-icu --without-x --without-gtk2 \
+	--without-gtkmm --without-kernel-modules \
+	--disable-deploypkg --without-xerces
+OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
+OPENVMTOOLS_DEPENDENCIES = libglib2 libdnet
 
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
@@ -21,26 +24,21 @@ ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 OPENVMTOOLS_DEPENDENCIES += libfuse
 endif
 
+# If found openssl, build openvmtools with support for it
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENVMTOOLS_DEPENDENCIES += openssl
+else
+OPENVMTOOLS_CONF_OPTS += --without-ssl
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
-# Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is used by default.
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
-	CUSTOM_PROCPS_LIBS=" "
 OPENVMTOOLS_CONF_OPTS += --with-procps
+OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
 OPENVMTOOLS_CONF_OPTS += --without-procps
 endif
 
-ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
-# Needed because if it is defined configure will
-# use a different method to check for dnet
-OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
-OPENVMTOOLS_CONF_OPTS += --with-dnet
-OPENVMTOOLS_DEPENDENCIES += libdnet
-else
-OPENVMTOOLS_CONF_OPTS += --without-dnet
-endif
-
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
 OPENVMTOOLS_CONF_OPTS += --with-pam
 OPENVMTOOLS_DEPENDENCIES += linux-pam
@@ -49,6 +47,7 @@ OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
+# defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
 define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
 	ln -fs os-release $(TARGET_DIR)/etc/lfs-release
-- 
1.7.10.4
