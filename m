From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri, 10 Dec 2010 11:05:40 -0600
Subject: [Buildroot] [PATCH v3] fix iproute2 dependencies and define AR for
	iptables and iproute2
Message-ID: <0e6c629d481e9024055833cf47d4543e0b1f2d76.1292000704.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/iproute2/Config.in   |   14 ++++++++++++++
 package/iproute2/iproute2.mk |   11 ++++++++---
 package/iptables/iptables.mk |    2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 2412d8e..bc980cf 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -7,5 +7,19 @@ config BR2_PACKAGE_IPROUTE2
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
 
+config BR2_PACKAGE_IPROUTE2_TC_XTABLES
+	bool "xtables support for tc"
+	default y if BR2_PACKAGE_IPTABLES
+	depends on BR2_PACKAGE_IPROUTE2
+	depends on BR2_PACKAGE_IPTABLES
+
+comment "xtables support for tc requires iptables"
+	depends on BR2_PACKAGE_IPROUTE2 && !BR2_PACKAGE_IPTABLES
+
+config BR2_PACKAGE_IPROUTE2_TC_ATM
+	bool "atm support for tc"
+	depends on BR2_PACKAGE_IPROUTE2
+
 comment "iproute2 requires a toolchain with IPv6 support"
 	depends on !BR2_INET_IPV6
+
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0f99894..5da252c 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -9,18 +9,23 @@ IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
+ifeq ($(BR2_PACKAGE_IPROUTE2_TC_XTABLES),y)
+	IPROUTE2_DEPENDENCIES = iptables
+endif
+
 define IPROUTE2_CONFIGURE_CMDS
 	# Use kernel headers
 	rm -r $(IPROUTE2_DIR)/include/netinet
 	# arpd needs berkeleydb
 	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(IPROUTE2_DIR)/Makefile
-	( cd $(@D); ./configure )
-	echo "IPT_LIB_DIR=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
+	echo "IPT_LIB_DIR=/usr/lib/xtables" >$(IPROUTE2_DIR)/Config
+	-test "$(BR2_PACKAGE_IPROUTE2_TC_XTABLES)" = "y" && echo "TC_CONFIG_XT:=y" >>$(IPROUTE2_DIR)/Config
+	-test "$(BR2_PACKAGE_IPROUTE2_TC_ATM)" = "y" && echo "TC_CONFIG_ATM:=y" >>$(IPROUTE2_DIR)/Config
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ec2c85..dee4189 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -7,6 +7,8 @@ IPTABLES_VERSION = 1.4.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_INSTALL_STAGING = YES
+IPTABLES_MAKE_OPT = AR=$(TARGET_AR)
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.7.3.2
