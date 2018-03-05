From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:21 -0000
Subject: [Buildroot] [git commit] libmbim: bump to version 1.16.0
Message-ID: <20180305200713.54E7780FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a726eab68b4f8c8a760da049fd538fb35f4d201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the patch already applied upstream.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-prefer-realpath-to-canonicalize_file_nam.patch | 37 ----------------------
 package/libmbim/libmbim.hash                       |  2 +-
 package/libmbim/libmbim.mk                         |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch b/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
deleted file mode 100644
index 1a72b618af..0000000000
--- a/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6b043b9b676e88a80e3d4013863c5e970fdde1df Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Mon, 11 Sep 2017 09:31:03 +0200
-Subject: [PATCH] mbim-device: prefer realpath() to canonicalize_file_name()
-
-Usually the canonicalize_file_name() GNU extension is preferred to the
-POSIX realpath(), as it covers some of the limitations the latter has.
-But this extension isn't available in lots of platforms or in other
-c library implementations (e.g. musl), so just default to the POSIX
-method to improve portability.
-
-Note that the check for canonicalize_file_name() availability during
-configure isn't as trivial as adding a new AC_CHECK_FUNCS(), and
-importing a gnulib module seems overkill just for this one liner.
-
-(cherry picked from commit 417b0b80023dc30d61c111ec0a54da2884d3a541)
-Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
----
- src/libmbim-glib/mbim-device.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libmbim-glib/mbim-device.c b/src/libmbim-glib/mbim-device.c
-index e1f32a6..20e64af 100644
---- a/src/libmbim-glib/mbim-device.c
-+++ b/src/libmbim-glib/mbim-device.c
-@@ -867,7 +867,7 @@ get_descriptors_filepath (MbimDevice *self)
-          *    /sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:2.0
-          */
-         tmp = g_strdup_printf ("/sys/class/%s/%s/device", subsystems[i], device_basename);
--        path = canonicalize_file_name (tmp);
-+        path = realpath (tmp, NULL);
-         g_free (tmp);
-
-         if (g_file_test (path, G_FILE_TEST_EXISTS)) {
---
-2.13.1
-
diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 664513e5c0..9734181a34 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  22cafe6b8432433aa58bedcf7db71111522ce6531bfe24e8e9b6058412cd31cf  libmbim-1.14.2.tar.xz
+sha256  c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2  libmbim-1.16.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index b67905a7fa..169cdc1dcd 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.14.2
+LIBMBIM_VERSION = 1.16.0
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
