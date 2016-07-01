From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:52:29 +0200
Subject: [Buildroot] [PATCH 2/3] systemd-bootchart: New package
In-Reply-To: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409950-9628-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy                                |  6 -----
 package/Config.in                               |  1 +
 package/systemd-bootchart/Config.in             | 34 +++++++++++++++++++++++++
 package/systemd-bootchart/system-bootchart.hash |  3 +++
 package/systemd-bootchart/systemd-bootchart.mk  | 15 +++++++++++
 5 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 package/systemd-bootchart/Config.in
 create mode 100644 package/systemd-bootchart/system-bootchart.hash
 create mode 100644 package/systemd-bootchart/systemd-bootchart.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 802eea3..34bdaf0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -369,12 +369,6 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	  removed. To get the same features, the libgcrypt and xz
 	  package should now be enabled.
 
-config BR2_PACKAGE_SYSTEMD_BOOTCHART
-	bool "systemd-bootchart option has been removed"
-	help
-	  From systemd v230, bootchart is not part of the systemd source anymore.
-	  It is now living in its own repository, a new package must be added.
-
 config BR2_GCC_VERSION_4_5_X
 	bool "gcc 4.5.x has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1bf7b1c..27519f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1715,6 +1715,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/syslog-ng/Config.in"
 endif
 	source "package/systemd/Config.in"
+	source "package/systemd-bootchart/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
new file mode 100644
index 0000000..c6ebc93
--- /dev/null
+++ b/package/systemd-bootchart/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
+	bool
+	# see src/shared/architecture.h
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
+		BR2_aarch64 || BR2_m68k
+
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "systemd-bootchart"
+	depends on BR2_INIT_SYSTEMD
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_STATIC_LIBS # kmod
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
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
index 0000000..d411ae7
--- /dev/null
+++ b/package/systemd-bootchart/system-bootchart.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
+
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
