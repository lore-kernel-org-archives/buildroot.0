From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 10 Jul 2019 22:26:06 +0200
Subject: [Buildroot] [git commit] package/iproute2: bump to version 5.2.0
Message-ID: <20190710202525.505688168A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7131f68287b04b22ce3336dbb3e7013058df9aca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was accepted (slightly different version) upstream as
d0272f54 ("devlink: fix libc and kernel headers collision")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ink-fix-libc-and-kernel-headers-collision.patch | 51 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch b/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch
deleted file mode 100644
index e111b71032..0000000000
--- a/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 602128d22db86bd67e11dec8fe40a73832c222c9 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 30 May 2019 18:22:40 +0300
-Subject: [PATCH] devlink: fix libc and kernel headers collision
-
-Since commit 2f1242efe9d ("devlink: Add devlink health show command") we
-use the sys/sysinfo.h header for the sysinfo(2) system call. But since
-iproute2 carries a local version of the kernel struct sysinfo, this
-causes a collision with libc that do not rely on kernel defined sysinfo
-like musl libc:
-
-In file included from devlink.c:25:0:
-.../sysroot/usr/include/sys/sysinfo.h:10:8: error: redefinition of 'struct sysinfo'
- struct sysinfo {
-        ^~~~~~~
-In file included from ../include/uapi/linux/kernel.h:5:0,
-                 from ../include/uapi/linux/netlink.h:5,
-                 from ../include/uapi/linux/genetlink.h:6,
-                 from devlink.c:21:
-../include/uapi/linux/sysinfo.h:8:8: note: originally defined here
- struct sysinfo {
-		^~~~~~~
-
-Rely on the kernel header alone to avoid kernel and userspace headers
-collision of definitions.
-
-Cc: Aya Levin <ayal@mellanox.com>
-Cc: Moshe Shemesh <moshe@mellanox.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://patchwork.ozlabs.org/patch/1107817/
-
- devlink/devlink.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 436935f88bda..d7a6ce94f0e6 100644
---- a/devlink/devlink.c
-+++ b/devlink/devlink.c
-@@ -22,7 +22,7 @@
- #include <linux/devlink.h>
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
--#include <sys/sysinfo.h>
-+#include <linux/sysinfo.h>
- #include <sys/queue.h>
- 
- #include "SNAPSHOT.h"
--- 
-2.20.1
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 5edee4614d..ad5bcd5fbc 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf  iproute2-5.1.0.tar.xz
+sha256	a5b95dec26353fc71dba9bb403e9343fad2a06bd69fb154a22a2aa2914f74da8  iproute2-5.2.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d0b239c653..15455a8340 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.1.0
+IPROUTE2_VERSION = 5.2.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
