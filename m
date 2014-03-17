From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 22:59:22 +0100
Subject: [Buildroot] [git commit] eudev: bump to version 1.5.2.
Message-ID: <20140317221234.E00A09C0FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=221fd0cdac28e8b3448f4c640d3410abe40451e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version of eudev is synced with systemd 210 (notably gudev API
changes).

It comes with an upstream patch to fix a build error involving
<fcntl.h>.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-87-fails-to-build-on-linux-headers-3.13.patch |   85 ++++++++++++++++++++
 package/eudev/eudev.mk                             |    4 +-
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch b/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
new file mode 100644
index 0000000..80f7aa8
--- /dev/null
+++ b/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
@@ -0,0 +1,85 @@
+From c5a77c7d10bafac25deca8e3c36946df0dc43071 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Sat, 15 Mar 2014 08:16:41 -0400
+Subject: [PATCH] Fix issue #87: fails to build on linux headers 3.13
+
+Commit 80b10107cb added #include <linux/fcntl.h> in
+src/accelerometer and friends for builds on uclibc.
+This only works with glibc and musl systems with
+linux headers 3.9 but fails with linux headers 3.13.
+
+We keep <linux/fcntl.h> but drop <fcntl.h>.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
+---
+ src/accelerometer/accelerometer.c |    1 -
+ src/ata_id/ata_id.c               |    1 -
+ src/collect/collect.c             |    1 -
+ src/mtd_probe/mtd_probe.c         |    1 -
+ src/scsi_id/scsi_serial.c         |    1 -
+ 5 files changed, 5 deletions(-)
+
+diff --git a/src/accelerometer/accelerometer.c b/src/accelerometer/accelerometer.c
+index f65631a..386775b 100644
+--- a/src/accelerometer/accelerometer.c
++++ b/src/accelerometer/accelerometer.c
+@@ -50,7 +50,6 @@
+ #include <math.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-#include <fcntl.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <getopt.h>
+diff --git a/src/ata_id/ata_id.c b/src/ata_id/ata_id.c
+index a25c713..500669c 100644
+--- a/src/ata_id/ata_id.c
++++ b/src/ata_id/ata_id.c
+@@ -23,7 +23,6 @@
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <unistd.h>
+-#include <fcntl.h>
+ #include <ctype.h>
+ #include <string.h>
+ #include <errno.h>
+diff --git a/src/collect/collect.c b/src/collect/collect.c
+index fbaf87f..7fefc62 100644
+--- a/src/collect/collect.c
++++ b/src/collect/collect.c
+@@ -24,7 +24,6 @@
+ #include <stddef.h>
+ #include <unistd.h>
+ #include <signal.h>
+-#include <fcntl.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <getopt.h>
+diff --git a/src/mtd_probe/mtd_probe.c b/src/mtd_probe/mtd_probe.c
+index e604a72..bab2e8e 100644
+--- a/src/mtd_probe/mtd_probe.c
++++ b/src/mtd_probe/mtd_probe.c
+@@ -22,7 +22,6 @@
+ #include <mtd/mtd-user.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-#include <fcntl.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <linux/fcntl.h>
+diff --git a/src/scsi_id/scsi_serial.c b/src/scsi_id/scsi_serial.c
+index b60b154..7c5f7a3 100644
+--- a/src/scsi_id/scsi_serial.c
++++ b/src/scsi_id/scsi_serial.c
+@@ -23,7 +23,6 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <string.h>
+-#include <fcntl.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <syslog.h>
+--
+1.7.9.5
+
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 95aa1ce..a2fe528 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 1.3
-EUDEV_SITE = $(call github,gentoo,eudev,v$(EUDEV_VERSION))
+EUDEV_VERSION = 1.5.2
+EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
