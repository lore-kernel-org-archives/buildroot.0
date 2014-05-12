From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 22:04:08 +0200
Subject: [Buildroot] [PATCH] radvd: not available on AVR32
Message-ID: <1399925048-5117-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

radvd needs some C library definitions not available in old uClibc
versions. Since we don't care much about AVR32, we simply disallow the
radvd package on this architecture.

Fixes:

  http://autobuild.buildroot.org/results/f03/f0367a30e8d772eb5e955a85b853ec3e43fe54b3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 6edfd7c..71f2f34 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_RADVD
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_LIBDAEMON
 	depends on BR2_INET_IPV6
+	# uClibc too old, does not define ARPHRD_IEEE802154
+	depends on !BR2_avr32
 	help
 	  IPv6 Router Advertisement Daemon.
 
@@ -13,3 +15,4 @@ config BR2_PACKAGE_RADVD
 comment "radvd needs a toolchain w/ IPv6"
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
+	depends on !BR2_avr32
-- 
1.9.2
