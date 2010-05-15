From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:37 +0200
Subject: [Buildroot] [PATCH 12/12] netsnmp: disable build with external
	toolchain
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0b3a9a65f581c1cc9998e491dfd54cd5aa407448.1273965305.git.thomas.petazzoni@free-electrons.com>
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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index fd54eb4..91e8efb 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
+	# Build with external toolchains is broken, libtool strips
+	# --sysroot at link time
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
-- 
1.6.3.3
