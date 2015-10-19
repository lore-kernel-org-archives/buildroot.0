From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 22:10:17 +0200
Subject: [Buildroot] [git commit] gvfs: bump to version 1.26.1.1
Message-ID: <20151019202704.BE18A804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b42aebc3e8c425b1b9aa1bff30615c5e23b1a9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lots of changes, add support for libnfs, udev, libbluray, cleanup afp
support, gtk3, and systemd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/Config.in |    2 +-
 package/gvfs/gvfs.hash |    4 +-
 package/gvfs/gvfs.mk   |   69 +++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 5e01918..44a7521 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GVFS
 	  all applications using the gio API. It also supports exposing
 	  the gvfs mounts to non-gio applications using fuse.
 
-	  http://en.wikipedia.org/wiki/GVFS
+	  https://wiki.gnome.org/action/show/Projects/gvfs
 
 comment "gvfs needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index df21790..cc9e4f6 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.16/gvfs-1.16.2.sha256sum
-sha256	6b0e62d27fe73844efb536689057b762fbce085984800c83395371306ec547f1	gvfs-1.16.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.1.1.sha256sum
+sha256	2dadf986e464db1d7f007b178a5432b30ba93ef0cb31a2795156540d496dc06d	gvfs-1.26.1.1.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 4242e80..e1da18f 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.16
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
+GVFS_VERSION_MAJOR = 1.26
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).1.1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
@@ -17,14 +17,21 @@ GVFS_LICENSE_FILES = COPYING
 # build system from searching the host paths.
 GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 
+# Most of these are missing library support
 GVFS_CONF_OPTS = \
-	--disable-gconf			\
-	--disable-cdda			\
-	--disable-obexftp		\
-	--disable-gphoto2		\
-	--disable-keyring		\
-	--disable-bash-completion	\
-	--disable-hal
+	--disable-afc \
+	--disable-bash-completion \
+	--disable-cdda \
+	--disable-gconf \
+	--disable-gcr \
+	--disable-gdu \
+	--disable-goa \
+	--disable-google \
+	--disable-gphoto2 \
+	--disable-hal \
+	--disable-keyring \
+	--disable-libmtp \
+	--disable-udisks2
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
@@ -33,13 +40,31 @@ else
 GVFS_CONF_OPTS += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GVFS_DEPENDENCIES += udev
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GVFS_DEPENDENCIES += libgudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 GVFS_DEPENDENCIES += libarchive
-GVFS_CONF_OPTS += --enable-archive
+GVFS_CONF_OPTS += \
+	--enable-archive \
+	--with-archive-includes=$(STAGING_DIR)/usr \
+	--with-archive-libs=$(STAGING_DIR)/usr
 else
 GVFS_CONF_OPTS += --disable-archive
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+GVFS_DEPENDENCIES += libbluray
+GVFS_CONF_OPTS += --enable-bluray
+else
+GVFS_CONF_OPTS += --disable-bluray
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 GVFS_DEPENDENCIES += libfuse
 GVFS_CONF_OPTS += --enable-fuse
@@ -47,8 +72,26 @@ else
 GVFS_CONF_OPTS += --disable-fuse
 endif
 
+# AFP support is anon-only without libgcrypt which isn't very useful
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+GVFS_CONF_OPTS += --enable-afp
 GVFS_DEPENDENCIES += libgcrypt
+else
+GVFS_CONF_OPTS += --disable-afp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+GVFS_CONF_OPTS += --enable-gtk
+GVFS_DEPENDENCIES += libgtk3
+else
+GVFS_CONF_OPTS += --disable-gtk
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFS),y)
+GVFS_CONF_OPTS += --enable-nfs
+GVFS_DEPENDENCIES += libnfs
+else
+GVFS_CONF_OPTS += --disable-nfs
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP),y)
@@ -69,6 +112,12 @@ else
 GVFS_CONF_OPTS += --disable-samba
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+GVFS_DEPENDENCIES += systemd
+else
+GVFS_CONF_OPTS += --disable-libsystemd-login
+endif
+
 define GVFS_REMOVE_USELESS_BINARY
 	rm $(TARGET_DIR)/usr/bin/gvfs-less
 endef
