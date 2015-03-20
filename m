From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 16:28:27 +0100
Subject: [Buildroot] [git commit] powertop: new package
Message-ID: <20150320152859.A5E3B8186A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0adc0e24eed72efca0097c7567319f07b8af6d94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - fix commit title
  - powertop wants libintl unconditionally, so make sure
    BR2_PACKAGE_GETTEXT is selected when BR2_NEEDS_GETTEXT is set, and
    add gettext to the dependencies.
  - add missing comment about thread dependency.
  - add missing dependency on host-pkgconf, without which powertop
    cannot find libnl.
  - patch src/Makefile.am to not pass -fstack-protector, which fails
    to build if the toolchain does not have SSP support.
  - rename patch powertop-autotune.patch to confirm to the patch
    naming convention.]

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../0001-autotune-fix-use-after-close.patch        |   15 +++++++++++++++
 ...0002-dont-force-stack-smashing-protection.patch |   18 ++++++++++++++++++
 package/powertop/Config.in                         |   18 ++++++++++++++++++
 package/powertop/powertop.hash                     |    2 ++
 package/powertop/powertop.mk                       |   20 ++++++++++++++++++++
 6 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 96e373a..d310abc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ endif
 	source "package/pciutils/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
+	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
diff --git a/package/powertop/0001-autotune-fix-use-after-close.patch b/package/powertop/0001-autotune-fix-use-after-close.patch
new file mode 100644
index 0000000..f2b3dff
--- /dev/null
+++ b/package/powertop/0001-autotune-fix-use-after-close.patch
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
diff --git a/package/powertop/0002-dont-force-stack-smashing-protection.patch b/package/powertop/0002-dont-force-stack-smashing-protection.patch
new file mode 100644
index 0000000..75ed2d1
--- /dev/null
+++ b/package/powertop/0002-dont-force-stack-smashing-protection.patch
@@ -0,0 +1,18 @@
+Do not pass -fstack-protector unconditionally
+
+Using -fstack-protector only works when the toolchain has SSP support.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile.am
+===================================================================
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -127,7 +127,6 @@
+ 	-Wformat \
+ 	-Wshadow \
+ 	-fno-omit-frame-pointer \
+-	-fstack-protector \
+ 	$(GLIB2_CFLAGS) \
+ 	$(LIBNL_CFLAGS) \
+ 	$(NCURSES_CFLAGS) \
diff --git a/package/powertop/Config.in b/package/powertop/Config.in
new file mode 100644
index 0000000..f157f46
--- /dev/null
+++ b/package/powertop/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_POWERTOP
+	bool "powertop"
+	# pciutils dependency
+	depends on !BR2_bfin
+	# libnl dependency
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  A tool to diagnose issues with power consumption and power management
+
+	  https://01.org/powertop/
+
+comment "powertop needs a toolchain w/ threads"
+	depends on !BR2_bfin
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..43d70a3
--- /dev/null
+++ b/package/powertop/powertop.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# powertop
+#
+################################################################################
+
+POWERTOP_VERSION = 2.7
+POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf
+POWERTOP_LICENSE = GPLv2
+POWERTOP_LICENSE_FILES = COPYING
+# We're patching Makefile.am
+POWERTOP_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+POWERTOP_DEPENDENCIES += gettext
+POWERTOP_CONF_ENV += LIBS='-lintl'
+endif
+
+$(eval $(autotools-package))
