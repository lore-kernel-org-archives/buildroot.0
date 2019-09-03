From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Sep 2019 16:30:58 +0200
Subject: [Buildroot] [PATCH] package/qemu: fixup patches after 3.1.1 bump
Message-ID: <20190903143058.12845-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a0b032ad859b2e6e8cd (package/qemu: security bump to version 3.1.1)
bumped the version but didn't update the patch subdirectory name, so the
patches are now ignored.

Fix that by renaming the directory.  Drop
0002-configure-improve-usbfs-check.patch as that is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../3.1.0/0002-configure-improve-usbfs-check.patch | 60 ----------------------
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch |  0
 ...riably-sized-SIOCGSTAMP-with-new-kernels.patch} |  0
 3 files changed, 60 deletions(-)
 delete mode 100644 package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
 rename package/qemu/{3.1.0 => 3.1.1}/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch (100%)
 rename package/qemu/{3.1.0/0003-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch => 3.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch} (100%)

diff --git a/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch b/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
deleted file mode 100644
index d693b5d7ef..0000000000
--- a/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9672cccd64c446369b5649fe23d575917638be46 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 5 Feb 2019 15:07:43 +0100
-Subject: [PATCH] configure: improve usbfs check
-
-The current check to test if usbfs support should be compiled or not
-solely relies on the presence of <linux/usbdevice_fs.h>, without
-actually checking that all definition used by Qemu are provided by
-this header file.
-
-With sufficiently old kernel headers, <linux/usbdevice_fs.h> may be
-present, but some of the definitions needed by Qemu may not be
-available.
-
-This commit improves the check by building a small program that
-actually tests whether the necessary definitions are available.
-
-In addition, it fixes a bug where have_usbfs was set to "yes"
-regardless of the result of the test.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure | 19 +++++++++++++++++--
- 1 file changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 3d89870d99..799c8e3b08 100755
---- a/configure
-+++ b/configure
-@@ -4266,10 +4266,25 @@ fi
- # check for usbfs
- have_usbfs=no
- if test "$linux_user" = "yes"; then
--  if check_include linux/usbdevice_fs.h; then
-+  cat > $TMPC << EOF
-+#include <linux/usbdevice_fs.h>
-+
-+#ifndef USBDEVFS_GET_CAPABILITIES
-+#error "USBDEVFS_GET_CAPABILITIES undefined"
-+#endif
-+
-+#ifndef USBDEVFS_DISCONNECT_CLAIM
-+#error "USBDEVFS_DISCONNECT_CLAIM undefined"
-+#endif
-+
-+int main(void)
-+{
-+    return 0;
-+}
-+EOF
-+  if compile_prog "" ""; then
-     have_usbfs=yes
-   fi
--  have_usbfs=yes
- fi
- 
- # check for fallocate
--- 
-2.20.1
-
diff --git a/package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/3.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
similarity index 100%
rename from package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
rename to package/qemu/3.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
diff --git a/package/qemu/3.1.0/0003-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch b/package/qemu/3.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
similarity index 100%
rename from package/qemu/3.1.0/0003-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
rename to package/qemu/3.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
-- 
2.11.0
