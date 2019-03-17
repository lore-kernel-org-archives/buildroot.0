From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:08:01 +0100
Subject: [Buildroot] [git commit] package/modem-manager: bump to version
 1.10.0
Message-ID: <20190317110506.EF9D981763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c444e6c617f05c87f3b9bc20d2c516379d53f277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch (included in this release).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-kerneldevice-fix-build-with-musl-libc.patch | 67 ----------------------
 package/modem-manager/modem-manager.hash           |  2 +-
 package/modem-manager/modem-manager.mk             |  2 +-
 3 files changed, 2 insertions(+), 69 deletions(-)

diff --git a/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch b/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch
deleted file mode 100644
index 68181cb5ed..0000000000
--- a/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From ed40ac76b125b1c3b2e2f8522d283b073c23bd3b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 15 Jun 2018 06:25:46 +0300
-Subject: [PATCH] kerneldevice: fix build with musl libc
-
-musl libc does not implement the canonicalize_file_name() GNU extension.
-Use the POSIX standard realpath() instead.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to modemmanager-devel at lists.freedesktop.org
-
- src/kerneldevice/mm-kernel-device-generic.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/kerneldevice/mm-kernel-device-generic.c b/src/kerneldevice/mm-kernel-device-generic.c
-index 6b0f072402ff..885bef171f5d 100644
---- a/src/kerneldevice/mm-kernel-device-generic.c
-+++ b/src/kerneldevice/mm-kernel-device-generic.c
-@@ -120,7 +120,7 @@ preload_sysfs_path (MMKernelDeviceGeneric *self)
-                            mm_kernel_event_properties_get_subsystem (self->priv->properties),
-                            mm_kernel_event_properties_get_name      (self->priv->properties));
- 
--    self->priv->sysfs_path = canonicalize_file_name (tmp);
-+    self->priv->sysfs_path = realpath (tmp, NULL);
-     if (!self->priv->sysfs_path || !g_file_test (self->priv->sysfs_path, G_FILE_TEST_EXISTS)) {
-         mm_warn ("Invalid sysfs path read for %s/%s",
-                  mm_kernel_event_properties_get_subsystem (self->priv->properties),
-@@ -163,7 +163,7 @@ preload_interface_sysfs_path (MMKernelDeviceGeneric *self)
-      * The correct parent dir we want to have is the first one with "usb" subsystem.
-      */
-     aux = g_strdup_printf ("%s/device", self->priv->sysfs_path);
--    dirpath = canonicalize_file_name (aux);
-+    dirpath = realpath (aux, NULL);
-     g_free (aux);
- 
-     while (dirpath) {
-@@ -179,7 +179,7 @@ preload_interface_sysfs_path (MMKernelDeviceGeneric *self)
-             gchar *canonicalized_subsystem;
-             gchar *subsystem_name;
- 
--            canonicalized_subsystem = canonicalize_file_name (subsystem_filepath);
-+            canonicalized_subsystem = realpath (subsystem_filepath, NULL);
-             g_free (subsystem_filepath);
- 
-             subsystem_name = g_path_get_basename (canonicalized_subsystem);
-@@ -239,7 +239,7 @@ preload_driver (MMKernelDeviceGeneric *self)
-         gchar *tmp2;
- 
-         tmp = g_strdup_printf ("%s/driver", self->priv->interface_sysfs_path);
--        tmp2 = canonicalize_file_name (tmp);
-+        tmp2 = realpath (tmp, NULL);
-         if (tmp2 && g_file_test (tmp2, G_FILE_TEST_EXISTS))
-             self->priv->driver = g_path_get_basename (tmp2);
-         g_free (tmp2);
-@@ -308,7 +308,7 @@ preload_physdev_subsystem (MMKernelDeviceGeneric *self)
-         gchar *subsyspath;
- 
-         aux = g_strdup_printf ("%s/subsystem", self->priv->physdev_sysfs_path);
--        subsyspath = canonicalize_file_name (aux);
-+        subsyspath = realpath (aux, NULL);
-         self->priv->physdev_subsystem = g_path_get_dirname (subsyspath);
-         g_free (subsyspath);
-         g_free (aux);
--- 
-2.17.1
-
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 77a8c2dc43..404ae7929f 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  18abe34421aa3b52ff47d4ba93aa282f8f8944717dd644a5c0c81eeeac9c7eb1  ModemManager-1.8.0.tar.xz
+sha256  fd0f39996025dac96995daea8a58ec7dd571582f7563a8ae0d5f65b571b76ee2  ModemManager-1.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index e2f89d9de1..aa27dc9ce5 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.8.0
+MODEM_MANAGER_VERSION = 1.10.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
