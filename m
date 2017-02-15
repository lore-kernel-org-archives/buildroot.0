From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:26:22 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Add
	patch to fix v1.19.1 with SIGIO
Message-ID: <20170215202629.79D27821D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b82b4441a634dfa3fdcf02f6a565e98430445b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 6a5a4e60373c from xserver v1.19.1 removes SIGIO support for
input [1].

The current patch coming from Open Embedded [2] removes a check of
'useSIGIO'. This check was producing a segfault error while using
X11 and Vivante driver [3]. Thanks to Gary Bisson to point out this
patch!

[1] https://cgit.freedesktop.org/xorg/xserver/commit/?id=6a5a4e60373c1386b311b2a8bb666c32d68a9d99
[2] https://patchwork.openembedded.org/patch/136696/
[3] http://lists.busybox.net/pipermail/buildroot/2017-February/183994.html

Signed-off-by: Myl??ne Josserand <mylene.josserand@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Remove-check-for-useSIGIO-option.patch    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
new file mode 100644
index 0000000..d4f0cca
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
@@ -0,0 +1,53 @@
+From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
+From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+Date: Mon, 30 Jan 2017 16:32:06 -0600
+Subject: [PATCH] Remove check for useSIGIO option
+
+Original patch follows:
+Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
+option.
+
+As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
+and OsReleaseSIGIO.
+
+No longer the check for useSIGIO is needed
+
+Upstream-Status: Pending
+
+Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+
+Downloaded from
+https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
+
+Signed-off-by: Myl??ne Josserand <mylene.josserand@free-electrons.com>
+---
+ hw/xfree86/os-support/shared/sigio.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
+index 884a71c..be76498 100644
+--- a/hw/xfree86/os-support/shared/sigio.c
++++ b/hw/xfree86/os-support/shared/sigio.c
+@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
+     int i;
+     int installed = FALSE;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     for (i = 0; i < MAX_FUNCS; i++) {
+         if (!xf86SigIOFuncs[i].f) {
+             if (xf86IsPipe(fd))
+@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
+     int max;
+     int ret;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     max = 0;
+     ret = 0;
+     for (i = 0; i < MAX_FUNCS; i++) {
+-- 
+2.7.4
+
