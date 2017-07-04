From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:44 +0200
Subject: [Buildroot] [git commit] libvips: use the new gettext logic
Message-ID: <20170704233516.8AB9E7FF68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77c997b5095347808939aeab694f97c774af1399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection. We adjust the comment
   explaining the BR2_USE_WCHAR dependency, since gettext is no longer
   the reason for this dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvips/Config.in  | 3 +--
 package/libvips/libvips.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 87ada51..e16e527 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVIPS
 	bool "libvips"
-	depends on BR2_USE_WCHAR # gettext, libglib2
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
 	# C++ support is required to build libvips
@@ -8,7 +8,6 @@ config BR2_PACKAGE_LIBVIPS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libvips is a 2D image processing library. Compared to
 	  similar libraries, libvips runs quickly and uses little
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 974a4be..8078e04 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -41,7 +41,7 @@ LIBVIPS_CONF_OPTS = \
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
 	host-pkgconf libglib2 \
-	libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	libxml2 $(TARGET_NLS_DEPENDENCIES)
 
 # --disable-cxx is broken upstream
 # https://github.com/jcupitt/libvips/issues/231
