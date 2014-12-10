From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:52:26 +0100
Subject: [Buildroot] [git commit] netsnmp: bump to version 5.7.3
Message-ID: <20141210205232.E0C3D800BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24157f9308ecb3f7eec92e7c259265b298a40cbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security patch now upstream so remove.
Add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/netsnmp-001-CVE-2014-2285.patch |   31 -----------------------
 package/netsnmp/netsnmp.hash                    |    4 +++
 package/netsnmp/netsnmp.mk                      |    2 +-
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/package/netsnmp/netsnmp-001-CVE-2014-2285.patch b/package/netsnmp/netsnmp-001-CVE-2014-2285.patch
deleted file mode 100644
index d7a3057..0000000
--- a/package/netsnmp/netsnmp-001-CVE-2014-2285.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix for CVE-2014-2285 from upstream:
-http://sourceforge.net/p/net-snmp/patches/1275/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- net-snmp-5.7.3.pre3/perl/TrapReceiver/TrapReceiver.xs.null	2014-02-25 21:50:16.000000000 +0100
-+++ net-snmp-5.7.3.pre3/perl/TrapReceiver/TrapReceiver.xs	2014-03-03 18:59:20.261766270 +0100
-@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu
-         STOREPDUi("securitymodel", pdu->securityModel);
-         STOREPDUi("securitylevel", pdu->securityLevel);
-         STOREPDU("contextName",
--                 newSVpv(pdu->contextName, pdu->contextNameLen));
-+                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
-         STOREPDU("contextEngineID",
--                 newSVpv((char *) pdu->contextEngineID,
-+                 newSVpv(pdu->contextEngineID ? (char *) pdu->contextEngineID : "",
-                                     pdu->contextEngineIDLen));
-         STOREPDU("securityEngineID",
--                 newSVpv((char *) pdu->securityEngineID,
-+                 newSVpv(pdu->securityEngineID ? (char *) pdu->securityEngineID : "",
-                                     pdu->securityEngineIDLen));
-         STOREPDU("securityName",
--                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
-+                 newSVpv(pdu->securityName ? (char *) pdu->securityName : "", pdu->securityNameLen));
-     } else {
-         STOREPDU("community",
--                 newSVpv((char *) pdu->community, pdu->community_len));
-+                 newSVpv(pdu->community ? (char *) pdu->community : "", pdu->community_len));
-     }
- 
-     if (transport && transport->f_fmtaddr) {
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
new file mode 100644
index 0000000..2c18441
--- /dev/null
+++ b/package/netsnmp/netsnmp.hash
@@ -0,0 +1,4 @@
+# From http://sourceforge.net/projects/net-snmp/files/net-snmp/5.7.3/
+md5	d4a3459e1577d0efa8d96ca70a885e53	net-snmp-5.7.3.tar.gz
+sha1	97dc25077257680815de44e34128d365c76bd839	net-snmp-5.7.3.tar.gz
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index d20ce50..1897478 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.7.2.1
+NETSNMP_VERSION = 5.7.3
 NETSNMP_SITE = http://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
