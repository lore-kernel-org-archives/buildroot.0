From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 16:52:18 +0800
Subject: [Buildroot] [RFC,
	PATCH 4/8] package/powerpc-utils: Add powerpc hardware utilities
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <1389862338.918857.878477328980.4.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds a package definition for the powerpc-utils project,
containing a set of powerpc-specific hardware management utilities.

We're using a git tag from upstream, which contains a few build-system
fixes. We also add a patch to use `reboot` instead of `shutdown -r`,
allowing compatibility with busybox.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Config.in                                                                             |    1 
 package/powerpc-utils/Config.in                                                               |    5 +
 package/powerpc-utils/powerpc-utils-scripts-update_flash-Use-reboot-instead-of-shutdown.patch |   42 ++++++++++
 package/powerpc-utils/powerpc-utils.mk                                                        |   14 +++
 4 files changed, 62 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 78c0e066..61f4c9e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1006,6 +1006,7 @@ source "package/monit/Config.in"
 source "package/ncdu/Config.in"
 source "package/numactl/Config.in"
 source "package/nut/Config.in"
+source "package/powerpc-utils/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
new file mode 100644
index 00000000..c919094a
--- /dev/null
+++ b/package/powerpc-utils/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_POWERPC_UTILS
+	bool "powerpc-utils"
+	select BR2_PACKAGE_ZLIB
+	help
+	  System utilities for powerpc machines
diff --git a/package/powerpc-utils/powerpc-utils-scripts-update_flash-Use-reboot-instead-of-shutdown.patch b/package/powerpc-utils/powerpc-utils-scripts-update_flash-Use-reboot-instead-of-shutdown.patch
new file mode 100644
index 00000000..f3db5338
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils-scripts-update_flash-Use-reboot-instead-of-shutdown.patch
@@ -0,0 +1,42 @@
+From 673507f4163ed313f66fa2c120e7074f8bb3d7c7 Mon Sep 17 00:00:00 2001
+From: Jeremy Kerr <jk@ozlabs.org>
+Date: Wed, 11 Dec 2013 11:54:49 +0800
+Subject: [PATCH] scripts/update_flash: Use reboot instead of shutdown
+
+We don't have shutdown on busybox.
+
+Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
+---
+ scripts/update_flash    |    2 +-
+ scripts/update_flash_nv |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/update_flash b/scripts/update_flash
+index a566a627..32801c64 100755
+--- a/scripts/update_flash
++++ b/scripts/update_flash
+@@ -317,7 +317,7 @@ update_flash_from_file() {
+ 	fi
+ 
+ 	#XXX
+-	shutdown -r now
++	reboot
+ 
+ 	return 0;
+ }
+diff --git a/scripts/update_flash_nv b/scripts/update_flash_nv
+index ead29ef8..e72f01fd 100644
+--- a/scripts/update_flash_nv
++++ b/scripts/update_flash_nv
+@@ -304,7 +304,7 @@ update_flash_from_file() {
+ 	echo_update_return_status "$output"
+ 
+ 	# Reboot system, so that we can flash new image
+-	shutdown -r now
++	reboot
+ 
+ 	exit $E_SUCCESS
+ }
+-- 
+1.7.10.4
+
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
new file mode 100644
index 00000000..15deb2e9
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# powerpc-utils
+#
+#############################################################
+
+POWERPC_UTILS_VERSION = aeb32757
+POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
+POWERPC_UTILS_AUTORECONF = YES
+POWERPC_UTILS_DEPENDENCIES = zlib
+
+POWERPC_UTILS_CONF_OPT += --without-librtas
+
+$(eval $(autotools-package))
