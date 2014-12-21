From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 20:04:50 +0100
Subject: [Buildroot] [git commit] iperf3: new package
Message-ID: <20141221200821.4E2B780555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cf9c2b8309bad23b6badde81712517f6b1df7de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                           |    1 +
 package/iperf3/0001-disable-profiling.patch |   20 ++++++++++++++++++++
 package/iperf3/Config.in                    |   16 ++++++++++++++++
 package/iperf3/iperf3.mk                    |   12 ++++++++++++
 4 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9747c0e..52a0bc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1043,6 +1043,7 @@ endif
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
 	source "package/iperf/Config.in"
+	source "package/iperf3/Config.in"
 	source "package/iproute2/Config.in"
 	source "package/ipsec-tools/Config.in"
 	source "package/ipset/Config.in"
diff --git a/package/iperf3/0001-disable-profiling.patch b/package/iperf3/0001-disable-profiling.patch
new file mode 100644
index 0000000..09da98e
--- /dev/null
+++ b/package/iperf3/0001-disable-profiling.patch
@@ -0,0 +1,20 @@
+This should be an option, but it's not.
+Don't force profiled builds, it breaks on many toolchains.
+Patch Makefile.in to avoid AUTORECONFing since it needs dummy files
+that are missing to succeed (ChangeLog, COPYING, NEWS, README) and it's
+simple enough so avoid pulling in dependencies and delays.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura iperf-3.0.10.orig/src/Makefile.in iperf-3.0.10/src/Makefile.in
+--- iperf-3.0.10.orig/src/Makefile.in	2014-12-17 07:30:46.878310789 -0300
++++ iperf-3.0.10/src/Makefile.in	2014-12-17 07:33:41.879356643 -0300
+@@ -82,7 +82,7 @@
+ host_triplet = @host@
+ bin_PROGRAMS = iperf3$(EXEEXT)
+ noinst_PROGRAMS = t_timer$(EXEEXT) t_units$(EXEEXT) t_uuid$(EXEEXT) \
+-	iperf3_profile$(EXEEXT)
++	iperf3$(EXEEXT)
+ TESTS = t_timer$(EXEEXT) t_units$(EXEEXT) t_uuid$(EXEEXT)
+ subdir = src
+ DIST_COMMON = $(srcdir)/Makefile.in $(srcdir)/Makefile.am \
diff --git a/package/iperf3/Config.in b/package/iperf3/Config.in
new file mode 100644
index 0000000..1f263ab
--- /dev/null
+++ b/package/iperf3/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IPERF3
+	bool "iperf3"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  iperf is a tool for active measurements of the maximum
+	  achievable bandwidth on IP networks.
+	  It supports tuning of various parameters related to timing,
+	  protocols, and buffers. For each test it reports the bandwidth,
+	  loss, and other parameters.
+	  It's a redesign of the NLANR/DAST iperf(2) and is not
+	  backward compatible.
+
+	  https://github.com/esnet/iperf
+
+comment "iperf3 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
new file mode 100644
index 0000000..b8e594f
--- /dev/null
+++ b/package/iperf3/iperf3.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# iperf3
+#
+################################################################################
+
+IPERF3_VERSION = 3.0.10
+IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
+IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
+IPERF3_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
