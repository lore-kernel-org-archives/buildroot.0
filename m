From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 16:52:24 +0100
Subject: [Buildroot] [git commit] netsnmp: bump to 5.7.1 LTS
Message-ID: <20111207193831.779088F76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a28f7e8acd7e9d2ae67a83698603a03f19fc17c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp-swinst-crash.patch |   17 +++++++++++++++++
 package/netsnmp/netsnmp.mk                 |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp-swinst-crash.patch b/package/netsnmp/netsnmp-swinst-crash.patch
new file mode 100644
index 0000000..f7298a6
--- /dev/null
+++ b/package/netsnmp/netsnmp-swinst-crash.patch
@@ -0,0 +1,17 @@
+Fixes runtime error with uClibc (and possibly others).
+
+Original patch and bug description:
+http://sourceforge.net/tracker/?func=detail&aid=3436528&group_id=12694&atid=312694
+
+--- net-snmp-5.7.1/agent/mibgroup/host/data_access/swinst_pkginfo.c
++++ /home/fabled//net-snmp-5.7.1.patched/agent/mibgroup/host/data_access/swinst_pkginfo.c
+@@ -140,7 +140,8 @@
+         memcpy( entry->swDate, cp, date_len );
+         entry->swDate_len = date_len;
+     }
+-    closedir( d );
++    if (d != NULL)
++        closedir( d );
+ 
+     DEBUGMSGTL(("swinst:load:arch"," loaded %d entries\n",
+                 (int)CONTAINER_SIZE(container)));
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5d789b9..959e39f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETSNMP_VERSION = 5.6.1.1
+NETSNMP_VERSION = 5.7.1
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
