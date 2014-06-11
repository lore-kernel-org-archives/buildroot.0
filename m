From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jun 2014 10:31:28 -0300
Subject: [Buildroot] [PATCH] wireless tools: bump to version 30.pre9
Message-ID: <1402493488-22886-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems there won't be any new release soon (or ever), so update to the
latest pre version for better functionality (non-ASCII ESSIDs, bigger
scan buffer for example).
Also update the bzero deprecation patch since it missed some instances.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireless_tools/Config.in                   |  1 +
 .../wireless_tools-01-remove-bzero.patch           | 95 ++++++++++++++++++++++
 .../wireless_tools-29-remove-bzero.patch           | 29 -------
 package/wireless_tools/wireless_tools.mk           |  5 +-
 4 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 package/wireless_tools/wireless_tools-01-remove-bzero.patch
 delete mode 100644 package/wireless_tools/wireless_tools-29-remove-bzero.patch

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 0840187..0968fd3 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -9,6 +9,7 @@ if BR2_PACKAGE_WIRELESS_TOOLS
 
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The shared library of wireless tools
 
diff --git a/package/wireless_tools/wireless_tools-01-remove-bzero.patch b/package/wireless_tools/wireless_tools-01-remove-bzero.patch
new file mode 100644
index 0000000..53ef588
--- /dev/null
+++ b/package/wireless_tools/wireless_tools-01-remove-bzero.patch
@@ -0,0 +1,95 @@
+Switch all instances of deprecated bzero() to memset() equivalent.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura wireless_tools.30/ifrename.c wireless_tools.30-bzero/ifrename.c
+--- wireless_tools.30/ifrename.c	2007-10-16 20:12:41.000000000 -0300
++++ wireless_tools.30-bzero/ifrename.c	2014-06-11 09:52:59.623741119 -0300
+@@ -541,7 +541,7 @@
+ 	    victimname, autoname);
+ 
+   /* Prepare request */
+-  bzero(&ifr, sizeof(struct ifreq));
++  memset(&ifr, 0, sizeof(struct ifreq));
+   strncpy(ifr.ifr_name, victimname, IFNAMSIZ); 
+   strncpy(ifr.ifr_newname, autoname, IFNAMSIZ); 
+ 
+@@ -587,7 +587,7 @@
+     }
+ 
+   /* Prepare request */
+-  bzero(&ifr, sizeof(struct ifreq));
++  memset(&ifr, 0, sizeof(struct ifreq));
+   strncpy(ifr.ifr_name, oldname, IFNAMSIZ); 
+   strncpy(ifr.ifr_newname, newname, IFNAMSIZ); 
+ 
+@@ -747,7 +747,7 @@
+   int		i;
+ 
+   /* Get MAC address */
+-  bzero(&ifr, sizeof(struct ifreq));
++  memset(&ifr, 0, sizeof(struct ifreq));
+   strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
+   ret = ioctl(skfd, SIOCGIFHWADDR, &ifr);
+   if(ret < 0)
+@@ -1040,8 +1040,8 @@
+     return(0);
+ 
+   /* Prepare request */
+-  bzero(&ifr, sizeof(struct ifreq));
+-  bzero(&drvinfo, sizeof(struct ethtool_drvinfo));
++  memset(&ifr, 0, sizeof(struct ifreq));
++  memset(&drvinfo, 0, sizeof(struct ethtool_drvinfo));
+   strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
+   drvinfo.cmd = ETHTOOL_GDRVINFO;
+   ifr.ifr_data = (caddr_t) &drvinfo;
+@@ -1206,8 +1206,8 @@
+     return(0);
+ 
+   /* Prepare request */
+-  bzero(&ifr, sizeof(struct ifreq));
+-  bzero(&map, sizeof(struct ifmap));
++  memset(&ifr, 0, sizeof(struct ifreq));
++  memset(&map, 0, sizeof(struct ifmap));
+   strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
+ 
+   /* Do it */
+@@ -2050,7 +2050,7 @@
+   struct add_extra	extrainfo;
+ 
+   /* Reset the list of filters */
+-  bzero(selector_active, sizeof(selector_active));
++  memset(selector_active, 0, sizeof(selector_active));
+ 
+   /* Check filename */
+   if(!strcmp(filename, "-"))
+diff -Nura wireless_tools.30/iwlib.c wireless_tools.30-bzero/iwlib.c
+--- wireless_tools.30/iwlib.c	2009-11-23 23:28:59.000000000 -0300
++++ wireless_tools.30-bzero/iwlib.c	2014-06-11 09:50:20.611371384 -0300
+@@ -484,7 +484,7 @@
+   union iw_range_raw *	range_raw;
+ 
+   /* Cleanup */
+-  bzero(buffer, sizeof(buffer));
++  memset(buffer, 0, sizeof(buffer));
+ 
+   wrq.u.data.pointer = (caddr_t) buffer;
+   wrq.u.data.length = sizeof(buffer);
+@@ -513,7 +513,7 @@
+   else
+     {
+       /* Zero unknown fields */
+-      bzero((char *) range, sizeof(struct iw_range));
++      memset((char *) range, 0, sizeof(struct iw_range));
+ 
+       /* Initial part unmoved */
+       memcpy((char *) range,
+@@ -3064,7 +3064,7 @@
+ 	oldwscan->next = wscan;
+ 
+       /* Reset it */
+-      bzero(wscan, sizeof(struct wireless_scan));
++      memset(wscan, 0, sizeof(struct wireless_scan));
+ 
+       /* Save cell identifier */
+       wscan->has_ap_addr = 1;
diff --git a/package/wireless_tools/wireless_tools-29-remove-bzero.patch b/package/wireless_tools/wireless_tools-29-remove-bzero.patch
deleted file mode 100644
index 4714b31..0000000
--- a/package/wireless_tools/wireless_tools-29-remove-bzero.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/iwlib.c	2007-06-29 19:43:31.000000000 -0400
-+++ b/iwlib.c	2008-03-12 14:18:48.000000000 -0400
-@@ -475,7 +475,7 @@ iw_get_range_info(int		skfd,
-   union iw_range_raw *	range_raw;
- 
-   /* Cleanup */
--  bzero(buffer, sizeof(buffer));
-+  memset(buffer, 0, sizeof(buffer));
- 
-   wrq.u.data.pointer = (caddr_t) buffer;
-   wrq.u.data.length = sizeof(buffer);
-@@ -504,7 +504,7 @@ iw_get_range_info(int		skfd,
-   else
-     {
-       /* Zero unknown fields */
--      bzero((char *) range, sizeof(struct iw_range));
-+      memset((char *) range, 0, sizeof(struct iw_range));
- 
-       /* Initial part unmoved */
-       memcpy((char *) range,
-@@ -2960,7 +2960,7 @@ iw_process_scanning_token(struct iw_even
- 	oldwscan->next = wscan;
- 
-       /* Reset it */
--      bzero(wscan, sizeof(struct wireless_scan));
-+      memset(wscan, 0, sizeof(struct wireless_scan));
- 
-       /* Save cell identifier */
-       wscan->has_ap_addr = 1;
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index ff9f6a5..2082006 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WIRELESS_TOOLS_VERSION = 29
+WIRELESS_TOOLS_VERSION_MAJOR = 30
+WIRELESS_TOOLS_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR).pre9
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
 WIRELESS_TOOLS_LICENSE = GPLv2
@@ -16,7 +17,7 @@ WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
 
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
-	WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION)
+	WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
 	WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
 
 define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
-- 
1.8.5.5
