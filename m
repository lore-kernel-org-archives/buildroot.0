From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] systemd-bootchart: New package
Message-ID: <20160702144603.6EC69807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36449b3768e482955274e60518f1d22564b16525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas:
 - remove Config.in.legacy option
 - rename the hash file to the correct name
 - add license files.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                 |  7 -------
 package/Config.in                                |  1 +
 package/systemd-bootchart/Config.in              | 21 +++++++++++++++++++++
 package/systemd-bootchart/systemd-bootchart.hash |  2 ++
 package/systemd-bootchart/systemd-bootchart.mk   | 16 ++++++++++++++++
 5 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0dcd930..a135d3d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,13 +145,6 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
-config BR2_PACKAGE_SYSTEMD_BOOTCHART
-	bool "systemd-bootchart option has been removed"
-	help
-	  From systemd v230, bootchart is not part of the systemd
-	  source anymore.  It is now living in its own repository, a
-	  new package must be added.
-
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	help
diff --git a/package/Config.in b/package/Config.in
index 3d2d810..7844cdd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1724,6 +1724,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/syslog-ng/Config.in"
 endif
 	source "package/systemd/Config.in"
+	source "package/systemd-bootchart/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
new file mode 100644
index 0000000..2a70b8d
--- /dev/null
+++ b/package/systemd-bootchart/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "systemd-bootchart"
+	depends on BR2_INIT_SYSTEMD
+	help
+	  systemd-bootchart is a tool, usually run at system startup,
+	  that collects the CPU load, disk load, memory usage, as well
+	  as per-process information from a running system. Collected
+	  results are output as an SVG graph.
+
+	  systemd-bootchart requires a Linux kernel >= 3.0 with the
+	  following options enabled:
+
+	  - CONFIG_SCHEDSTATS
+	  - CONFIG_SCHED_DEBUG
+
+	  These options will be automatically enabled by Buildroot if
+	  it is responsible for building the kernel. Otherwise, if you
+	  are building your kernel outside of Buildroot, make sure
+	  these options are enabled.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
diff --git a/package/systemd-bootchart/systemd-bootchart.hash b/package/systemd-bootchart/systemd-bootchart.hash
new file mode 100644
index 0000000..c347ef5
--- /dev/null
+++ b/package/systemd-bootchart/systemd-bootchart.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
new file mode 100644
index 0000000..4fdd712
--- /dev/null
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# systemd-bootchart
+#
+################################################################################
+
+SYSTEMD_BOOTCHART_VERSION = 230
+SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
+# Do not use the github helper here, the generated tarball is *NOT* the same
+# as the one uploaded by upstream for the release.
+SYSTEMD_BOOTCHART_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(SYSTEMD_BOOTCHART_VERSION)
+SYSTEMD_BOOTCHART_LICENSE = LGPLv2.1+
+SYSTEMD_BOOTCHART_LICENSE_FILES = LICENSE.LGPL2.1
+SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
+
+$(eval $(autotools-package))
