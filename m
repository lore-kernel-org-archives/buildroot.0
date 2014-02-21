From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Feb 2014 09:54:50 +0100
Subject: [Buildroot] [PATCH] dhcpcd: disable on static library builds
Message-ID: <1392972890-21552-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcpcd uses dlopen(), so it is not compatible with pure static library
builds.

Fixes:

  http://autobuild.buildroot.net/results/512/51249e8d3487e17bb6a60a99dcbd461f7b591eac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index ac20615..68eac1c 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -3,7 +3,13 @@ config BR2_PACKAGE_DHCPCD
 	# No support for AI_ADDRCONFIG
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  An RFC2131 compliant DHCP client
 
 	  http://roy.marples.name/downloads/dhcpcd
+
+comment "dhcpcd needs a toolchain w/ dynamic library"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
