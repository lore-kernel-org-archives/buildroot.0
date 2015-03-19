From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 22:40:21 -0700
Subject: [Buildroot] [PATCH] package: add powertop 2.7
Message-ID: <1426743621-1652-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---

v2:
  - Propagate dependencies from libnl and pciutils.
  - Add description for powertop-autotune.patch.
  - Fix hash origin data.
  - Remove defaults-satisfied POWERTOP_SOURCE value.

 package/Config.in                        |  1 +
 package/powertop/Config.in               | 13 +++++++++++++
 package/powertop/powertop-autotune.patch | 15 +++++++++++++++
 package/powertop/powertop.hash           |  2 ++
 package/powertop/powertop.mk             | 13 +++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/powertop/Config.in
 create mode 100644 package/powertop/powertop-autotune.patch
 create mode 100644 package/powertop/powertop.hash
 create mode 100644 package/powertop/powertop.mk

diff --git a/package/Config.in b/package/Config.in
index 4ee489c..c938326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ endif
 	source "package/pciutils/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
+	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
diff --git a/package/powertop/Config.in b/package/powertop/Config.in
new file mode 100644
index 0000000..202c951
--- /dev/null
+++ b/package/powertop/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_POWERTOP
+	bool "powertop"
+	# pciutils dependency
+	depends on !BR2_bfin
+	# libnl dependency
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBNL
+	help
+	  A tool to diagnose issues with power consumption and power management
+
+	  https://01.org/powertop/
diff --git a/package/powertop/powertop-autotune.patch b/package/powertop/powertop-autotune.patch
new file mode 100644
index 0000000..f2b3dff
--- /dev/null
+++ b/package/powertop/powertop-autotune.patch
@@ -0,0 +1,15 @@
+Patch pulled from https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/powertop&id=37469c47b885c50365f57044e4ad72e0e3512b91
+
+Fixes a use-after-close bug in create_all_devfreq_devices().
+
+Signed-off-by: Steven Noonan <steven@uplinklabs.net>
+
+--- a/src/devices/devfreq.cpp
++++ b/src/devices/devfreq.cpp
+@@ -247,6 +247,7 @@ void create_all_devfreq_devices(void)
+		fprintf(stderr, "Devfreq not enabled\n");
+		is_enabled = false;
+		closedir(dir);
++		dir = NULL;
+		return;
+	}
diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
new file mode 100644
index 0000000..b64981e
--- /dev/null
+++ b/package/powertop/powertop.hash
@@ -0,0 +1,2 @@
+# Locally-generated hash
+sha256	8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca	powertop-2.7.tar.gz
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
new file mode 100644
index 0000000..3d0c1ab
--- /dev/null
+++ b/package/powertop/powertop.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# powertop
+#
+################################################################################
+
+POWERTOP_VERSION = 2.7
+POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl
+POWERTOP_LICENSE = GPLv2
+POWERTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.3.3
