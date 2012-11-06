From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue,  6 Nov 2012 10:05:26 +0100
Subject: [Buildroot] [PATCH v2] package: add libpthsem
Message-ID: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                                  |    1 +
 package/libpthsem/Config.in                        |    9 ++++++
 ...bpthsem-2.0.8-fix-build-on-linux-3.x-host.patch |   28 +++++++++++++++++
 package/libpthsem/libpthsem.mk                     |   33 ++++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 package/libpthsem/Config.in
 create mode 100644 package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
 create mode 100644 package/libpthsem/libpthsem.mk

diff --git a/package/Config.in b/package/Config.in
index e531c41..941b458 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
+source "package/libpthsem/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
new file mode 100644
index 0000000..f818ee0
--- /dev/null
+++ b/package/libpthsem/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBPTHSEM
+	bool "libpthsem"
+	select BR2_PACKAGE_ARGP_STANDALONE
+	help
+	  GNU pth is a user mode multi threading library. pthsem is an extend
+	  version, with support for semaphores added.
+
+	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+
diff --git a/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch b/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
new file mode 100644
index 0000000..21fff4e
--- /dev/null
+++ b/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
@@ -0,0 +1,28 @@
+From 2d0450bfa3fb7003098da1a7fe24c3ae140912dc Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Mon, 22 Oct 2012 15:11:53 +0200
+Subject: [PATCH] pthsem build on Linux 3.x host
+
+
+Signed-off-by: Michael Markstaller <mm@elabnet.de>
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ acinclude.m4 |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 03b42de..fea9bc8 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -892,6 +892,8 @@ case $PLATFORM in
+         case "x`uname -r`" in
+ changequote(, )dnl
+             x2.[23456789]* ) ;;
++changequote(, )dnl
++            x3.* ) ;;
+ changequote([, ])
+             * ) braindead=yes ;;
+         esac
+-- 
+1.7.9.5
+
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
new file mode 100644
index 0000000..4fc9095
--- /dev/null
+++ b/package/libpthsem/libpthsem.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# libpthsem
+#
+#############################################################
+
+LIBPTHSEM_VERSION = 2.0.8
+LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
+LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth/
+LIBPTHSEM_LICENSE = LGPLv2.1+
+LIBPTHSEM_LICENSE_FILES = COPYING
+LIBPTHSEM_AUTORECONF = YES
+LIBPTHSEM_INSTALL_STAGING = YES
+LIBPTHSEM_DEPENDENCIES = argp-standalone
+
+define LIBPTHSEM_STAGING_LIBPTHSEM_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/pthsem-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/pthsem-config
+endef
+
+LIBPTHSEM_POST_INSTALL_STAGING_HOOKS += LIBPTHSEM_STAGING_LIBPTHSEM_CONFIG_FIXUP
+
+define LIBPTHSEM_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/pthsem-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBPTHSEM_POST_INSTALL_TARGET_HOOKS += LIBPTHSEM_REMOVE_CONFIG_SCRIPTS
+endif
+
+
+$(eval $(autotools-package))
+
-- 
1.7.9.5
