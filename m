From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:25:49 +0200
Subject: [Buildroot] [git commit] support/testing: test_glxinfo load X11
 modules in the right order
Message-ID: <20210518125722.82E9287F23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a3639bad01a08b7bbb4ccb3090099a01799f321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]
"Xorg does not implement real dynamic linking and requires that its
modules get loaded in the right order."

From /var/log/Xorg.0.0.log:
 (II) LoadModule: "modesetting"
 (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
 (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899

[1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_glxinfo.py                 |  4 +++-
 .../rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf        | 11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 44ac92347a..3417e48612 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -32,7 +32,9 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
         BR2_TARGET_ROOTFS_EXT2=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(
+          infra.filepath("tests/package/test_glxinfo/rootfs-overlay"))
 
     def wait_for_xserver(self):
         # xserver takes some time to start up
diff --git a/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
new file mode 100644
index 0000000000..c693c213f5
--- /dev/null
+++ b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
@@ -0,0 +1,11 @@
+
+# Xorg does not implement real dynamic linking and requires that its
+# modules get loaded in the right order.
+# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
+Section "Module"
+   Load "vgahw"
+   Load "fb"
+   Load "shadowfb"
+   Load "shadow"
+   Load "glamoregl"
+EndSection
