From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 23:30:47 +0100
Subject: [Buildroot] [git commit] Add package dstat (python script for
	system stats/profiling)
Message-ID: <20120207223219.E32A690A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b9765b8a3dfb1aa2f0f48092df19523aac78f8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: depend on WCHAR as python needs it, fix white space]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/dstat/Config.in |   23 +++++++++++++++++++++++
 package/dstat/dstat.mk  |   15 +++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66ee266..c679652 100644
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
index 0000000..1439c8b
--- /dev/null
+++ b/package/dstat/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_DSTAT
+	bool "dstat"
+	depends on BR2_USE_WCHAR # python
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
+
+comment "dstat requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
new file mode 100644
index 0000000..a19d1d4
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
+$(eval $(call GENTARGETS))
