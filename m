From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 20:56:25 -0300
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix another bug
Message-ID: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcpcd needs a toolchain with getifaddrs support which the current
blackfin toolchain lacks. Fixes:
http://autobuild.buildroot.net/results/f4dd9ca2774bc89e6f976d75a13190d8a1e457f3/

This is not detected by dhcpcd's configure because it's being called
with default (non-cross) CC and other variables.
Thus pass TARGET_CONFIGURE_OPTS to configure to fix this.
Fixes another build failure i've encountered where the host has very
modern headers and dhcpcd tries to use the latest features which the
cross toolchain lacks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/Config.in | 1 +
 package/dhcpcd/dhcpcd.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index a06a973..a032694 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCPCD
 	depends on BR2_INET_IPV6
+	depends on !BR2_bfin
 	bool "dhcpcd"
 	help
 	  An RFC2131 compliant DHCP client
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 9d4a72b..28da6cd 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -15,7 +15,7 @@ endif
 
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
-	./configure \
+	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
 		$(DHCPCD_CONFIG_OPT) )
-- 
1.8.1.5
