From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] ng-spice-rework: remove package
Message-ID: <20101214003643.06FFE8E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b07fed4bf1030a0e20c92843203cb896ff4d9575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has been marked deprecated in October, and no-one
complained. Moreover, it doesn't sound like a package that is widely
used on embedded systems. So we get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/Config.in                                  |    1 -
 package/ng-spice-rework/Config.in                  |    9 ---------
 .../ng-spice-rework-17-makeidx.patch               |   12 ------------
 package/ng-spice-rework/ng-spice-rework.mk         |   18 ------------------
 5 files changed, 1 insertions(+), 41 deletions(-)
 delete mode 100644 package/ng-spice-rework/Config.in
 delete mode 100644 package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
 delete mode 100644 package/ng-spice-rework/ng-spice-rework.mk

diff --git a/CHANGES b/CHANGES
index f3e990c..f3d8243 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
-	Removed packages: microcom
+	Removed packages: microcom, ng-spice-rework
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 23f000b..eb4ea8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,7 +353,6 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
-source "package/ng-spice-rework/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
diff --git a/package/ng-spice-rework/Config.in b/package/ng-spice-rework/Config.in
deleted file mode 100644
index de5d091..0000000
--- a/package/ng-spice-rework/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_NG_SPICE_REWORK
-	bool "ng-spice-rework"
-	depends on BR2_DEPRECATED
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  Ngspice is a mixed-level/mixed-signal circuit simulator.
-
-	  http://superb-west.dl.sourceforge.net/sourceforge/ngspice
diff --git a/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch b/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
deleted file mode 100644
index dcce6ce..0000000
--- a/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/src/Makefile.in	2005-08-30 03:58:00.000000000 -0400
-+++ b/src/Makefile.in	2008-02-13 14:38:04.000000000 -0500
-@@ -882,7 +882,8 @@ spice.o: main.c
- 		$(COMPILE) -DSIMULATOR -o spice.o  -c $(srcdir)/main.c
- 
- ngspice.idx: makeidx
--	./makeidx $(srcdir)/ngspice.txt
-+	gcc -I/usr/include -I.. -I./include $(makeidx_SOURCES) -o makeidx-host
-+	./makeidx-host $(srcdir)/ngspice.txt
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
- .NOEXPORT:
diff --git a/package/ng-spice-rework/ng-spice-rework.mk b/package/ng-spice-rework/ng-spice-rework.mk
deleted file mode 100644
index 113b59d..0000000
--- a/package/ng-spice-rework/ng-spice-rework.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-#############################################################
-#
-# ng-spice-rework
-#
-#############################################################
-NG_SPICE_REWORK_VERSION = 17
-NG_SPICE_REWORK_SOURCE = ng-spice-rework-$(NG_SPICE_REWORK_VERSION).tar.gz
-NG_SPICE_REWORK_SITE = http://superb-west.dl.sourceforge.net/sourceforge/ngspice
-NG_SPICE_REWORK_AUTORECONF = NO
-NG_SPICE_REWORK_INSTALL_STAGING = NO
-NG_SPICE_REWORK_INSTALL_TARGET = YES
-
-NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
-
-NG_SPICE_REWORK_DEPENDENCIES = xserver_xorg-server xlib_libXaw
-
-$(eval $(call AUTOTARGETS,package,ng-spice-rework))
-
-- 
1.7.2.2
