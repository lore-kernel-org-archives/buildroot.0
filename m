From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:17:14 +0100
Subject: [Buildroot] [git commit branch/next] netsnmp: Make server and
	client installation optional
Message-ID: <20150219221816.D5B5681792@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a387ff3837efca695c5449e0d0be1b9a7c9d7ee2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The netsnmp package consists of both a server and a number of client
tools, this makes the installation of both parts optional.

[Thomas:
  - Add explicit --enable-{agent,applications}, and use positive logic.
  - Remove "net-snmp" from the new Config.in option prompts, since
    they are already visible under the netsnmp package option.]

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/Config.in  |   12 ++++++++++++
 package/netsnmp/netsnmp.mk |   14 ++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 8edbd39..589f720 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -9,6 +9,18 @@ config BR2_PACKAGE_NETSNMP
 
 if BR2_PACKAGE_NETSNMP
 
+config BR2_PACKAGE_NETSNMP_SERVER
+	bool "server"
+	default y
+	help
+	  The snmpd server.
+
+config BR2_PACKAGE_NETSNMP_CLIENTS
+	bool "clients"
+	default y
+	help
+	  The net-snmp clients (snmpget, snmpwalk, etc).
+
 config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	bool "Install MIB files on target and enable MIB loading code"
 	default y
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index bfc2a74..58b52ef 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -67,6 +67,18 @@ ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 	NETSNMP_CONF_OPTS += --disable-debugging
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
+	NETSNMP_CONF_OPTS += --enable-agent
+else
+	NETSNMP_CONF_OPTS += --disable-agent
+endif
+
+ifeq ($(BR2_PACKAGE_NETSNMP_CLIENTS),y)
+	NETSNMP_CONF_OPTS += --enable-applications
+else
+	NETSNMP_CONF_OPTS += --disable-applications
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
@@ -84,10 +96,12 @@ endef
 
 NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_BLOAT_MIBS
 
+ifeq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
 define NETSNMP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
 endef
+endif
 
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 	$(SED) 	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
