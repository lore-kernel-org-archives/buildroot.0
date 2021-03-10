From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Mar 2021 20:16:51 +0100
Subject: [Buildroot] [PATCH/2021.2 v1] package/genimage: fix for WSL
 (Windows-Subsystem for Linux)
Message-ID: <20210310191651.20769-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add upstream patch ([1]) to fix usage with WSL (Windows-Subsystem for Linux)

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13146
  - https://bugs.busybox.net/show_bug.cgi?id=13601

  ERROR: hdimage(sdcard.img): fiemap .../images/boot.vfat: 25 Inappropriate ioctl for device
  ERROR: hdimage(sdcard.img): failed to write image partition 'boot'

[1] https://github.com/pengutronix/genimage/commit/4c2b02df0861e06ca9320d80ad60994d4a239ad6.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...add-fiemap-fallback-for-errno-ENOTTY.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/genimage/0001-util-add-fiemap-fallback-for-errno-ENOTTY.patch

diff --git a/package/genimage/0001-util-add-fiemap-fallback-for-errno-ENOTTY.patch b/package/genimage/0001-util-add-fiemap-fallback-for-errno-ENOTTY.patch
new file mode 100644
index 0000000000..4ce91ed19b
--- /dev/null
+++ b/package/genimage/0001-util-add-fiemap-fallback-for-errno-ENOTTY.patch
@@ -0,0 +1,37 @@
+From 6b61b55807fdce5d09ea470e7b5c8ca1e40f724f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 12 Aug 2020 21:10:36 +0200
+Subject: [PATCH] util: add fiemap fallback for errno ENOTTY
+
+On WSL-1, genimage fails with (see [1] for details):
+
+  ERROR: hdimage(sdcard.img): fiemap .../boot.vfat: 25 Inappropriate ioctl for device
+
+This is because WSL-1 is a limited Linux emulation layer, where the fiemap
+ioctl incorrectly returns ENOTTY instead of the expected EOPNOTSUPP.
+
+[1] https://bugs.busybox.net/show_bug.cgi?id=13146
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[From https://github.com/pengutronix/genimage/commit/4c2b02df0861e06ca9320d80ad60994d4a239ad6.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 381c5d9..2dcf396 100644
+--- a/util.c
++++ b/util.c
+@@ -387,7 +387,7 @@ err_out:
+ 	free(fiemap);
+ 
+ 	/* If failure is due to no filesystem support, return a single extent */
+-	if (ret == -EOPNOTSUPP)
++	if (ret == -EOPNOTSUPP || ret == -ENOTTY)
+ 		return whole_file_exent(size, extents, extent_count);
+ 
+ 	image_error(image, "fiemap %s: %d %s\n", filename, errno, strerror(errno));
+-- 
+2.30.1
+
-- 
2.30.1
