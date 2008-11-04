From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 03:26:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20081104112652.DEF173C902@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 03:26:52 -0800 (Tue, 04 Nov 2008)
New Revision: 23921

Log:
netsnmp: bump version

Based on fa86c12d in Bernhards tree.

Added:
   trunk/buildroot/package/netsnmp/S59snmpd

Removed:
   trunk/buildroot/package/netsnmp/net-snmp-5.1.2.patch
   trunk/buildroot/package/netsnmp/netsnmp.patch

Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Added: trunk/buildroot/package/netsnmp/S59snmpd
===================================================================
--- trunk/buildroot/package/netsnmp/S59snmpd	                        (rev 0)
+++ trunk/buildroot/package/netsnmp/S59snmpd	2008-11-04 11:26:52 UTC (rev 23921)
@@ -0,0 +1,97 @@
+#! /bin/sh -e
+### BEGIN INIT INFO
+# Provides:           snmpd snmptrapd
+# Required-Start:     $network $local_fs
+# Required-Stop:      $network $local_fs
+# Default-Start:      2 3 4 5
+# Default-Stop:       0 6
+# Short-Description:  SNMP agents
+# Description:        NET SNMP (Simple Network Management Protocol) Agents
+### END INIT INFO
+#
+# Author:    Jochen Friedrich <jochen@scram.de>
+#
+set -e
+
+export PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+test -x /usr/sbin/snmpd || exit 0
+test -x /usr/sbin/snmptrapd || exit 0
+
+# Defaults
+export MIBDIRS=/usr/share/snmp/mibs
+SNMPDRUN=yes
+SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid 127.0.0.1'
+TRAPDRUN=no
+TRAPDOPTS='-Lsd -p /var/run/snmptrapd.pid'
+
+# Reads config file (will override defaults above)
+[ -r /etc/default/snmpd ] && . /etc/default/snmpd
+
+ssd_oknodo="-o"
+ssd_oknodo=""
+
+# Cd to / before starting any daemons.
+cd /
+
+# Create compatibility link to old AgentX socket location
+if [ "$SNMPDCOMPAT" = "yes" ]; then
+  ln -sf /var/agentx/master /var/run/agentx
+fi
+
+case "$1" in
+  start)
+    echo -n "Starting network management services:"
+    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+	start-stop-daemon -q -S -x /usr/sbin/snmpd \
+	    -- $SNMPDOPTS
+	echo -n " snmpd"
+    fi
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+	start-stop-daemon -q -S -x /usr/sbin/snmptrapd \
+	    -- $TRAPDOPTS
+	echo -n " snmptrapd"
+    fi
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping network management services:"
+    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
+    echo -n " snmpd"
+    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
+    echo -n " snmptrapd"
+    echo "."
+    ;;
+  restart)
+    echo -n "Restarting network management services:"
+    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
+    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
+    # Allow the daemons time to exit completely.
+    sleep 2
+    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+	start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+	echo -n " snmpd"
+    fi
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+	# Allow snmpd time to start up.
+	sleep 1
+	start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+	echo -n " snmptrapd"
+    fi
+    echo "."
+    ;;
+  reload|force-reload)
+    echo -n "Reloading network management services:"
+    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+        start-stop-daemon -q -K -s 1 \
+	    -p /var/run/snmpd.pid -x /usr/sbin/snmpd
+	echo -n " snmpd"
+    fi
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/snmpd {start|stop|restart|reload|force-reload}"
+    exit 1
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/netsnmp/S59snmpd
___________________________________________________________________
Name: svn:executable
   + *

Deleted: trunk/buildroot/package/netsnmp/net-snmp-5.1.2.patch
===================================================================
--- trunk/buildroot/package/netsnmp/net-snmp-5.1.2.patch	2008-11-03 20:11:03 UTC (rev 23920)
+++ trunk/buildroot/package/netsnmp/net-snmp-5.1.2.patch	2008-11-04 11:26:52 UTC (rev 23921)
@@ -1,185 +0,0 @@
-diff -urN net-snmp-5.1.2-0rig/agent/mibgroup/ucd-snmp/disk.c net-snmp-5.1.2/agent/mibgroup/ucd-snmp/disk.c
---- net-snmp-5.1.2-0rig/agent/mibgroup/ucd-snmp/disk.c	2004-07-02 15:12:35.000000000 +0200
-+++ net-snmp-5.1.2/agent/mibgroup/ucd-snmp/disk.c	2007-07-16 03:39:22.000000000 +0200
-@@ -97,7 +97,7 @@
- #if HAVE_STRING_H
- #include <string.h>
- #endif
--#if HAVE_FSTAB_H
-+#if defined(HAVE_FSTAB_H)
- #include <fstab.h>
- #endif
- #if HAVE_MNTENT_H
-@@ -230,7 +230,7 @@
- static void 
- disk_parse_config(const char *token, char *cptr)
- {
--#if HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS
-+#if defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS)
-   char            tmpbuf[1024];
-   char            path[STRMAX];
-   int             minpercent;
-@@ -272,13 +272,13 @@
-      */
-     add_device(path, find_device(path), minspace, minpercent, 1);
-   }
--#endif /* HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS */
-+#endif /* defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS) */
- }
- 
- static void 
- disk_parse_config_all(const char *token, char *cptr)
- {
--#if HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS
-+#if defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS)
-   char            tmpbuf[1024];
-   int             minpercent = DISKMINPERCENT;
-     
-@@ -311,7 +311,7 @@
-       find_and_add_allDisks(minpercent);
-     }
-   }
--#endif /* HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS */
-+#endif /* defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS) */
- }
- 
- 
-@@ -374,16 +374,16 @@
- static void 
- find_and_add_allDisks(int minpercent)
- {
--#if HAVE_GETMNTENT
-+#if defined(HAVE_GETMNTENT)
- #if HAVE_SYS_MNTTAB_H
-   struct mnttab   mnttab;
- #else
-   struct mntent  *mntent;
- #endif
-   FILE           *mntfp;
--#elif HAVE_FSTAB_H
-+#elif defined(HAVE_FSTAB_H)
-   struct fstab   *fstab1;
--#elif HAVE_STATFS
-+#elif defined(HAVE_STATFS)
-   struct statfs   statf;
- #endif
- #if defined(HAVE_GETMNTENT) && !defined(HAVE_SETMNTENT)
-@@ -397,8 +397,8 @@
-    * string declared above and at the end of the routine return it
-    * to the caller 
-    */
--#if HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS   
--#if HAVE_GETMNTENT
-+#if defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS)   
-+#if defined(HAVE_GETMNTENT)
- #if HAVE_SETMNTENT
-   mntfp = setmntent(ETC_MNTTAB, "r");
-   while (NULL != (mntent = getmntent(mntfp))) {
-@@ -425,7 +425,7 @@
-      */
-   }
- #endif /* HAVE_SETMNTENT */
--#elif HAVE_FSTAB_H
-+#elif defined(HAVE_FSTAB_H)
-   setfsent();			/* open /etc/fstab */
-   while((fstab1 = getfsent()) != NULL) {
-     add_device(fstab1->fs_file, fstab1->fs_spec, -1, minpercent, 0);
-@@ -437,7 +437,7 @@
-      * dummy clause for else below
-      */
-   }
--#elif HAVE_STATFS
-+#elif defined(HAVE_STATFS)
-   /*
-    * since there is no way to get all the mounted systems with just
-    * statfs we default to the root partition "/"
-@@ -461,24 +461,24 @@
-   }
- #else
-   config_perror("'disk' checks not supported on this architecture.");
--#endif                   /* HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS */  
-+#endif                   /* defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS) */  
-  
- }
- 
- static u_char *
- find_device(char *path)
- {
--#if HAVE_GETMNTENT
-+#if defined(HAVE_GETMNTENT)
- #if HAVE_SYS_MNTTAB_H
-   struct mnttab   mnttab;
- #else
-   struct mntent  *mntent;
- #endif
-   FILE           *mntfp;
--#elif HAVE_FSTAB_H
-+#elif defined(HAVE_FSTAB_H)
-   struct fstab   *fstab;
-   struct stat     stat1;
--#elif HAVE_STATFS
-+#elif defined(HAVE_STATFS)
-   struct statfs   statf;
- #endif
-   char            tmpbuf[1024];
-@@ -494,8 +494,8 @@
-    * string declared above and at the end of the routine return it
-    * to the caller 
-    */
--#if HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS   
--#if HAVE_GETMNTENT
-+#if defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS)   
-+#if defined(HAVE_GETMNTENT)
- #if HAVE_SETMNTENT
-   mntfp = setmntent(ETC_MNTTAB, "r");
-   while (NULL != (mntent = getmntent(mntfp)))
-@@ -526,14 +526,14 @@
- 	       sizeof(device));
-   }
- #endif /* HAVE_SETMNTENT */
--#elif HAVE_FSTAB_H
-+#elif defined(HAVE_FSTAB_H)
-   stat(path, &stat1);
-   setfsent();
-   if ((fstab = getfsfile(path))) {
-     copy_nword(fstab->fs_spec, device,
- 	       sizeof(device));
-   }
--#elif HAVE_STATFS
-+#elif defined(HAVE_STATFS)
-   if (statfs(path, &statf) == 0) {
-     copy_word(statf.f_mntfromname, device);
-     DEBUGMSGTL(("ucd-snmp/disk", "Disk:  %s\n",
-@@ -545,12 +545,12 @@
- 	    path);
-     config_pwarn(tmpbuf);
-   }
--#if HAVE_FSTAB_H
-+#if defined(HAVE_FSTAB_H)
-   endfsent();
- #endif
- #else
-   config_perror("'disk' checks not supported on this architecture.");
--#endif                   /* HAVE_FSTAB_H || HAVE_GETMNTENT || HAVE_STATFS */  
-+#endif                   /* defined(HAVE_FSTAB_H) || defined(HAVE_GETMNTENT) || defined(HAVE_STATFS) */  
-   return device;
- }
- 
-@@ -597,7 +597,7 @@
-     struct statvfs  vfs;
- #endif
- #else
--#if HAVE_FSTAB_H
-+#if defined(HAVE_FSTAB_H)
-     int             file;
-     union {
-         struct fs       iu_fs;
-@@ -715,7 +715,7 @@
-         return ((u_char *) (errmsg));
-     }
- #else
--#if HAVE_FSTAB_H
-+#if defined(HAVE_FSTAB_H)
-     /*
-      * read the disk information 
-      */

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2008-11-03 20:11:03 UTC (rev 23920)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2008-11-04 11:26:52 UTC (rev 23921)
@@ -3,25 +3,26 @@
 # netsnmp
 #
 #############################################################
-NETSNMP_VERSION:=5.1.2
-NETSNMP_PATCH_VERSION:=6.2
-NETSNMP_URL:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
+NETSNMP_VERSION:=5.4.1
+NETSNMP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
 NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
 NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
-NETSNMP_PATCH1:=net-snmp_$(NETSNMP_VERSION)-$(NETSNMP_PATCH_VERSION).diff.gz
-NETSNMP_PATCH1_URL:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/n/net-snmp/
 
+NETSNMP_WO_TRANSPORT:=
+ifneq ($(BR2_INET_IPX),y)
+NETSNMP_WO_TRANSPORT+= IPX
+endif
+ifneq ($(BR2_INET_IPV6),y)
+NETSNMP_WO_TRANSPORT+= UDPIPv6 TCPIPv6
+endif
+
 $(DL_DIR)/$(NETSNMP_SOURCE):
-	$(WGET) -P $(DL_DIR) $(NETSNMP_URL)/$(NETSNMP_SOURCE)
+	$(WGET) -P $(DL_DIR) $(NETSNMP_SITE)/$(NETSNMP_SOURCE)
 
-$(DL_DIR)/$(NETSNMP_PATCH1):
-	$(WGET) -P $(DL_DIR) $(NETSNMP_PATCH1_URL)/$(NETSNMP_PATCH1)
-
-$(NETSNMP_DIR)/.unpacked: $(DL_DIR)/$(NETSNMP_SOURCE) $(DL_DIR)/$(NETSNMP_PATCH1)
+$(NETSNMP_DIR)/.unpacked: $(DL_DIR)/$(NETSNMP_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(NETSNMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(NETSNMP_PATCH1) | patch -p1 -d $(NETSNMP_DIR)
-	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ \*.patch
-	touch $(NETSNMP_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ \*$(NETSNMP_VERSION)\*.patch
+	touch $@
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_ENDIAN=big
@@ -29,21 +30,47 @@
 NETSNMP_ENDIAN=little
 endif
 
-# We set CAN_USE_SYSCTL to no and use /proc since the
-# sysctl code in this thing is apparently intended for
-# freebsd or some such thing...
+ifeq ($(BR2_HAVE_PERL),y)
+NETSNMP_CONFIGURE_PERL_ENV:=\
+		PERLCC="$(TARGET_CC)"
+NETSNMP_CONFIGURE_PERL:=\
+		--disable-embedded-perl \
+		--disable-perl-cc-checks \
+		--enable-as-needed
+else
+NETSNMP_CONFIGURE_PERL_ENV:=
+NETSNMP_CONFIGURE_PERL:=\
+		--disable-embedded-perl \
+		--disable-perl-cc-checks \
+		--without-perl-modules
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NETSNMP_CONFIGURE_OPENSSL:=--with-openssl=$(STAGING_DIR)/usr/include/openssl
+else
+NETSNMP_CONFIGURE_OPENSSL:=--without-openssl
+endif
+
+ifneq ($(findstring y,$(BR2_HAVE_MANPAGES)$(BR2_HAVE_INFOPAGES)),y)
+NETSNMP_DOCS:=--disable-manuals
+endif
+
 $(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
 	(cd $(NETSNMP_DIR); rm -f config.cache; \
 		autoconf && \
-		ac_cv_CAN_USE_SYSCTL=no \
+		ac_cv_NETSNMP_CAN_USE_SYSCTL=yes \
+		$(NETSNMP_CONFIGURE_PERL_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-		--with-cc=$(TARGET_CROSS)gcc \
-		--with-ar=$(TARGET_CROSS)ar \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
+		--with-cc=$(TARGET_CROSS)gcc \
+		--with-linkcc=$(TARGET_CROSS)gcc \
+		--with-ar=$(TARGET_CROSS)ar \
+		--with-cflags="$(TARGET_CFLAGS)" \
+		--with-ldflags="$(TARGET_LDFLAGS)" \
 		--with-endianness=$(NETSNMP_ENDIAN) \
 		--with-persistent-directory=/var/lib/snmp \
 		--enable-ucd-snmp-compatibility \
@@ -51,54 +78,61 @@
 		--disable-static \
 		--with-logfile=none \
 		--without-rpm \
-		--with-openssl \
+		$(NETSNMP_CONFIGURE_OPENSSL) \
+		$(NETSNMP_DOCS) \
+		$(NETSNMP_CONFIGURE_PERL) \
 		--without-dmalloc \
 		--without-efence \
 		--without-rsaref \
 		--with-sys-contact="root" \
 		--with-sys-location="Unknown" \
 		--with-mib-modules="host smux ucd-snmp/dlmod" \
+		--with-out-transports="$(NETSNMP_WO_TRANSPORT)" \
 		--with-defaults \
+		--disable-debugging \
 		--prefix=/usr \
 		--sysconfdir=/etc \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--enable-mini-agent \
+		--without-kmem-usage \
+		$(DISABLE_IPV6) \
 	)
-	touch $(NETSNMP_DIR)/.configured
+	touch $@
 
 $(NETSNMP_DIR)/agent/snmpd: $(NETSNMP_DIR)/.configured
 	$(MAKE1) -C $(NETSNMP_DIR)
+	touch -c $@
 
 $(TARGET_DIR)/usr/sbin/snmpd: $(NETSNMP_DIR)/agent/snmpd
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr \
 	    prefix=$(TARGET_DIR)/usr \
 	    exec_prefix=$(TARGET_DIR)/usr \
 	    persistentdir=$(TARGET_DIR)/var/lib/snmp \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
 	    includedir=$(STAGING_DIR)/usr/include/net-snmp \
 	    ucdincludedir=$(STAGING_DIR)/usr/include/ucd-snmp \
 	    -C $(NETSNMP_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/info
+endif
 	# Copy the .conf files.
-	mkdir -p $(TARGET_DIR)/etc/snmp
-	cp $(NETSNMP_DIR)/EXAMPLE.conf $(TARGET_DIR)/etc/snmp/snmpd.conf
-	cp $(NETSNMP_DIR)/EXAMPLE-trap.conf $(TARGET_DIR)/etc/snmp/snmptrapd.conf
+	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/EXAMPLE.conf $(TARGET_DIR)/etc/snmp/snmpd.conf
 	-mv $(TARGET_DIR)/usr/share/snmp/mib2c*.conf $(TARGET_DIR)/etc/snmp
-	mkdir -p $(TARGET_DIR)/etc/default
-	cp $(NETSNMP_DIR)/debian/snmpd.default $(TARGET_DIR)/etc/default/snmpd
 	# Remove the unsupported snmpcheck program
-	rm $(TARGET_DIR)/usr/bin/snmpcheck
+	rm -f $(TARGET_DIR)/usr/bin/snmpcheck
 	# Install the "broken" headers
-	cp $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/usr/include/net-snmp/agent
-	cp $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/usr/include/net-snmp
-	cp $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/usr/include/net-snmp/library
-	cp $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent
+	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/usr/include/net-snmp/agent/struct.h
+	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/usr/include/net-snmp/util_funcs.h
+	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/usr/include/net-snmp/library/mibincl.h
+	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent/header_complex.h
+	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd $(TARGET_DIR)/etc/init.d/S59snmpd
 
 netsnmp: openssl $(TARGET_DIR)/usr/sbin/snmpd
 
 netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
+	$(INSTALL) -d $(TARGET_DIR)/usr/include/net-snmp
 	cp -a $(STAGING_DIR)/usr/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
 	cp -a $(STAGING_DIR)/usr/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
 
@@ -119,6 +153,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_NETSNMP)),y)
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
 TARGETS+=netsnmp
 endif

Deleted: trunk/buildroot/package/netsnmp/netsnmp.patch
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.patch	2008-11-03 20:11:03 UTC (rev 23920)
+++ trunk/buildroot/package/netsnmp/netsnmp.patch	2008-11-04 11:26:52 UTC (rev 23921)
@@ -1,33 +0,0 @@
-diff -urN net-snmp-5.1-dist/agent/mibgroup/host/hr_system.c net-snmp-5.1/agent/mibgroup/host/hr_system.c
---- net-snmp-5.1-dist/agent/mibgroup/host/hr_system.c	2004-02-22 17:29:34.000000000 +0000
-+++ net-snmp-5.1/agent/mibgroup/host/hr_system.c	2005-05-27 15:15:52.363982808 +0100
-@@ -603,7 +603,11 @@
-                current user */
-             if (kill(utmp_p->ut_pid, 0) == -1 && errno == ESRCH) {
-                 utmp_p->ut_type = DEAD_PROCESS;
--                pututline(utmp_p);
-+#if HAVE_UTMPX_H
-+                pututxline(utmp_p);
-+#else
-+                pututline(utmp_p);
-+#endif
-                 continue;
-             }
- #endif
-diff -urN net-snmp-5.1-dist/configure.in net-snmp-5.1/configure.in
---- net-snmp-5.1-dist/configure.in	2004-03-31 21:59:14.000000000 -0600
-+++ net-snmp-5.1/configure.in	2004-03-31 22:06:05.000000000 -0600
-@@ -1865,13 +1865,8 @@
- if test $cross_compiling = yes; then
-   if test $with_endianness = "big"; then
-     AC_DEFINE(WORDS_BIGENDIAN)
--  elif test -z $with_endianness; then
--    AC_MSG_ERROR([You are cross-compiling, but you have not specified the target's endianness])
-   fi
- else
--  if test $with_endianness; then
--    AC_MSG_ERROR([Endianness has been specified, but you are not cross-compiling.])
--  fi
-   AC_C_BIGENDIAN
- fi
- 
