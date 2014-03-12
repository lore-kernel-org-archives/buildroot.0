From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 12 Mar 2014 11:45:57 +0800
Subject: [Buildroot] [PATCH 09/10 v2] package/iprutils: Add IBM Power RAID
	utilities
In-Reply-To: <1394595957.563937.119075350083.0.gpush@pablo>
Message-ID: <1394595957.566789.595625760281.9.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Config.in                                   |    1 
 package/iprutils/Config.in                          |   10 ++++
 package/iprutils/iprutils-01-dont-use-gettext.patch |   30 ++++++++++++
 package/iprutils/iprutils.mk                        |   26 ++++++++++
 4 files changed, 67 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d98688c..d62731d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1056,6 +1056,7 @@ endif
 source "package/cpuload/Config.in"
 source "package/dsp-tools/Config.in"
 source "package/htop/Config.in"
+source "package/iprutils/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 source "package/lxc/Config.in"
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
new file mode 100644
index 0000000..d72688f
--- /dev/null
+++ b/package/iprutils/Config.in
@@ -0,0 +1,10 @@
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
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
new file mode 100644
index 0000000..15de9af
--- /dev/null
+++ b/package/iprutils/iprutils.mk
@@ -0,0 +1,26 @@
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
+	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
+endef
+
+define IPRUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/iprconfig $(TARGET_DIR)/sbin/iprconfig
+	$(INSTALL) -D -m 0755 $(@D)/iprupdate $(TARGET_DIR)/sbin/iprupdate
+	$(INSTALL) -D -m 0755 $(@D)/iprdump $(TARGET_DIR)/sbin/iprdump
+	$(INSTALL) -D -m 0755 $(@D)/iprinit $(TARGET_DIR)/sbin/iprinit
+	$(INSTALL) -D -m 0755 $(@D)/iprdbg $(TARGET_DIR)/sbin/iprdbg
+endef
+
+$(eval $(generic-package))
