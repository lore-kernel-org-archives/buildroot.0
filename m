From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 16:15:39 +0200
Subject: [Buildroot] [PATCH 3/3] netsnmp: add patch to fix CVE-2008-6123
In-Reply-To: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f399948340ad72ffdecd4dfdac286fa2f06a4f7e.1249395336.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch    |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch

diff --git a/package/netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch b/package/netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch
new file mode 100644
index 0000000..2ecc1bb
--- /dev/null
+++ b/package/netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch
@@ -0,0 +1,29 @@
+This patch fixes CVE-2008-6123, according to
+http://bugs.gentoo.org/show_bug.cgi?id=250429. It has been found
+upstream at
+http://net-snmp.svn.sourceforge.net/viewvc/net-snmp/branches/V5-4-patches/net-snmp/snmplib/snmpUDPDomain.c?view=patch&r1=17367&r2=17366&pathrev=17367.
+
+---
+ snmplib/snmpUDPDomain.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: netsnmp-5.4.2.1/snmplib/snmpUDPDomain.c
+===================================================================
+--- netsnmp-5.4.2.1.orig/snmplib/snmpUDPDomain.c
++++ netsnmp-5.4.2.1/snmplib/snmpUDPDomain.c
+@@ -104,12 +104,12 @@
+ 	char tmp[64];
+         to = (struct sockaddr_in *) &(addr_pair->remote_addr);
+         if (to == NULL) {
+-            sprintf(tmp, "UDP: [%s]->unknown",
++            sprintf(tmp, "UDP: unknown->[%s]",
+                     inet_ntoa(addr_pair->local_addr));
+         } else {
+-            sprintf(tmp, "UDP: [%s]->", inet_ntoa(addr_pair->local_addr));
+-            sprintf(tmp + strlen(tmp), "[%s]:%hd",
++            sprintf(tmp, "UDP: [%s]:%hu->",
+                     inet_ntoa(to->sin_addr), ntohs(to->sin_port));
++            sprintf(tmp + strlen(tmp), "[%s]", inet_ntoa(addr_pair->local_addr));
+         }
+         return strdup(tmp);
+     }
-- 
1.6.0.4
