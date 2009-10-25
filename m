From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Oct 2009 21:05:38 +0100
Subject: [Buildroot] [git commit master] netsnmp: bump version
Message-ID: <20091025200945.775AB775D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31d34b42053be4ce472d5561e7b21a3bcf4d9dd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Darcy Watkins <DWatkins@tranzeo.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    9 +++++----
 .../netsnmp-5.5-no-ifxtable-module-fix.patch       |   18 ++++++++++++++++++
 package/netsnmp/netsnmp.mk                         |    2 +-
 3 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch

diff --git a/CHANGES b/CHANGES
index a7e56c9..0b82254 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,10 +7,11 @@
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libmad, libnl, libupnp, libuuid,
-	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl,
-	php, python, quagga, radvd, rsync, samba, sawman, shared-mime-info,
-	speech-tools, sqlite, squashfs, syslinux, u-boot, util-linux,
-	valgrind, vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
+	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g,
+	openssl, php, python, quagga, radvd, rsync, samba, sawman,
+	shared-mime-info, speech-tools, sqlite, squashfs, syslinux, u-boot,
+	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
 
diff --git a/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch b/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch
new file mode 100644
index 0000000..e13106f
--- /dev/null
+++ b/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch
@@ -0,0 +1,18 @@
+--- net-snmp-5.5.theorig/agent/mibgroup/if-mib/ifTable/ifTable_data_access.c	2009-06-12 12:02:22.000000000 -0700
++++ net-snmp-5.5/agent/mibgroup/if-mib/ifTable/ifTable_data_access.c	2009-10-20 11:29:41.000000000 -0700
+@@ -374,6 +374,7 @@ _check_interface_entry_for_updates(ifTab
+      */
+     if (oper_changed) {
+         rowreq_ctx->data.ifLastChange = netsnmp_get_agent_uptime();
++#ifdef USING_IF_MIB_IFXTABLE_IFXTABLE_MODULE
+         if (rowreq_ctx->data.ifLinkUpDownTrapEnable == 1) {
+             if (rowreq_ctx->data.ifOperStatus == IFOPERSTATUS_UP) {
+                 oid notification_oid[] = { 1, 3, 6, 1, 6, 3, 1, 1, 5, 4 };
+@@ -389,6 +390,7 @@ _check_interface_entry_for_updates(ifTab
+                                              rowreq_ctx->data.ifOperStatus);
+             }
+         }
++#endif
+     }
+ 
+     else
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 336ffd7..cfe9905 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -3,7 +3,7 @@
 # netsnmp
 #
 #############################################################
-NETSNMP_VERSION:=5.4.2.1
+NETSNMP_VERSION:=5.5
 NETSNMP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
 NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
 NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
-- 
1.6.3.3
