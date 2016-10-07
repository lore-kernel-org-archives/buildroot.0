From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  7 Oct 2016 17:30:29 -0300
Subject: [Buildroot] [PATCH 2/4] netatop: new package
In-Reply-To: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007203031.21528-2-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optional kernel module netatop can be loaded to gather statistics
about the TCP and UDP packets that have been transmitted/received per
process and per thread.

- install only the basic functionality (module and init script).

- use a source file as license file.
  Maintainer will add license file to the next version.

- add patch to init script to support busybox ps.
  Patch was accepted upstream.

Support for extra functionality can be added by follow-up patches:
- enable daemon that monitors processes that are finished.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
- Sample output from atop -n with netatop loaded:
ATOP - buildroot    1970/01/01  00:00:37    -------------    10s elapsed
PRC |  sys    2.61s  |  user   5.63s |  #proc     38  |  no  procacct  |
CPU |  sys      36%  |  user     64% |  idle      0%  |  wait      0%  |
CPL |  avg1    0.28  |  avg5    0.06 |  csw     8323  |  intr    4040  |
MEM |  tot   122.2M  |  free  110.2M |  buff    0.2M  |  slab    1.9M  |
SWP |  tot     0.0M  |  free    0.0M |  vmcom   7.4M  |  vmlim  61.1M  |
NET |  transport     |  tcpo    3038 |  udpi       0  |  udpo       0  |
NET |  network       |  ipo     3038 |  ipfrw      0  |  deliv   3038  |
NET |  eth0      0%  |  pcki    3038 |  pcko    3038  |  so  389 Kbps  |

   PID TCPRCV  TCPSND  UDPSND    BANDWI     BANDWO   NET CMD         1/1
   123   3037    3037       0  140 Kbps   398 Kbps  100% dropbear
   117      1       1       0    0 Kbps     0 Kbps    0% dropbear
   124      0       0       0    0 Kbps     0 Kbps    0% sh

- I first created the patch to fix the init script operation when the
  daemon is installed. Then I decided to send the minimal package as
  first version and add more functionalities in follow-up commits. But I
  noticed the same patch to the init script is needed to make the stop
  operation exit cleanly (without message like 'can't kill pid' because
  it tries to kill the grep that is looking for the daemon). So I
  decided to keep the patch file in these first commits.
---
 package/Config.in                                   |  1 +
 package/atop/Config.in                              |  3 +++
 ...1-Ensure-init-script-stops-the-correct-pid.patch | 21 +++++++++++++++++++++
 package/netatop/Config.in                           | 21 +++++++++++++++++++++
 package/netatop/netatop.hash                        |  2 ++
 package/netatop/netatop.mk                          | 21 +++++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 package/netatop/0001-Ensure-init-script-stops-the-correct-pid.patch
 create mode 100644 package/netatop/Config.in
 create mode 100644 package/netatop/netatop.hash
 create mode 100644 package/netatop/netatop.mk

diff --git a/package/Config.in b/package/Config.in
index a1da86a..5ced012 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -95,6 +95,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-tools/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
+	source "package/netatop/Config.in"
 	source "package/netperf/Config.in"
 	source "package/netsniff-ng/Config.in"
 	source "package/oprofile/Config.in"
diff --git a/package/atop/Config.in b/package/atop/Config.in
index d42a201..5bcca0f 100644
--- a/package/atop/Config.in
+++ b/package/atop/Config.in
@@ -15,4 +15,7 @@ config BR2_PACKAGE_ATOP
 	  CPU utilization, memory growth, disk utilization, priority,
 	  username, state, and exit code.
 
+	  In combination with the optional kernel module netatop, it
+	  even shows network activity per process/thread.
+
 	  http://www.atoptool.nl
diff --git a/package/netatop/0001-Ensure-init-script-stops-the-correct-pid.patch b/package/netatop/0001-Ensure-init-script-stops-the-correct-pid.patch
new file mode 100644
index 0000000..95784c8
--- /dev/null
+++ b/package/netatop/0001-Ensure-init-script-stops-the-correct-pid.patch
@@ -0,0 +1,21 @@
+Ensure init script stops the correct pid
+
+'ps' from busybox shows the pid of grep.
+Ignore the pid of the grep process, leaving only the pid of the daemon.
+
+Patch status: accepted upstream.
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
+---
+diff -purN netatop-1.0.orig/netatop.init netatop-1.0/netatop.init
+--- netatop-1.0.orig/netatop.init	2016-07-15 21:22:43.646062649 -0300
++++ netatop-1.0/netatop.init	2016-07-15 21:37:18.378936625 -0300
+@@ -26,7 +26,7 @@ start() {
+ }
+ 
+ stop() {
+-	PID=$(ps -e | grep netatopd | sed -e 's/^ *//' -e 's/ .*//')
++	PID=$(ps -e | grep -v grep | grep netatopd | sed -e 's/^ *//' -e 's/ .*//')
+ 
+ 	if [ "$PID" ]
+ 	then
diff --git a/package/netatop/Config.in b/package/netatop/Config.in
new file mode 100644
index 0000000..f54a55f
--- /dev/null
+++ b/package/netatop/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_NETATOP
+	bool "netatop"
+	depends on BR2_USE_MMU # atop
+	depends on BR2_LINUX_KERNEL
+	# kernel headers: >= 2.6.24
+	select BR2_PACKAGE_ATOP # runtime
+	help
+	  The optional kernel module netatop can be loaded to gather
+	  statistics about the TCP and UDP packets that have been
+	  transmitted/received per process and per thread.
+
+	  Netatop requires a Linux kernel >= 2.6.24 with the following
+	  option enabled:
+
+	  - CONFIG_NETFILTER
+
+	  http://www.atoptool.nl/netatop.php
+
+comment "netatop needs a Linux kernel >= 2.6.24 to be built"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/netatop/netatop.hash b/package/netatop/netatop.hash
new file mode 100644
index 0000000..f721ddd
--- /dev/null
+++ b/package/netatop/netatop.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0bdde8315d2c6e4a1d87fd10d27659d76d07949b31f0dc5e81662e67e1d0fdd0  netatop-1.0.tar.gz
diff --git a/package/netatop/netatop.mk b/package/netatop/netatop.mk
new file mode 100644
index 0000000..623bed7
--- /dev/null
+++ b/package/netatop/netatop.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# netatop
+#
+################################################################################
+
+NETATOP_VERSION = 1.0
+NETATOP_SITE = http://www.atoptool.nl/download
+NETATOP_LICENSE = GPLv2
+# no license file. It will be added for the next version
+NETATOP_LICENSE_FILES = module/netatop.c
+
+NETATOP_MODULE_SUBDIRS = module
+
+define NETATOP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/netatop.init \
+		$(TARGET_DIR)/etc/init.d/S50netatop
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.9.3
