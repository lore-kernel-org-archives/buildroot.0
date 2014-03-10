From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 14:13:02 -0300
Subject: [Buildroot] [PATCH] netsnmp: security bump to version 5.7.2.1
Message-ID: <1394471582-10854-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-2284 but not CVE-2014-2285 so add a patch for that one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/netsnmp-001-CVE-2014-2285.patch | 31 +++++++++++++++++++++++++
 package/netsnmp/netsnmp.mk                      |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/netsnmp/netsnmp-001-CVE-2014-2285.patch

diff --git a/package/netsnmp/netsnmp-001-CVE-2014-2285.patch b/package/netsnmp/netsnmp-001-CVE-2014-2285.patch
new file mode 100644
index 0000000..d7a3057
--- /dev/null
+++ b/package/netsnmp/netsnmp-001-CVE-2014-2285.patch
@@ -0,0 +1,31 @@
+Fix for CVE-2014-2285 from upstream:
+http://sourceforge.net/p/net-snmp/patches/1275/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- net-snmp-5.7.3.pre3/perl/TrapReceiver/TrapReceiver.xs.null	2014-02-25 21:50:16.000000000 +0100
++++ net-snmp-5.7.3.pre3/perl/TrapReceiver/TrapReceiver.xs	2014-03-03 18:59:20.261766270 +0100
+@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu
+         STOREPDUi("securitymodel", pdu->securityModel);
+         STOREPDUi("securitylevel", pdu->securityLevel);
+         STOREPDU("contextName",
+-                 newSVpv(pdu->contextName, pdu->contextNameLen));
++                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
+         STOREPDU("contextEngineID",
+-                 newSVpv((char *) pdu->contextEngineID,
++                 newSVpv(pdu->contextEngineID ? (char *) pdu->contextEngineID : "",
+                                     pdu->contextEngineIDLen));
+         STOREPDU("securityEngineID",
+-                 newSVpv((char *) pdu->securityEngineID,
++                 newSVpv(pdu->securityEngineID ? (char *) pdu->securityEngineID : "",
+                                     pdu->securityEngineIDLen));
+         STOREPDU("securityName",
+-                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
++                 newSVpv(pdu->securityName ? (char *) pdu->securityName : "", pdu->securityNameLen));
+     } else {
+         STOREPDU("community",
+-                 newSVpv((char *) pdu->community, pdu->community_len));
++                 newSVpv(pdu->community ? (char *) pdu->community : "", pdu->community_len));
+     }
+ 
+     if (transport && transport->f_fmtaddr) {
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 4830c00..63ec97a 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.7.2
+NETSNMP_VERSION = 5.7.2.1
 NETSNMP_SITE = http://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
-- 
1.8.3.2
