From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Jun 2012 13:27:45 -0300
Subject: [Buildroot] [PATCH] quagga: fix non-IPv6 build failures
Message-ID: <1338654465-3145-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Zebra daemon now requires IPv6 support so disable it for non-IPv6
toolchains and add a comment mentioning it.
The BABEL protocol/daemon also requires IPv6 so just enable it when it's
available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 5a01863..0834201 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -10,11 +10,16 @@ if BR2_PACKAGE_QUAGGA
 
 config BR2_PACKAGE_QUAGGA_ZEBRA
 	bool "zebra daemon"
+	depends on BR2_INET_IPV6
 	help
 	  Build zebra daemon.
 
+comment "Zebra daemon requires a toolchain with IPV6 support"
+	depends on BR2_PACKAGE_QUAGGA && !BR2_INET_IPV6
+
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "Use TCP sockets between zebra and protocol daemons"
+	depends on BR2_PACKAGE_QUAGGA_ZEBRA
 	help
 	  Use a TCP socket to communicate between zebra (supervisor) and
 	  the different protocol daemons.
@@ -24,6 +29,7 @@ config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 
 config BR2_PACKAGE_QUAGGA_BABELD
 	bool "BABEL protocol"
+	depends on BR2_INET_IPV6
 	help
 	  Build babeld daemon.
 
-- 
1.7.3.4
