From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 21:33:27 +0200
Subject: [Buildroot] [git commit] modem-manager: fix build with musl
Message-ID: <20180615193133.6F1918871C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=945636b304e3d36984859faf04c674d7a0e4c7d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

modem-manager version 1.8.0 introduced use of canonicalize_file_name(),
which is a GNU extension that musl does not implement. Add a patch
switching to POSIX standard realpath().

Fixes:
http://autobuild.buildroot.net/results/9f6/9f6859f1854d94d3caba7b5c24d9ca6a14622042/

Cc: Aleksander Morgado <aleksander@aleksander.es>
Cc: Carlos Santos <casantos@datacom.com.br>
Cc: Petr Vorel <petr.vorel@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-kerneldevice-fix-build-with-musl-libc.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch b/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..68181cb5ed
--- /dev/null
+++ b/package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch
@@ -0,0 +1,67 @@
+From ed40ac76b125b1c3b2e2f8522d283b073c23bd3b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 15 Jun 2018 06:25:46 +0300
+Subject: [PATCH] kerneldevice: fix build with musl libc
+
+musl libc does not implement the canonicalize_file_name() GNU extension.
+Use the POSIX standard realpath() instead.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to modemmanager-devel at lists.freedesktop.org
+
+ src/kerneldevice/mm-kernel-device-generic.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/kerneldevice/mm-kernel-device-generic.c b/src/kerneldevice/mm-kernel-device-generic.c
+index 6b0f072402ff..885bef171f5d 100644
+--- a/src/kerneldevice/mm-kernel-device-generic.c
++++ b/src/kerneldevice/mm-kernel-device-generic.c
+@@ -120,7 +120,7 @@ preload_sysfs_path (MMKernelDeviceGeneric *self)
+                            mm_kernel_event_properties_get_subsystem (self->priv->properties),
+                            mm_kernel_event_properties_get_name      (self->priv->properties));
+ 
+-    self->priv->sysfs_path = canonicalize_file_name (tmp);
++    self->priv->sysfs_path = realpath (tmp, NULL);
+     if (!self->priv->sysfs_path || !g_file_test (self->priv->sysfs_path, G_FILE_TEST_EXISTS)) {
+         mm_warn ("Invalid sysfs path read for %s/%s",
+                  mm_kernel_event_properties_get_subsystem (self->priv->properties),
+@@ -163,7 +163,7 @@ preload_interface_sysfs_path (MMKernelDeviceGeneric *self)
+      * The correct parent dir we want to have is the first one with "usb" subsystem.
+      */
+     aux = g_strdup_printf ("%s/device", self->priv->sysfs_path);
+-    dirpath = canonicalize_file_name (aux);
++    dirpath = realpath (aux, NULL);
+     g_free (aux);
+ 
+     while (dirpath) {
+@@ -179,7 +179,7 @@ preload_interface_sysfs_path (MMKernelDeviceGeneric *self)
+             gchar *canonicalized_subsystem;
+             gchar *subsystem_name;
+ 
+-            canonicalized_subsystem = canonicalize_file_name (subsystem_filepath);
++            canonicalized_subsystem = realpath (subsystem_filepath, NULL);
+             g_free (subsystem_filepath);
+ 
+             subsystem_name = g_path_get_basename (canonicalized_subsystem);
+@@ -239,7 +239,7 @@ preload_driver (MMKernelDeviceGeneric *self)
+         gchar *tmp2;
+ 
+         tmp = g_strdup_printf ("%s/driver", self->priv->interface_sysfs_path);
+-        tmp2 = canonicalize_file_name (tmp);
++        tmp2 = realpath (tmp, NULL);
+         if (tmp2 && g_file_test (tmp2, G_FILE_TEST_EXISTS))
+             self->priv->driver = g_path_get_basename (tmp2);
+         g_free (tmp2);
+@@ -308,7 +308,7 @@ preload_physdev_subsystem (MMKernelDeviceGeneric *self)
+         gchar *subsyspath;
+ 
+         aux = g_strdup_printf ("%s/subsystem", self->priv->physdev_sysfs_path);
+-        subsyspath = canonicalize_file_name (aux);
++        subsyspath = realpath (aux, NULL);
+         self->priv->physdev_subsystem = g_path_get_dirname (subsyspath);
+         g_free (subsyspath);
+         g_free (aux);
+-- 
+2.17.1
+
