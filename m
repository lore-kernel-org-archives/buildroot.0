From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 22:53:38 +0100
Subject: [Buildroot] [git commit] package/connman: fix compilation error for
 kernels >= 4.15
Message-ID: <20180130215615.8B81486038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=561913eb9f3efd5d54ae208f93a21aaaaca7c769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include the upstream fix 0001-tethering-Reorder-header-includes.patch

Fixes
http://autobuild.buildroot.net/results/90005b436e25495a1113966112785278dfc0420a
http://autobuild.buildroot.net/results/ab713048093746576734e90290b8777222d70e7e
http://autobuild.buildroot.net/results/368c2c8ab9b8db7f445a9681082ce1e10c7e0151
http://autobuild.buildroot.net/results/1c98fd9ce430463e720212ce8a3698e2b72cbe7d
http://autobuild.buildroot.net/results/bc865093e6ffec4737433c5a213c0241495e9ccc
http://autobuild.buildroot.net/results/e4d93b136ef8aff600264d743191bf087044c27a
http://autobuild.buildroot.net/results/a2feeeed4d0d11fda5f029f8c784ed6ce16ee856

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-tethering-Reorder-header-includes.patch   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/connman/0001-tethering-Reorder-header-includes.patch b/package/connman/0001-tethering-Reorder-header-includes.patch
new file mode 100644
index 0000000000..4955df1cdd
--- /dev/null
+++ b/package/connman/0001-tethering-Reorder-header-includes.patch
@@ -0,0 +1,37 @@
+From bdfb3526466f8fb8f13d9259037d8f42c782ce24 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Wed, 17 Jan 2018 23:42:50 +0100
+Subject: [PATCH] tethering: Reorder header includes
+
+Avoid compile errors due to unsupported header include order with
+newer kernels (>=4.15). We should import the libc header files first
+and then the Linux header files in user space applications.
+
+Reported by Neil MacLeod <neil@nmacleod.com>. Fix probosal by Jonas
+Bonn <jonas@southpole.se> and Hauke Mehrtens <hauke@hauke-m.de>.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/tethering.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tethering.c b/src/tethering.c
+index c929ba7..4b20236 100644
+--- a/src/tethering.c
++++ b/src/tethering.c
+@@ -31,11 +31,11 @@
+ #include <stdio.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>
+-#include <linux/sockios.h>
+ #include <string.h>
+ #include <fcntl.h>
+-#include <linux/if_tun.h>
+ #include <netinet/in.h>
++#include <linux/sockios.h>
++#include <linux/if_tun.h>
+ #include <linux/if_bridge.h>
+
+ #include "connman.h"
+--
+2.7.4
