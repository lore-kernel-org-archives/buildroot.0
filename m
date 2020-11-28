From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 08:50:13 +0100
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xserver_xorg-xserver: drop obsolete patch
Message-ID: <20201128073844.6CB3B814B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79ca48c48b5e36404892594fb1032e788fdc16f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop second patch following upstream review:
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/555

Indeed, this patch has been dropped from openembedded since 2018 because
"it is forcing input to use SIGIO, despite the fact that since 2015
xserver has used an input thread.":
https://github.com/openembedded/openembedded-core/commit/cde11398e6d74ad8f27334199b4bd99cdf1f0ff7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Remove-check-for-useSIGIO-option.patch    | 53 ----------------------
 ... => 0002-include-misc.h-fix-uClibc-build.patch} |  0
 ...ayland-Makefile.am-fix-build-without-glx.patch} |  0
 ...-common-xf86Init.c-fix-build-without-glx.patch} |  0
 ...-on-probing-a-non-PCI-platform-device-on.patch} |  0
 5 files changed, 53 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0002-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/0002-Remove-check-for-useSIGIO-option.patch
deleted file mode 100644
index 68a9d7fc75..0000000000
--- a/package/x11r7/xserver_xorg-server/0002-Remove-check-for-useSIGIO-option.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
-From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
-Date: Mon, 30 Jan 2017 16:32:06 -0600
-Subject: [PATCH] Remove check for useSIGIO option
-
-Original patch follows:
-Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
-option.
-
-As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
-and OsReleaseSIGIO.
-
-No longer the check for useSIGIO is needed
-
-Upstream-Status: Pending
-
-Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
-
-Downloaded from
-https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
-
-Signed-off-by: Myl??ne Josserand <mylene.josserand@free-electrons.com>
----
- hw/xfree86/os-support/shared/sigio.c | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
-index 884a71c..be76498 100644
---- a/hw/xfree86/os-support/shared/sigio.c
-+++ b/hw/xfree86/os-support/shared/sigio.c
-@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
-     int i;
-     int installed = FALSE;
- 
--    if (!xf86Info.useSIGIO)
--        return 0;
--
-     for (i = 0; i < MAX_FUNCS; i++) {
-         if (!xf86SigIOFuncs[i].f) {
-             if (xf86IsPipe(fd))
-@@ -257,9 +256,6 @@ xf86RemoveSIGIOHandler(int fd)
-     int max;
-     int ret;
- 
--    if (!xf86Info.useSIGIO)
--        return 0;
--
-     max = 0;
-     ret = 0;
-     for (i = 0; i < MAX_FUNCS; i++) {
--- 
-2.7.4
-
diff --git a/package/x11r7/xserver_xorg-server/0003-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/0002-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0003-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/0002-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/0004-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0004-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/0006-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/package/x11r7/xserver_xorg-server/0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0006-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
rename to package/x11r7/xserver_xorg-server/0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
