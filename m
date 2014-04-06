From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:06 +0200
Subject: [Buildroot] [PATCH 5/5] agentpp: new package
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1396822806-32655-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in          |  1 +
 package/agentpp/Config.in  | 20 ++++++++++++++++++++
 package/agentpp/agentpp.mk | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/agentpp/Config.in
 create mode 100644 package/agentpp/agentpp.mk

diff --git a/package/Config.in b/package/Config.in
index cc28d51..f35e1c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/agentpp/Config.in"
 source "package/c-ares/Config.in"
 source "package/cppzmq/Config.in"
 source "package/czmq/Config.in"
diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
new file mode 100644
index 0000000..10e003b
--- /dev/null
+++ b/package/agentpp/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_AGENTPP
+	bool "agent++"
+	select BR2_PACKAGE_SNMPPP
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  AGENT++ is a set of C++ classes which provides a complete protocol
+	  engine and dispatch table for the development of SNMP agents.
+	  AGENT++ is a multilingual API which supports SNMPv1, SNMPv2c, and
+	  SNMPv3. It provides various C++ classes implementing prototypes for
+	  scalar and table SNMP managed objects that can be customized by
+	  derivation. Additional classes support the development of proxy
+	  agents as well as sending notifications.
+
+	  SNMPv3 support is enabled if SNMP++ enables it.
+
+	  http://www.agentpp.com/agentpp3_5/agentpp3_5.html
+
+
+comment "agent++ needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
new file mode 100644
index 0000000..32af8e3
--- /dev/null
+++ b/package/agentpp/agentpp.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# agentpp
+#
+#############################################################
+
+AGENTPP_VERSION = 4.0.2
+AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
+AGENTPP_SITE = http://www.agentpp.com
+AGENTPP_LICENSE = Apache-2.0
+AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
+AGENTPP_INSTALL_STAGING = YES
+AGENTPP_DEPENDENCIES = host-pkgconf snmppp
+AGENTPP_CONF_OPT += \
+	--disable-proxy \
+	--disable-forwarder \
+	--disable-rpath \
+	--disable-dependency-tracking
+
+$(eval $(autotools-package))
-- 
1.8.3.2
