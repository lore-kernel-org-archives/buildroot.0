From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:24:36 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/openvmtools: use
 correct variable in udev rule RUN+=
Message-ID: <20191205213908.474DA82DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28ff72cf429e229c2da74718104069d6a4b12c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

DEVPATH is not a valid substitution in a RUN+=, devpath is:
https://mirrors.edge.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html

So use that to get rid of the following warning:

Invalid value "/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'" for RUN
(char 27: invalid substitution type), ignoring, but please fix

Source: https://github.com/vmware/open-vm-tools/pull/376

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Acked-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[Peter: extend description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 164963b80875b8d23062179bf2d92a9896a2a0a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0010-Change-DEVPATH-to-devpath.patch           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
new file mode 100644
index 0000000000..5af694d8f2
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
