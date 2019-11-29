From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 29 Nov 2019 15:22:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/openvmtools: vmware disk timeout
 udev rules fix
Message-ID: <20191129142256.6104-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: Invalid value "/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'" for RUN (char 27: invalid substitution type), ignoring, but please fix

Source: https://github.com/vmware/open-vm-tools/pull/376

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 .../0010-Change-DEVPATH-to-devpath.patch           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/openvmtools/0010-Change-DEVPATH-to-devpath.patch

diff --git a/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
new file mode 100644
index 0000000..5af694d
--- /dev/null
+++ b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
@@ -0,0 +1,25 @@
+From 22f5d198b3b2f7e4debed83948ba1baf70d4749a Mon Sep 17 00:00:00 2001
+From: puneetse <22071208+puneetse@users.noreply.github.com>
+Date: Wed, 16 Oct 2019 10:04:41 -0700
+Subject: [PATCH] Change $DEVPATH to $devpath
+
+$DEVPATH throws a warning by udev.
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+ udev/99-vmware-scsi-udev.rules | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/udev/99-vmware-scsi-udev.rules b/udev/99-vmware-scsi-udev.rules
+index 053b59706..a605d80ef 100644
+--- a/udev/99-vmware-scsi-udev.rules
++++ b/udev/99-vmware-scsi-udev.rules
+@@ -2,6 +2,6 @@
+ #
+ # This file is part of open-vm-tools
+ 
+-ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'"
+-ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'"
++ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys/$devpath/device/timeout'"
++ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys/$devpath/device/timeout'"
+ 
-- 
2.7.4
