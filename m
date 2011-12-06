From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  6 Dec 2011 17:50:11 +0100
Subject: [Buildroot] [PATCH v2] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1323190211-8150-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Changed in v2:
 - added patch to fix crash on uClibc. Thanks Gustavo Zacarias for reporting,
   with request to test it as I do not have a target where I can reproduce the
   problem.

PS: Peter, I wonder if Gustavo should have a SoB line on this patch, since he
did a significant part of the work. If it is the case, is it something
that I should have done, or is this your role as a maintainer? Thanks.

 package/netsnmp/netsnmp-swinst-crash.patch |   17 +++++++++++++++++
 package/netsnmp/netsnmp.mk                 |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-swinst-crash.patch

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
-- 
1.7.5.4
