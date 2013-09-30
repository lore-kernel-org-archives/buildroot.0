From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 30 Sep 2013 15:40:26 +0200
Subject: [Buildroot] [PATCH] dhcpcd: add option to override dbdir
Message-ID: <1380548426-26780-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/dhcpcd/Config.in | 14 ++++++++++++++
 package/dhcpcd/dhcpcd.mk |  1 +
 2 files changed, 15 insertions(+)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index a06a973..c144dd3 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -6,5 +6,19 @@ config BR2_PACKAGE_DHCPCD
 
 	  http://roy.marples.name/downloads/dhcpcd
 
+if BR2_PACKAGE_DHCPCD
+
+config BR2_PACKAGE_DHCPCD_DBDIR
+	string "database directory"
+	default "/var/db"
+	help
+	  By default dhcpcd stores obtained DHCP leases and other info in
+	  /var/db. Set this to any other directory you wish to use. This must
+	  be on a read-write filesystem, otherwise dhcpcd will not work.
+	  For example, you may want to change this directory if /var is on a
+	  read-only filesystem in your embedded system.
+
+endif
+
 comment "dhcpcd requires a toolchain with IPV6 support"
 	depends on !BR2_INET_IPV6
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5296db8..4d0e86c 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -18,6 +18,7 @@ define DHCPCD_CONFIGURE_CMDS
 	./configure \
 		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
+		--dbdir=$(BR2_PACKAGE_DHCPCD_DBDIR) \
 		$(DHCPCD_CONFIG_OPT) )
 endef
 
-- 
1.8.1.2
