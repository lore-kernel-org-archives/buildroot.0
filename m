From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:39 +0200
Subject: [Buildroot] [PATCH 19/19] netsnmp: disable build with external
	toolchain
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <52e600ebec9cb571edee8f791da851035ae6b969.1274428596.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a build problem with netsnmp on external toolchain that isn't
easy to fix: libtool strips the --sysroot that we are passing it,
which make the link step fail.

In preparation for the release, just make sure this package isn't
visible to external toolchain users. Of course, on the long run, we
should fix this.

We also disable the build of the Quagga SNMP support because it
selects netsnmp.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/Config.in |    6 ++++++
 package/quagga/Config.in  |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index fd54eb4..810b654 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
+	# Build with external toolchains is broken, libtool strips
+	# --sysroot at link time
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
 
 	  http://net-snmp.sourceforge.net/
+
+comment "lmbench is broken with external toolchains"
+        depends on BR2_TOOLCHAIN_EXTERNAL
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index e540cc6..fb0d590 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -59,8 +59,12 @@ config BR2_PACKAGE_QUAGGA_NETLINK
 
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_NETSNMP
 
+comment "quagga snmp support broken with external toolchains"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "TCP/IP socket connection between zebra and proto daemon"
 
-- 
1.6.3.3
