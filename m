From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Mar 2010 11:54:22 +0100
Subject: [Buildroot] [git commit master] Add new netperf package
Message-ID: <20100325105618.E0D937FB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed91e786e674122163620c2d15e7a000b6427af5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1105

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/Config.in          |    1 +
 package/netperf/Config.in  |    6 ++++++
 package/netperf/netperf.mk |   25 +++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 package/netperf/Config.in
 create mode 100644 package/netperf/netperf.mk

diff --git a/CHANGES b/CHANGES
index 533a8e6..bd8d658 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync, lmbench, squid
+	New packages: librsync, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, less, libglib2, libpng, mdadm, memstat,
@@ -17,6 +17,7 @@
 	#661: lmbench: new package
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
+	#1105: Add new netperf package
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
 	#1123: Bump less to 436 and migrate to Makefile.autotools.in
diff --git a/package/Config.in b/package/Config.in
index 3070264..dda3f67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -179,6 +179,7 @@ source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
+source "package/netperf/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
diff --git a/package/netperf/Config.in b/package/netperf/Config.in
new file mode 100644
index 0000000..2f36b1b
--- /dev/null
+++ b/package/netperf/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NETPERF
+	bool "netperf"
+	help
+	  Network performance benchmark tool
+
+	  http://www.netperf.org/
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
new file mode 100644
index 0000000..d198eee
--- /dev/null
+++ b/package/netperf/netperf.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# netperf
+#
+#############################################################
+
+NETPERF_VERSION = 2.4.5
+NETPERF_SITE = ftp://ftp.netperf.org/netperf
+NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
+
+$(eval $(call AUTOTARGETS,package,netperf))
+
+$(NETPERF_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(NETPERF_DIR)/src/netperf \
+		$(TARGET_DIR)/usr/bin/netperf
+	$(INSTALL) -m 0755 $(NETPERF_DIR)/src/netserver \
+		$(TARGET_DIR)/usr/bin/netserver
+	touch $@
+
+$(NETPERF_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/netperf
+	rm -f $(TARGET_DIR)/usr/bin/netserver
+	rm -f $(NETPERF_TARGET_INSTALL_TARGET) $(NETPERF_HOOK_POST_INSTALL)
-- 
1.6.3.3
