From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 09:57:05 +0200
Subject: [Buildroot] [git commit] network-manager: fix build on toolchains
	not exporting CLOCK_BOOTTIME (E.G. uClibc)
Message-ID: <20140811075901.C402B9D419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e33639ecf32bf9615911e9366b18f56ff0d2c90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c13/c1388cf73961ddf06f771afe77a7e1e9fc0d8c20/
http://autobuild.buildroot.net/results/d33/d33ed1c3bf1be7c8f8ea02590a770b0d29c7d9fa/
http://autobuild.buildroot.net/results/093/093656db99067eb7bff725e292f8fc880a1d748e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gerUtils-fix-build-with-toolchains-not-ex.patch |   38 ++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/network-manager/network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch b/package/network-manager/network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
new file mode 100644
index 0000000..9286daa
--- /dev/null
+++ b/package/network-manager/network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
@@ -0,0 +1,38 @@
+From b8241447e2a910dde57bf5a44a4464d80c87ebca Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 11 Aug 2014 09:37:05 +0200
+Subject: [PATCH] NetworkManagerUtils: fix build with toolchains not exporting
+ CLOCK_BOOTTIME
+
+E.G. uClibc 0.9.33 and earlier.
+
+Submitted upstream: https://bugzilla.gnome.org/show_bug.cgi?id=734599
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/NetworkManagerUtils.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/NetworkManagerUtils.c b/src/NetworkManagerUtils.c
+index aa689ce..fc85b00 100644
+--- a/src/NetworkManagerUtils.c
++++ b/src/NetworkManagerUtils.c
+@@ -45,6 +45,15 @@
+ #include "nm-posix-signals.h"
+ 
+ /*
++ * Some toolchains (E.G. uClibc 0.9.33 and earlier) don't export
++ * CLOCK_BOOTTIME even though the kernel supports it, so provide a
++ * local definition
++ */
++#ifndef CLOCK_BOOTTIME
++#define CLOCK_BOOTTIME 7
++#endif
++
++/*
+  * nm_ethernet_address_is_valid
+  *
+  * Compares an Ethernet address against known invalid addresses.
+-- 
+2.0.0
+
