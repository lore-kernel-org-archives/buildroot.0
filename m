From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 15:59:14 +0200
Subject: [Buildroot] [PATCH 8/9] systemd-bootchart: New package
In-Reply-To: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467467955-14609-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
    - Remove depends that were copied from systemd
    - Remove empty line in hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                               |  1 +
 package/systemd-bootchart/Config.in             | 21 +++++++++++++++++++++
 package/systemd-bootchart/system-bootchart.hash |  2 ++
 package/systemd-bootchart/systemd-bootchart.mk  | 15 +++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/systemd-bootchart/Config.in
 create mode 100644 package/systemd-bootchart/system-bootchart.hash
 create mode 100644 package/systemd-bootchart/systemd-bootchart.mk

diff --git a/package/Config.in b/package/Config.in
index 5779d04..75298e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1723,6 +1723,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/syslog-ng/Config.in"
 endif
 	source "package/systemd/Config.in"
+	source "package/systemd-bootchart/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
new file mode 100644
index 0000000..58fcfbb
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
+	  systemd-bootchart requires a Linux kernel >= 3.0 with the following
+	  options enabled:
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
diff --git a/package/systemd-bootchart/system-bootchart.hash b/package/systemd-bootchart/system-bootchart.hash
new file mode 100644
index 0000000..c347ef5
--- /dev/null
+++ b/package/systemd-bootchart/system-bootchart.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
new file mode 100644
index 0000000..c371b9f
--- /dev/null
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -0,0 +1,15 @@
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
+SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
+
+$(eval $(autotools-package))
-- 
2.8.1
