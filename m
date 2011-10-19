From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 19 Oct 2011 09:35:48 +0200
Subject: [Buildroot] [PATCH] Add package dstat (python script for system
	stats/profiling)
Message-ID: <065235b516815a6408a6.1318931355@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -19,6 +19,7 @@ endmenu
 menu "Debugging, profiling and benchmark"
 source "package/bonnie/Config.in"
 source "package/dhrystone/Config.in"
+source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
 source "package/kexec/Config.in"
 source "package/lmbench/Config.in"
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
new file mode 100644
--- /dev/null
+++ b/package/dstat/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_DSTAT
+	bool "dstat"
+	select BR2_PACKAGE_PYTHON
+	help
+	  Dstat, written in Python, is a versatile replacement for vmstat,
+	  iostat, netstat and ifstat. Dstat overcomes some of their limitations
+	  and adds some extra features, more counters and flexibility. Dstat is
+	  handy for monitoring systems during performance tuning tests,
+	  benchmarks or troubleshooting.
+	  Dstat allows you to view all of your system resources in real-time,
+	  you can e.g. compare disk utilization in combination with interrupts
+	  from your IDE controller, or compare the network bandwidth numbers
+	  directly with the disk throughput (in the same interval).
+	
+	  Note that to get proper output, your terminal size should be known by
+	  the termios subsystem. This can be done by running the 'resize'
+	  utility of busybox.
+	
+	  http://dag.wieers.com/home-made/dstat/ 
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
new file mode 100644
--- /dev/null
+++ b/package/dstat/dstat.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# dstat
+#
+#############################################################
+
+DSTAT_VERSION = 0.7.2
+DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
+DSTAT_SITE = http://dag.wieers.com/home-made/dstat
+
+define DSTAT_INSTALL_TARGET_CMDS
+       $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS,package,dstat))
