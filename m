From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 22:52:24 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/qemu: fixup
 patches after 3.1.1 bump
Message-ID: <20190904204810.67AF58B666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=013e200c4119721cd100a0bbdf4c5837a4a88251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
http://autobuild.buildroot.net/results/71f/71f711d30ddc9edc8da0d1a60636e7a13b546ebe/

Commit a0b032ad859b2e6e8cd (package/qemu: security bump to version 3.1.1)
bumped the version but didn't update the patch subdirectory name, so the
patches were now ignored.

This was then backported to 2019.02.x / 2019.05.x where the sub directory
did not exist - So the patches _WHERE_ used, but failed to apply as patch
0002 is now upstream.

Fix that by removing the patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop subdirectory]
(cherry picked from commit c796c83037072d616a6d47a1177dd5f16a21539c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qemu/0002-configure-improve-usbfs-check.patch  | 60 ----------------------
 1 file changed, 60 deletions(-)

diff --git a/package/qemu/0002-configure-improve-usbfs-check.patch b/package/qemu/0002-configure-improve-usbfs-check.patch
deleted file mode 100644
index d693b5d7ef..0000000000
--- a/package/qemu/0002-configure-improve-usbfs-check.patch
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
