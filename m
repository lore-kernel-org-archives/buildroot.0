From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:19:36 +0200
Subject: [Buildroot] [git commit] libmbim: fix build with musl libc
Message-ID: <20170923201331.EE5FF81036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e271944f937faa1a31756638d50a904bde21d1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch applied upstream:
  https://cgit.freedesktop.org/libmbim/libmbim/commit/?id=417b0b80023dc30d61c111ec0a54da2884d3a541

Fixes:
http://autobuild.buildroot.net/results/dc1/dc11a3dfd18bb7f5078de00412de82de3cce3c48

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
[Arnout: rework commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-prefer-realpath-to-canonicalize_file_nam.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch b/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
new file mode 100644
index 0000000..1a72b61
--- /dev/null
+++ b/package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch
@@ -0,0 +1,37 @@
+From 6b043b9b676e88a80e3d4013863c5e970fdde1df Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
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
