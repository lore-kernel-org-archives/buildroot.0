From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 00:05:50 +0100
Subject: [Buildroot] [git commit] package/hplip: fixup configure.in script
	for proper autoreconf
Message-ID: <20160121230642.43C79800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fc77e5f81906d774be2710b16166fca48fb3e05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a minor patch to hplip's configure.in script, which
avoids the need to create the AUTOHRS, ChangeLog, NEWS and README
files before autoreconfiguring, and silences a huge number of warnings
telling to enable the subdir-objects automake option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...02-configure.in-fix-AM_INIT_AUTOMAKE-call.patch | 35 ++++++++++++++++++++++
 package/hplip/hplip.mk                             |  8 -----
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
new file mode 100644
index 0000000..7c7538d
--- /dev/null
+++ b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
@@ -0,0 +1,35 @@
+From a2de7e834417de68db10dc6f09d5810b06e6cbc8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 21 Jan 2016 23:54:50 +0100
+Subject: [PATCH] configure.in: fix AM_INIT_AUTOMAKE call
+
+Uncomment the appropriate call to AM_INIT_AUTOMAKE so that the
+"foreign" option is passed, which avoids the need for creating various
+unneeded files when autoreconfiguring.
+
+Add the subdir-objects options since the main Makefile.am references
+files in subdirectories. This allows to silence a huge amount of
+warning when autoreconfiguring.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8b06428..680cad5 100755
+--- a/configure.in
++++ b/configure.in
+@@ -27,8 +27,7 @@
+ 
+ #AC_PREREQ(2.59)
+ AC_INIT([HP Linux Imaging and Printing], [3.15.11], [3.15.11], [hplip])
+-#AM_INIT_AUTOMAKE([1.9 foreign])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([1.9 foreign subdir-objects])
+ AC_DISABLE_STATIC
+ 
+ # Checks for programs.
+-- 
+2.6.4
+
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 62cf9c0..b1e8cb5 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -40,12 +40,4 @@ define HPLIP_POST_INSTALL_TARGET_FIXUP
 endef
 HPLIP_POST_INSTALL_TARGET_HOOKS += HPLIP_POST_INSTALL_TARGET_FIXUP
 
-define HPLIP_PRE_CONFIGURE_FIXUP
-	touch $(@D)/AUTHORS
-	touch $(@D)/ChangeLog
-	touch $(@D)/NEWS
-	touch $(@D)/README
-endef
-HPLIP_PRE_CONFIGURE_HOOKS += HPLIP_PRE_CONFIGURE_FIXUP
-
 $(eval $(autotools-package))
