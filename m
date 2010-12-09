From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu,  9 Dec 2010 17:59:51 -0600
Subject: [Buildroot] [PATCH] iproute2 depends on iptables and both packages
	need AR set to TARGET_AR
Message-ID: <84f07dad0d6d3c038b5e7a7e00fff09c4b010b60.1291939153.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: root <root@build-pc2.home.zuerker.org>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/iproute2/Config.in   |    5 ++++-
 package/iproute2/iproute2.mk |    3 ++-
 package/iptables/iptables.mk |    2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 2412d8e..6d86c7c 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
-	depends on BR2_INET_IPV6
+	depends on BR2_INET_IPV6 && BR2_PACKAGE_IPTABLES
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
@@ -9,3 +9,6 @@ config BR2_PACKAGE_IPROUTE2
 
 comment "iproute2 requires a toolchain with IPv6 support"
 	depends on !BR2_INET_IPV6
+
+comment "iproute2 requires iptables"
+	depends on !BR2_PACKAGE_IPTABLES
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0f99894..b1e136f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -8,6 +8,7 @@ IPROUTE2_VERSION = 2.6.35
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+IPROUTE2_DEPENDENCIES = iptables
 
 define IPROUTE2_CONFIGURE_CMDS
 	# Use kernel headers
@@ -20,7 +21,7 @@ define IPROUTE2_CONFIGURE_CMDS
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ec2c85..9c3c577 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -7,6 +7,8 @@ IPTABLES_VERSION = 1.4.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_INSTALL_STAGING = yes
+IPTABLES_MAKE_OPT = AR=$(TARGET_AR)
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.7.3.2
