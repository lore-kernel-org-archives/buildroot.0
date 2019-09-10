From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:32:06 +0200
Subject: [Buildroot] [git commit] package/socketcand: bump version
Message-ID: <20190910172756.ADDEC8DE6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15beee1ee740b8e39ad12cf88462a34686c629c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download location as the project is now part of the linux-can
organization.

Also remove an upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ude-to-find-SIOCGSTAMP-with-latest-kernel.patch | 54 ----------------------
 package/socketcand/socketcand.hash                 |  2 +-
 package/socketcand/socketcand.mk                   |  4 +-
 3 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/package/socketcand/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/package/socketcand/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index 5e7554733e..0000000000
--- a/package/socketcand/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e6f21b0cd5a449c1bf7a4d2c6bc5ad278a2d4e8e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Jul 2019 01:01:34 +0200
-Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-./state_bcm.c: In function 'state_bcm':
-./state_bcm.c:91:16: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGARP'?
-   if(ioctl(sc, SIOCGSTAMP, &tv) < 0) {
-
-Fixes:
- - http://autobuild.buildroot.org/results/3112b1ad77e805cd3ca61bb79560e8e13a466589
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/dschanoeh/socketcand/pull/26]
----
- state_bcm.c   | 1 +
- state_isotp.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/state_bcm.c b/state_bcm.c
-index 0c980fa..d6bdd7e 100644
---- a/state_bcm.c
-+++ b/state_bcm.c
-@@ -21,6 +21,7 @@
- #include <linux/can.h>
- #include <linux/can/bcm.h>
- #include <linux/can/error.h>
-+#include <linux/sockios.h>
- 
- #define RXLEN 128
- 
-diff --git a/state_isotp.c b/state_isotp.c
-index 4005f94..7b515e7 100644
---- a/state_isotp.c
-+++ b/state_isotp.c
-@@ -20,6 +20,7 @@
- #include <linux/can.h>
- #include <linux/can/isotp.h>
- #include <linux/can/error.h>
-+#include <linux/sockios.h>
- 
- int si = -1;
- fd_set readfds;
--- 
-2.20.1
-
diff --git a/package/socketcand/socketcand.hash b/package/socketcand/socketcand.hash
index 6398d6dd83..6b19c70524 100644
--- a/package/socketcand/socketcand.hash
+++ b/package/socketcand/socketcand.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7e9a02fdd61be8780ca3ff8678a37f8574fdcf74b1ab9de79bbb65257daf05db socketcand-df7fb4ff8a4439d7737fe2df3540e1ab7465721a.tar.gz
+sha256 3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39 socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index aeb052c8ad..b11aa3c91e 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = df7fb4ff8a4439d7737fe2df3540e1ab7465721a
-SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
+SOCKETCAND_VERSION = 69e2201222f015a1abe7a58ecf61325012cd91b1
+SOCKETCAND_SITE = $(call github,linux-can,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
