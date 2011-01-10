From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jan 2011 14:41:25 -0300
Subject: [Buildroot] [PATCH 4/4] iproute2: bump to version 2.6.37 + fixes
In-Reply-To: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294681285-1205-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2.6.37
Add iptables support when it's available.
ATM support requires linux-atm for which we don't have a package yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0f99894..c3e9650 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,19 +4,29 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.35
+IPROUTE2_VERSION = 2.6.37
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
+# If we've got iptables enable xtables support for tc
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+IPROUTE2_DEPENDENCIES += iptables
+define IPROUTE2_WITH_IPTABLES
+	# Makefile is busted so it never passes IPT_LIB_DIR properly
+	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
+	echo "TC_CONFIG_XT:=y" >>$(IPROUTE2_DIR)/Config
+endef
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
+	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
+	$(IPROUTE2_WITH_IPTABLES)
 endef
 
 define IPROUTE2_BUILD_CMDS
-- 
1.7.3.4
