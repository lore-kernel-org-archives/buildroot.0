From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:32:47 +0200
Subject: [Buildroot] [git commit] syslinux: add patch to disable pie
Message-ID: <20160912203537.D704982112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f80e50d8a7ebcdaa8111963b6df0fe658ade6e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ubuntu 16.10 has pie enable by default. This causes a build failure with
syslinux.

https://bugs.launchpad.net/ubuntu/+source/syslinux/+bug/1579023

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
[Thomas: improve patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/0002-disable-pie.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/boot/syslinux/0002-disable-pie.patch b/boot/syslinux/0002-disable-pie.patch
new file mode 100644
index 0000000..b31b622
--- /dev/null
+++ b/boot/syslinux/0002-disable-pie.patch
@@ -0,0 +1,22 @@
+Description: Disable PIE to avoid FTBFS on amd64
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/1579023
+Author: Graham Inggs <ginggs@ubuntu.com>
+Last-Update: 2016-05-06
+
+gcc 6.x has PIE support enabled by default, which causes a build issue
+with syslinux. This patch disables PIE support in the relevant
+syslinux Makefile.
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+
+--- a/gpxe/src/Makefile
++++ b/gpxe/src/Makefile
+@@ -4,7 +4,7 @@
+ #
+
+ CLEANUP		:=
+-CFLAGS		:=
++CFLAGS		:= -fno-PIE
+ ASFLAGS		:=
+ LDFLAGS		:=
+ MAKEDEPS	:= Makefile
