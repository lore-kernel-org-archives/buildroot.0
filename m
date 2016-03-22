From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:03:46 +0100
Subject: [Buildroot] [git commit] libglib2: bump to version 2.48.0
Message-ID: <20160322220428.B4C2D801EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f9e70c333975bb76b3bc976444268dfad932ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to system/unbundled pcre since it's the default and recommended
by upstream now.
It's also good security practice since pcre patches won't get updated in
the bundled version inside glib so often.

As stated in glib's NEWS:

Overview of changes in GLib 2.47.5

* the system copy of PCRE is now used by default to implement GRegex.
  Configure with --with-pcre=internal if a system PCRE version
  is unavailable or undesired.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/Config.in     |  3 ++-
 package/libglib2/libglib2.hash |  4 ++--
 package/libglib2/libglib2.mk   | 24 ++++++++++++------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 7cbfea5..84ee816 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
-	select BR2_PACKAGE_PCRE_UCP if BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 7bce911..60d0352 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.46/glib-2.46.2.sha256sum
-sha256  5031722e37036719c1a09163cc6cf7c326e4c4f1f1e074b433c156862bd733db  glib-2.46.2.tar.xz
+# https://download.gnome.org/sources/glib/2.48/glib-2.48.0.sha256sum
+sha256  744be6931ca914c68af98dc38ff6b0cf8381d65e335060faddfbf04c17147c34  glib-2.48.0.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 09cdd87..fe303a7 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.46
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.48
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
@@ -97,11 +97,18 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-libelf \
 	--disable-selinux \
 	--disable-systemtap \
-	--disable-xattr
+	--disable-xattr \
+	--with-pcre=system
 
-LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
+LIBGLIB2_DEPENDENCIES = \
+	host-pkgconf host-libglib2 host-gettext \
+	libffi pcre zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib host-gettext
+HOST_LIBGLIB2_DEPENDENCIES = \
+	host-gettext host-libffi host-pcre host-pkgconf host-zlib
+
+LIBGLIB2_CONF_OPTS = \
+	--with-pcre=system
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
@@ -119,13 +126,6 @@ LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-LIBGLIB2_CONF_OPTS += --with-pcre=system
-LIBGLIB2_DEPENDENCIES += pcre
-else
-LIBGLIB2_CONF_OPTS += --with-pcre=internal
-endif
-
 # Purge gdb-related files
 ifneq ($(BR2_PACKAGE_GDB),y)
 define LIBGLIB2_REMOVE_GDB_FILES
