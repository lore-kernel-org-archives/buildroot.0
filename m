From: kevin.joly at armadeus.com <kevin.joly@armadeus.com>
Date: Wed, 20 Apr 2011 14:15:27 +0200
Subject: [Buildroot] [PATCH] [BUILDROOT] Update package socketcan and rename
	socketcan to socketcan_utils
Message-ID: <1303301727-893-1-git-send-email-kevin.joly@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kevin JOLY <joly.kevin25@gmail.com>


Signed-off-by: Kevin JOLY <joly.kevin25@gmail.com>
---
 patches/buildroot/2010.11/042-socketcan.patch |   48 +++++++++++++++++++++++-
 1 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/patches/buildroot/2010.11/042-socketcan.patch b/patches/buildroot/2010.11/042-socketcan.patch
index 8c77741..7bb885c 100644
--- a/patches/buildroot/2010.11/042-socketcan.patch
+++ b/patches/buildroot/2010.11/042-socketcan.patch
@@ -5,8 +5,8 @@ Signed-off-by: Kevin Joly <joly.kevin25@gmail.com>
 
 Index: buildroot/package/Config.in
 ===================================================================
---- buildroot.orig/package/Config.in	2011-04-20 13:56:09.454599001 +0200
-+++ buildroot/package/Config.in	2011-04-20 13:57:38.958599001 +0200
+--- buildroot.orig/package/Config.in	2011-04-20 14:11:30.206599000 +0200
++++ buildroot/package/Config.in	2011-04-20 14:12:11.566599000 +0200
 @@ -428,6 +428,7 @@
  source "package/samba/Config.in"
  source "package/ser2net/Config.in"
@@ -15,3 +15,47 @@ Index: buildroot/package/Config.in
  source "package/spawn-fcgi/Config.in"
  source "package/squid/Config.in"
  source "package/tcpdump/Config.in"
+Index: buildroot/package/socketcan_utils/Config.in
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ buildroot/package/socketcan_utils/Config.in	2011-04-20 09:45:25.000000000 +0200
+@@ -0,0 +1,7 @@
++config BR2_PACKAGE_SOCKETCAN_UTILS
++	bool "socketcan_utils"
++	help
++	  The socketcan_utils package contains several tools for Linux to test
++	  a Controller Area Network.
++
++	  http://developer.berlios.de/projects/socketcan/
+Index: buildroot/package/socketcan_utils/socketcan_utils.mk
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ buildroot/package/socketcan_utils/socketcan_utils.mk	2011-04-20 11:52:55.000000000 +0200
+@@ -0,0 +1,27 @@
++#############################################################
++#
++# socketcan_utils
++#
++#############################################################
++SOCKETCAN_UTILS_VERSION = 1235
++SOCKETCAN_UTILS_SOURCE = socketcan-svn-rev$(SOCKETCAN_VERSION).tar.gz
++SOCKETCAN_UTILS_SITE = http://svn.berlios.de/svnroot/repos/socketcan/trunk/
++SOCKETCAN_UTILS_SITE_METHOD = svn
++TARGET_CFLAGS+= -I$(@D)/kernel/2.6/include \
++	    -DSO_RXQ_OVFL=40 \
++	    -DPF_CAN=29 \
++	    -DAF_CAN=PF_CAN
++
++define SOCKETCAN_UTILS_BUILD_CMDS
++	$(MAKE) -C $(@D)/can-utils CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
++endef
++
++define SOCKETCAN_UTILS_INSTALL_TARGET_CMDS
++	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D)/can-utils install PREFIX="/usr"
++endef
++
++define SOCKETCAN_UTILS_CLEAN_CMDS
++	$(MAKE) -C $(@D)/can-utils clean
++endef
++
++$(eval $(call GENTARGETS,package,socketcan_utils))
-- 
1.7.1
