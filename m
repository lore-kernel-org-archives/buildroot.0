From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Jul 2020 21:52:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: needs dynamic library
Message-ID: <20200715195244.253915-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 35e240105f1db3e91fb769616efd8bdb90fb1b24, gvfs needs
dynamic library as it uses shared_module to build libgvfs_dbus and
libgioremote_volume_monitor

Fixes:
 - http://autobuild.buildroot.org/results/89a02fda05e75bfc9bd4fa17fea3bec23fd5da3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-engine/Config.in | 1 +
 package/gvfs/Config.in          | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1fd229fcbb..fcbccbd5c0 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	depends on BR2_USE_WCHAR # gvfs
 	depends on BR2_USE_MMU # gvfs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	depends on !BR2_STATIC_LIBS # gvfs
 	select BR2_PACKAGE_GVFS
 	help
 	  Build the vfs filesystem driver for Docker.
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 78280f80e0..5a6b3e73ec 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus, glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
@@ -16,6 +17,7 @@ config BR2_PACKAGE_GVFS
 
 	  https://wiki.gnome.org/action/show/Projects/gvfs
 
-comment "gvfs needs a toolchain w/ wchar, threads"
+comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_STATIC_LIBS
-- 
2.27.0
