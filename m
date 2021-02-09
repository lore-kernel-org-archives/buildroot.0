From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2021 22:31:22 +0100
Subject: [Buildroot] [git commit] package/libostree: libfuse is optional,
 not mandatory
Message-ID: <20210209211311.C700981640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e12000bf63bf1b5842cb3c8bf6ce699cbeb077ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfuse is optional since its addition in version 2016.2 with
https://github.com/ostreedev/ostree/commit/e9ccdd2d007801ef25cc7283188942d791889c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/Config.in    | 4 +---
 package/libostree/libostree.mk | 9 ++++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 4a6ab5464f..14ae4da4c8 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -1,14 +1,12 @@
 config BR2_PACKAGE_LIBOSTREE
 	bool "libostree"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libgpg-error
-	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_USE_MMU # e2fsprogs, libfuse, libglib2, libgpgme
+	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGPGME
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 9406e023bd..7c887ebee8 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -10,7 +10,7 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
-LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpg-error libgpgme xz
+LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libglib2 libgpg-error libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
 
 LIBOSTREE_CONF_ENV = \
@@ -69,6 +69,13 @@ else
 LIBOSTREE_CONF_OPTS += --without-libarchive
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+LIBOSTREE_CONF_OPTS += --enable-rofiles-fuse
+LIBOSTREE_DEPENDENCIES += libfuse
+else
+LIBOSTREE_CONF_OPTS += --disable-rofiles-fuse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LIBOSTREE_CONF_OPTS += --with-selinux
 LIBOSTREE_DEPENDENCIES += libselinux
