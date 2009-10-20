From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Oct 2009 23:12:23 +0200
Subject: [Buildroot] [git commit master] package: Add sysstat tools
Message-ID: <20091020211255.BC31777738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ad5869528742f90791b6a13b94f1fa49c41e809
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/Config.in          |    1 +
 package/sysstat/Config.in  |   38 ++++++++++++++++++++++++++++++++++++++
 package/sysstat/sysstat.mk |   26 ++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletions(-)
 create mode 100644 package/sysstat/Config.in
 create mode 100644 package/sysstat/sysstat.mk

diff --git a/CHANGES b/CHANGES
index 29e912d..20290dd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,7 +1,7 @@
 2009.11, Not yet released:
 
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
-	sdl_sound, swfdec
+	sdl_sound, swfdec, sysstat
 
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
diff --git a/package/Config.in b/package/Config.in
index ff7fc3d..afcface 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -270,6 +270,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
+source "package/sysstat/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # mdev
 source "package/udev/Config.in"
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
new file mode 100644
index 0000000..b084b41
--- /dev/null
+++ b/package/sysstat/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_SYSSTAT
+	bool "sysstat"
+	help
+          The sysstat utilities are a collection of performance
+          monitoring tools for Linux. These include sar, sadf, mpstat,
+          iostat, pidstat and sa tools.
+
+          Some Features :
+
+           * Input / Output and transfer rate statistics (global, per
+             device, per partition, per network filesystem and per
+             Linux task / PID)
+           * CPU statistics (global, per CPU and per Linux task /
+             PID), including support for virtualization architectures
+           * Memory and swap space utilization statistics
+           * Virtual memory, paging and fault statistics
+           * Per-task (per-PID) memory and page fault statistics
+           * Global CPU and page fault statistics for tasks and all
+             their children
+           * Process creation activity
+           * Interrupt statistics (global, per CPU and per interrupt,
+             including potential APIC interrupt sources)
+           * Extensive network statistics: network interface activity
+             (number of packets and kB received and transmitted per
+             second, etc.) including failures from network devices;
+             network traffic statistics for IP, TCP, ICMP and UDP
+             protocols based on SNMPv2 standards; support for
+             IPv6-related protocols.
+           * NFS server and client activity
+           * Socket statistics
+           * Run queue and system load statistics
+           * Kernel internal tables utilization statistics
+           * System and per Linux task switching activity
+           * Swapping statistics
+           * TTY device activity
+           * Power management statistics
+
+	  http://pagesperso-orange.fr/sebastien.godard/
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
new file mode 100644
index 0000000..324580e
--- /dev/null
+++ b/package/sysstat/sysstat.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# sysstat
+#
+#############################################################
+
+SYSSTAT_VERSION = 9.0.5
+SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
+SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
+SYSSTAT_AUTORECONF = NO
+SYSSTAT_LIBTOOL_PATCH = NO
+SYSSTAT_INSTALL_STAGING = NO
+SYSSTAT_INSTALL_TARGET = YES
+
+# Should be --disable-man-group, it might be a little mistake in the
+# configure.in script.
+SYSSTAT_CONF_OPT = --enable-man-group
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+SYSSTAT_CONF_OPT += --disable-documentation
+endif
+
+# The isag tool is a post processing script that depends on tcl/tk
+# among other things. So we don't install it.
+SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
+
+$(eval $(call AUTOTARGETS,package,sysstat))
-- 
1.6.3.3
