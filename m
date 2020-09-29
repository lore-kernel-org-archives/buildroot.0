From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 20:42:23 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/x11r7/xserver_xorg-server: fix segfault on brcm platforms
Message-ID: <20200929185632.C24B68E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c7f4873e2a7eaffed8717bb60a438ba8530ad30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

According to the original patch message:
    Some Broadcom set-top-box boards have PCI busses, but the GPU is
    still probed through DT.  We would dereference a null busid here
    in that case.

Fixes a segfault on at least the RPi 4 w/ xserver 1.20.9, probably
others as well.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6427ede939ca38199a2fcd253a2a214db8b43972)
[Peter: move to 1.20.9 subdir]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-on-probing-a-non-PCI-platform-device-on.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/1.20.9/0006-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/package/x11r7/xserver_xorg-server/1.20.9/0006-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
new file mode 100644
index 0000000000..7802fd96c9
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.20.9/0006-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
@@ -0,0 +1,33 @@
+From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
+From: Eric Anholt <eric@anholt.net>
+Date: Fri, 26 Oct 2018 17:47:30 -0700
+Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a system
+ with PCI.
+
+Some Broadcom set-top-box boards have PCI busses, but the GPU is still
+probed through DT.  We would dereference a null busid here in that
+case.
+
+Signed-off-by: Eric Anholt <eric@anholt.net>
+Backported from: e50c85f4ebf559a3bac4817b41074c43d4691779
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ hw/xfree86/common/xf86platformBus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
+index cef47da03..dadbac6c8 100644
+--- a/hw/xfree86/common/xf86platformBus.c
++++ b/hw/xfree86/common/xf86platformBus.c
+@@ -289,7 +289,7 @@ xf86platformProbe(void)
+     for (i = 0; i < xf86_num_platform_devices; i++) {
+         char *busid = xf86_platform_odev_attributes(i)->busid;
+
+-        if (pci && (strncmp(busid, "pci:", 4) == 0)) {
++        if (pci && busid && (strncmp(busid, "pci:", 4) == 0)) {
+             platform_find_pci_info(&xf86_platform_devices[i], busid);
+         }
+
+--
+2.24.1
+
