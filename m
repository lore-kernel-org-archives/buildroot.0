From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 10:37:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: bump to version 3.7.0
Message-ID: <20201025093742.394168-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libfuse3 is needed since version 3.0.0 and
  https://github.com/libfuse/sshfs/commit/34146444ce20c477cba7e9fe113e4387da32ae94
- Switch to meson-package

https://github.com/libfuse/sshfs/blob/sshfs-3.7.0/ChangeLog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sshfs/Config.in  | 8 ++++----
 package/sshfs/sshfs.hash | 2 +-
 package/sshfs/sshfs.mk   | 9 +++++----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 7383b6094d..bc54b698d8 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_STATIC_LIBS # libfuse
-	select BR2_PACKAGE_LIBFUSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse3, glib2
+	depends on BR2_USE_MMU # libfuse3, glib2
+	depends on !BR2_STATIC_LIBS # libfuse3
+	select BR2_PACKAGE_LIBFUSE3
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index a8878e6931..b8488013a7 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  7f689174d02e6b7e2631306fda4fb8e6b4483102d1bce82b3cdafba33369ad22  sshfs-2.8.tar.gz
+sha256  6e7e86831f3066b356e7f16e22f1b8a8f177fda05146f6a5eb821c2fd0541c34  sshfs-3.7.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index ee96ad67e8..70e7feab1d 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 2.8
-SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(SSHFS_VERSION)
+SSHFS_VERSION = 3.7.0
+SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
 SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
-	libglib2 libfuse openssh \
+	libglib2 libfuse3 openssh \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.28.0
