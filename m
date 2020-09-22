From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 21 Sep 2020 17:29:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 segfault on brcm platforms
Message-ID: <20200922002916.3621404-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the original patch message:
    Some Broadcom set-top-box boards have PCI busses, but the GPU is
    still probed through DT.  We would dereference a null busid here
    in that case.

Fixes a segfault on at least the RPi 4 w/ xserver 1.20.9, probably
others as well.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Somehow this patch was merged to master a year ago, but didn't make it
into 1.20.9. Consider applying this to stable branches w/ 1.20.9 as
well, Xorg is broken on Broadcom platforms without it.

 ...probing-a-non-PCI-platform-device-on.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch

diff --git a/package/x11r7/xserver_xorg-server/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/package/x11r7/xserver_xorg-server/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
new file mode 100644
index 0000000000..75d2813152
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
@@ -0,0 +1,32 @@
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
--
2.28.0
