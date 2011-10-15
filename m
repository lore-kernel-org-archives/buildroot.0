From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:31 -0300
Subject: [Buildroot] [PATCH 17/25] bind: version bump to 9.6-ESV-R5 and
	server option
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 9.6-ESV-R5.
Also add the server option in case users just want the tools.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/Config.in |   16 +++++++++++++---
 package/bind/bind.mk   |   14 +++++++++++---
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 827ee26..9b9c7ee 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
+	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
@@ -21,11 +22,20 @@ config BR2_PACKAGE_BIND
 
 	  http://www.isc.org/sw/bind/
 
+if BR2_PACKAGE_BIND
+
+config BR2_PACKAGE_BIND_SERVER
+	bool "Install server components"
+	default y
+	help
+	  Install server components (named, lwresd)
+
 config BR2_PACKAGE_BIND_TOOLS
 	bool "Install tools"
-	depends on BR2_PACKAGE_BIND
 	help
 	  Install tools (host, nslookup, dig, nsupdate)
 
-comment "bind requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+endif
+
+comment "bind requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE || BR2_INET_IPV6)
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b62c8ea..4c7a612 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R4
+BIND_VERSION = 9.6-ESV-R5
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
@@ -40,17 +40,25 @@ endef
 
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES
 
+define BIND_TARGET_REMOVE_SERVER
+	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
+endef
+
 define BIND_TARGET_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
 endef
 
+ifneq ($(BR2_PACKAGE_BIND_SERVER),y)
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_SERVER
+endif
+
 ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
 
 define BIND_UNINSTALL_TARGET_CMDS
-	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
-	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
+	$(BIND_TARGET_REMOVE_SERVER)
+	$(BIND_TARGET_REMOVE_TOOLS)
 	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
 endef
-- 
1.7.3.4
