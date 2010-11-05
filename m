From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 16:53:09 +0100
Subject: [Buildroot] [git commit master 1/1] New package: nuttcp
Message-ID: <20101105155347.DB3848D4B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6097b191d3bfae34c27c077c369869e4b49ff76f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new TCP/UDP network testing tool, that provides some advanced
features compared to ttcp.

[Peter: cleanup, fix FLAGS, move to network]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/Config.in        |    1 +
 package/nuttcp/Config.in |    6 ++++++
 package/nuttcp/nuttcp.mk |   25 +++++++++++++++++++++++++
 4 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 package/nuttcp/Config.in
 create mode 100644 package/nuttcp/nuttcp.mk

diff --git a/CHANGES b/CHANGES
index 7089561..393244a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,7 +25,7 @@
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
 	New packages: argp-standalone, gdk-pixbuf, gpsd, gst-ffmpeg,
-	libmpeg2, librsvg, rng-tools, rrdtool, xz
+	libmpeg2, librsvg, nuttcp, rng-tools, rrdtool, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/Config.in b/package/Config.in
index 4e61ea9..7b35554 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntp/Config.in"
+source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
new file mode 100644
index 0000000..fb6d3b1
--- /dev/null
+++ b/package/nuttcp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NUTTCP
+	bool "nuttcp"
+	help
+	  nuttcp is a TCP/UDP network testing tool, much like iperf
+
+	  http://www.lcp.nrl.navy.mil/nuttcp/nuttcp.html
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
new file mode 100644
index 0000000..e3867ea
--- /dev/null
+++ b/package/nuttcp/nuttcp.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# nuttcp
+#
+#############################################################
+
+NUTTCP_VERSION = 6.1.2
+NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
+NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
+
+define NUTTCP_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define NUTTCP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/nuttcp-$(NUTTCP_VERSION) \
+		$(TARGET_DIR)/usr/bin/nuttcp
+endef
+
+define NUTTCP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/nuttcp
+endef
+
+$(eval $(call GENTARGETS,package,nuttcp))
-- 
1.7.1
