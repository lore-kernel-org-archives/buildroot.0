From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:04 -0700
Subject: [Buildroot] [PATCH] package: add powertop 2.7
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426736888-29437-2-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/Config.in                        |  1 +
 package/powertop/Config.in               |  9 +++++++++
 package/powertop/powertop-autotune.patch |  9 +++++++++
 package/powertop/powertop.hash           |  2 ++
 package/powertop/powertop.mk             | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
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
index 0000000..0e83c8f
--- /dev/null
+++ b/package/powertop/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_POWERTOP
+	bool "powertop"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBNL
+	help
+	  A tool to diagnose issues with power consumption and power management
+
+	  https://01.org/powertop/
diff --git a/package/powertop/powertop-autotune.patch b/package/powertop/powertop-autotune.patch
new file mode 100644
index 0000000..23d6433
--- /dev/null
+++ b/package/powertop/powertop-autotune.patch
@@ -0,0 +1,9 @@
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
index 0000000..b26ae80
--- /dev/null
+++ b/package/powertop/powertop.hash
@@ -0,0 +1,2 @@
+# From https://01.org/sites/default/files/downloads/powertop/powertop-2.7.tar.gz
+sha256	8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca	powertop-2.7.tar.gz
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
new file mode 100644
index 0000000..337688a
--- /dev/null
+++ b/package/powertop/powertop.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# powertop
+#
+################################################################################
+
+POWERTOP_VERSION = 2.7
+POWERTOP_SOURCE = powertop-$(POWERTOP_VERSION).tar.gz
+POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl
+POWERTOP_LICENSE = GPLv2
+POWERTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.3.3
