From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Sun, 18 Oct 2009 21:03:09 +0200
Subject: [Buildroot] [PATCH] Add sysstat tools
In-Reply-To: <20091018154732.GB13529@mx.loc>
References: <1255096083.22093.0.camel@coalu.atr>
	<1255118149.2236.3.camel@coalu.atr>
	<1255874745.19306.8.camel@coalu.atr>
	<20091018154732.GB13529@mx.loc>
Message-ID: <1255892589.19306.107.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,

Thanks a lot for reviewing my patch. I made some correction following
your review :

      * The description has been completed (from the sysstat website).
      * I rebased my patch on the last git revision and the
        install-strip rule doesn't seem required anymore, so I removed
        the patch.
      * Removed dependency on uclibc.
      * Filled INSTALL_DOC according to BR2_HAVE_DOCUMENTATION.
      * And last, INSTALL_ISAG is set to 'n' to avoid the isag script
        installation which is a postprocessing script depending on
        tcl/tk.

Maybe later I will add the rules for host installation, but it doesn't
look like a high priority to me.

Here is a new patch :

[PATCH] Add sysstat tools

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/Config.in          |    3 ++-
 package/sysstat/Config.in  |   40 ++++++++++++++++++++++++++++++++++++++++
 package/sysstat/sysstat.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletions(-)
 create mode 100644 package/sysstat/Config.in
 create mode 100644 package/sysstat/sysstat.mk

diff --git a/package/Config.in b/package/Config.in
index ff7fc3d..aa02d2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -270,7 +270,8 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/sysstat/Config.in"
+if BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # mdev
 source "package/udev/Config.in"
 endif
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
new file mode 100644
index 0000000..7e3c707
--- /dev/null
+++ b/package/sysstat/Config.in
@@ -0,0 +1,40 @@
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
+
+	  http://pagesperso-orange.fr/sebastien.godard/
+	  ftp://ibiblio.org/pub/Linux/system/status/
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
new file mode 100644
index 0000000..a1be274
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
+SYSSTAT_INSTALL_STAGING = YES
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
+SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n
+
+$(eval $(call AUTOTARGETS,package,sysstat))
-- 
1.6.4.3
