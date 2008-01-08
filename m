From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 Jan 2008 04:51:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080108125136.AD68112010C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-08 04:51:36 -0800 (Tue, 08 Jan 2008)
New Revision: 20821

Log:
busybox: 1.9.0 fixes


Added:
   trunk/buildroot/package/busybox/busybox-1.9.0-allno.patch
   trunk/buildroot/package/busybox/busybox-1.9.0-iproute.patch
   trunk/buildroot/package/busybox/busybox-1.9.0-nameif.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.9.0-allno.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-allno.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-allno.patch	2008-01-08 12:51:36 UTC (rev 20821)
@@ -0,0 +1,23 @@
+diff -urN busybox-1.9.0/Makefile.help busybox-1.9.0-allno/Makefile.help
+--- busybox-1.9.0/Makefile.help	2007-12-21 22:00:33.000000000 +0000
++++ busybox-1.9.0-allno/Makefile.help	2008-01-04 20:03:30.000000000 +0000
+@@ -16,7 +16,6 @@
+ 	@echo 'Configuration:'
+ 	@echo '  allnoconfig		- disable all symbols in .config'
+ 	@echo '  allyesconfig		- enable all symbols in .config (see defconfig)'
+-	@echo '  allbareconfig		- enable all applets without any sub-features'
+ 	@echo '  config		- text based configurator (of last resort)'
+ 	@echo '  defconfig		- set .config to largest generic configuration'
+ 	@echo '  menuconfig		- interactive curses-based configurator'
+diff -urN busybox-1.9.0/applets/applet_tables.c busybox-1.9.0-allno/applets/applet_tables.c
+--- busybox-1.9.0/applets/applet_tables.c	2007-12-24 14:08:25.000000000 +0000
++++ busybox-1.9.0-allno/applets/applet_tables.c	2008-01-04 20:00:12.000000000 +0000
+@@ -71,7 +71,7 @@
+ 
+ 	puts("/* This is a generated file, don't edit */");
+ 
+-	puts("const char applet_names[] ALIGN1 =");
++	puts("const char applet_names[] ALIGN1 = \"\" \n");
+ 	for (i = 0; i < NUM_APPLETS; i++) {
+ 		printf("\"%s\" \"\\0\"\n", applets[i].name);
+ 	}

Added: trunk/buildroot/package/busybox/busybox-1.9.0-iproute.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-iproute.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-iproute.patch	2008-01-08 12:51:36 UTC (rev 20821)
@@ -0,0 +1,25 @@
+diff -urN busybox-1.9.0/networking/libiproute/iproute.c busybox-1.9.0-iproute/networking/libiproute/iproute.c
+--- busybox-1.9.0/networking/libiproute/iproute.c	2007-12-21 22:00:23.000000000 +0000
++++ busybox-1.9.0-iproute/networking/libiproute/iproute.c	2008-01-04 15:18:33.000000000 +0000
+@@ -841,15 +841,17 @@
+ 	/*0-3*/	"add\0""append\0""change\0""chg\0"
+ 	/*4-7*/	"delete\0""get\0""list\0""show\0"
+ 	/*8..*/	"prepend\0""replace\0""test\0""flush\0";
+-	int command_num = 6;
++	int command_num;
+ 	unsigned flags = 0;
+ 	int cmd = RTM_NEWROUTE;
+ 
++	if (!*argv)
++		return iproute_list_or_flush(argv, 0);
++
+ 	/* "Standard" 'ip r a' treats 'a' as 'add', not 'append' */
+ 	/* It probably means that it is using "first match" rule */
+-	if (*argv) {
+-		command_num = index_in_substrings(ip_route_commands, *argv);
+-	}
++	command_num = index_in_substrings(ip_route_commands, *argv);
++
+ 	switch (command_num) {
+ 		case 0: /* add */
+ 			flags = NLM_F_CREATE|NLM_F_EXCL;

Added: trunk/buildroot/package/busybox/busybox-1.9.0-nameif.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-nameif.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-nameif.patch	2008-01-08 12:51:36 UTC (rev 20821)
@@ -0,0 +1,33 @@
+diff -urN busybox-1.9.0/networking/nameif.c busybox-1.9.0-nameif/networking/nameif.c
+--- busybox-1.9.0/networking/nameif.c	2007-12-24 14:08:25.000000000 +0000
++++ busybox-1.9.0-nameif/networking/nameif.c	2008-01-04 20:05:48.000000000 +0000
+@@ -50,18 +50,18 @@
+ #define ETHTOOL_BUSINFO_LEN 32
+ /* these strings are set to whatever the driver author decides... */
+ struct ethtool_drvinfo {
+-	__u32 cmd;
+-	char  driver[32]; /* driver short name, "tulip", "eepro100" */
+-	char  version[32];  /* driver version string */
+-	char  fw_version[32]; /* firmware version string, if applicable */
+-	char  bus_info[ETHTOOL_BUSINFO_LEN];  /* Bus info for this IF. */
++	uint32_t cmd;
++	char driver[32]; /* driver short name, "tulip", "eepro100" */
++	char version[32];  /* driver version string */
++	char fw_version[32]; /* firmware version string, if applicable */
++	char bus_info[ETHTOOL_BUSINFO_LEN];  /* Bus info for this IF. */
+         /* For PCI devices, use pci_dev->slot_name. */
+-	char  reserved1[32];
+-	char  reserved2[16];
+-	__u32 n_stats;  /* number of u64's from ETHTOOL_GSTATS */
+-	__u32 testinfo_len;
+-	__u32 eedump_len; /* Size of data from ETHTOOL_GEEPROM (bytes) */
+-	__u32 regdump_len;  /* Size of data from ETHTOOL_GREGS (bytes) */
++	char reserved1[32];
++	char reserved2[16];
++	uint32_t n_stats;  /* number of u64's from ETHTOOL_GSTATS */
++	uint32_t testinfo_len;
++	uint32_t eedump_len; /* Size of data from ETHTOOL_GEEPROM (bytes) */
++	uint32_t regdump_len;  /* Size of data from ETHTOOL_GREGS (bytes) */
+ };
+ #define ETHTOOL_GDRVINFO  0x00000003 /* Get driver info. */
+ #endif
