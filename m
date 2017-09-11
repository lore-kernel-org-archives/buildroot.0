From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 11 Sep 2017 09:54:26 +0200
Subject: [Buildroot] [PATCH] libmbim: fix build with musl libc
Message-ID: <20170911075426.514-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is now failing because the libgudev dependency is optional and
the build will only use if it's found during the configure checks.

Imported the same patch that has been applied in the upstream libmbim
git repository:
  https://cgit.freedesktop.org/libmbim/libmbim/commit/?id=417b0b80023dc30d61c111ec0a54da2884d3a541

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 ...-prefer-realpath-to-canonicalize_file_nam.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch

diff --git a/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch b/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
new file mode 100644
index 000000000..a13aee547
--- /dev/null
+++ b/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
@@ -0,0 +1,36 @@
+From 48772b32f10523cca22b7d63c3523377279c7427 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Mon, 11 Sep 2017 09:31:03 +0200
+Subject: [PATCH] mbim-device: prefer realpath() to canonicalize_file_name()
+
+Usually the canonicalize_file_name() GNU extension is preferred to the
+POSIX realpath(), as it covers some of the limitations the latter has.
+But this extension isn't available in lots of platforms or in other
+c library implementations (e.g. musl), so just default to the POSIX
+method to improve portability.
+
+Note that the check for canonicalize_file_name() availability during
+configure isn't as trivial as adding a new AC_CHECK_FUNCS(), and
+importing a gnulib module seems overkill just for this one liner.
+
+(cherry picked from commit 417b0b80023dc30d61c111ec0a54da2884d3a541)
+---
+ src/libmbim-glib/mbim-device.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libmbim-glib/mbim-device.c b/src/libmbim-glib/mbim-device.c
+index e1f32a6..20e64af 100644
+--- a/src/libmbim-glib/mbim-device.c
++++ b/src/libmbim-glib/mbim-device.c
+@@ -867,7 +867,7 @@ get_descriptors_filepath (MbimDevice *self)
+          *    /sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:2.0
+          */
+         tmp = g_strdup_printf ("/sys/class/%s/%s/device", subsystems[i], device_basename);
+-        path = canonicalize_file_name (tmp);
++        path = realpath (tmp, NULL);
+         g_free (tmp);
+ 
+         if (g_file_test (path, G_FILE_TEST_EXISTS)) {
+-- 
+2.13.1
+
-- 
2.13.1
