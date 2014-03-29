From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 15:53:44 +0100
Subject: [Buildroot] [git commit] package/iprutils: Add IBM Power RAID
	utilities
Message-ID: <20140329145416.13EA79C3EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e3ded0d75b00bb212b373a42851db98b79e28c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add patch to allow passing CFLAGS from the environment, use
TARGET_CONFIGURE_OPTS instead of manually passing CC/LD, add upstream
URL in Config.in, use the Makefile install target instead of
open-coding the installation in iprutils.mk.]

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/iprutils/Config.in                         |   12 ++++++++
 .../iprutils/iprutils-01-dont-use-gettext.patch    |   30 ++++++++++++++++++++
 .../iprutils-02-use-environment-cflags.patch       |   20 +++++++++++++
 package/iprutils/iprutils.mk                       |   22 ++++++++++++++
 5 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 394f0a5..a9d1633 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ endif
 source "package/cpuload/Config.in"
 source "package/dsp-tools/Config.in"
 source "package/htop/Config.in"
+source "package/iprutils/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 source "package/lxc/Config.in"
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
new file mode 100644
index 0000000..a7e3cb3
--- /dev/null
+++ b/package/iprutils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_IPRUTILS
+	bool "iprutils"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	select BR2_PACKAGE_LIBSYSFS
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  System utilities for IBM Power RAID devices
+
+	  http://sourceforge.net/projects/iprdd/
diff --git a/package/iprutils/iprutils-01-dont-use-gettext.patch b/package/iprutils/iprutils-01-dont-use-gettext.patch
new file mode 100644
index 0000000..8d3d5dd
--- /dev/null
+++ b/package/iprutils/iprutils-01-dont-use-gettext.patch
@@ -0,0 +1,30 @@
+From 0aa3952890e14f5447147ae4d0d37c515e4fefea Mon Sep 17 00:00:00 2001
+From: Jeremy Kerr <jk@ozlabs.org>
+Date: Fri, 26 Jul 2013 13:07:22 +0800
+Subject: [PATCH] iprconfig: Don't use gettext
+
+... since we don't have any translations.
+
+Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
+---
+ iprconfig.h |    4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/iprconfig.h b/iprconfig.h
+index 867b5ac..a9cdf5e 100644
+--- a/iprconfig.h
++++ b/iprconfig.h
+@@ -11,9 +11,7 @@
+  *
+  **/
+ 
+-#include <libintl.h>
+-
+-#define _(string) gettext(string)
++#define _(string) (string)
+ #define __(string) (string)
+ #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
+ #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
+-- 
+1.7.10.4
+
diff --git a/package/iprutils/iprutils-02-use-environment-cflags.patch b/package/iprutils/iprutils-02-use-environment-cflags.patch
new file mode 100644
index 0000000..8eab450
--- /dev/null
+++ b/package/iprutils/iprutils-02-use-environment-cflags.patch
@@ -0,0 +1,20 @@
+Allow CFLAGS to be extended from the environment
+
+We also remove -g, since we don't necessarily want to build with
+debugging symbols. Buildroot will add -g if needed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -9,7 +9,7 @@
+ 
+ include version.mk
+ 
+-CFLAGS = -g -Wall $(IPR_DEFINES)
++override CFLAGS += -Wall $(IPR_DEFINES)
+ UTILS_VER = $(IPR_MAJOR_RELEASE).$(IPR_MINOR_RELEASE).$(IPR_FIX_LEVEL)
+ TAR = cd .. && tar -zcpf iprutils-$(UTILS_VER)-src.tgz --exclude CVS --exclude applied-patches --exclude series --exclude txt --exclude pc --exclude patches --exclude debug --exclude *~* iprutils
+ 
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
new file mode 100644
index 0000000..48934d0
--- /dev/null
+++ b/package/iprutils/iprutils.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# iprutils
+#
+################################################################################
+
+IPRUTILS_VERSION = 2.3.15
+IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
+IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz
+IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
+IPRUTILS_LICENSE = Common Public License Version 1.0
+IPRUTILS_LICENSE_FILES = LICENSE
+
+define IPRUTILS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define IPRUTILS_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) INSTALL_MOD_PATH=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
